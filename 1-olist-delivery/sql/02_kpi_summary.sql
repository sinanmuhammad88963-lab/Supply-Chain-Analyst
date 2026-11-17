SELECT COUNT(*) AS total_orders,
  ROUND(AVG(julianday(order_delivered_customer_date)
          - julianday(order_purchase_timestamp)), 1) AS avg_delivery_days,
  ROUND(100.0 * SUM(CASE WHEN order_delivered_customer_date
          <= order_estimated_delivery_date THEN 1 ELSE 0 END)
          / COUNT(*), 1) AS on_time_pct
FROM olist_orders_dataset
WHERE order_status = 'delivered'
  AND order_delivered_customer_date != '';