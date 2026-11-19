WITH seller_orders AS (
  SELECT DISTINCT i.seller_id, o.order_id,
    CASE WHEN o.order_delivered_customer_date
              > o.order_estimated_delivery_date THEN 1 ELSE 0 END AS is_late
  FROM olist_orders_dataset o
  JOIN olist_order_items_dataset i
    ON o.order_id = i.order_id
  WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date != ''
)
SELECT seller_id,
  COUNT(*) AS total_orders,
  SUM(is_late) AS late_orders,
  ROUND(100.0 * SUM(is_late) / COUNT(*), 1) AS late_pct
FROM seller_orders
GROUP BY seller_id
HAVING COUNT(*) >= 50
ORDER BY late_pct DESC
LIMIT 10;