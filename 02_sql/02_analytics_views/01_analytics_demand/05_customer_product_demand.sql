CREATE OR REPLACE VIEW analytics_demand.customer_product_demand AS
SELECT
	o.customer_id,
	oi.product_id,
	p.product_name,
	p.category,
	c.customer_segment,

	COUNT(DISTINCT oi.order_id) AS total_times_ordered,
	SUM(oi.quantity) AS total_quantity_ordered

FROM clean.fact_orders AS o
JOIN clean.fact_order_items AS oi
	ON o.order_id = oi.order_id

JOIN clean.dim_products AS p
	ON oi.product_id = p.product_id

JOIN clean.dim_customers AS c
	ON o.customer_id = c.customer_id

GROUP BY 
	o.customer_id,
	oi.product_id,
	p.product_name,
	p.category,
	c.customer_segment;