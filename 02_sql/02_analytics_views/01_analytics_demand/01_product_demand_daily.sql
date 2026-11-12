CREATE OR REPLACE VIEW analytics_demand.product_demand_daily AS
SELECT 
	o.order_datetime:: DATE AS order_date,
	oi.product_id,
	p.product_name,
	p.category,

	COUNT(DISTINCT oi.order_id) AS total_times_ordered,
	SUM(oi.quantity) AS total_quantity_ordered
FROM clean.fact_orders AS o
JOIN clean.fact_order_items AS oi
	ON o.order_id = oi.order_id
	
JOIN clean.dim_products AS p
	ON oi.product_id = p.product_id
	
GROUP BY 
	o.order_datetime:: DATE,
	oi.product_id,
	p.product_name,
	p.category;