CREATE OR REPLACE VIEW analytics_demand.product_demand_monthly AS
SELECT 
	oi.product_id,
	DATE_TRUNC('month', o.order_datetime)::DATE AS order_month,
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
	oi.product_id,
	DATE_TRUNC('month', o.order_datetime)::DATE,
	p.product_name,
	p.category;