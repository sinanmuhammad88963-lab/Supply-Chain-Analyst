SELECT c.customer_state,
  COUNT(*) AS total_orders,
  SUM(CASE WHEN o.order_delivered_customer_date
           > o.order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_orders,
  ROUND(100.0 * SUM(CASE WHEN o.order_delivered_customer_date
           > o.order_estimated_delivery_date THEN 1 ELSE 0 END)
           / COUNT(*), 1) AS late_pct
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
  ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date != ''
GROUP BY c.customer_state
ORDER BY late_pct DESC;