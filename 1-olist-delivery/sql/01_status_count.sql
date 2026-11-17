SELECT order_status, COUNT(*) AS orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY orders DESC;
