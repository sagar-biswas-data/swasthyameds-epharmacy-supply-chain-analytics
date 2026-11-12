CREATE OR REPLACE VIEW analytics_demand.city_product_demand AS
WITH city_demand AS
(SELECT
	DATE_TRUNC('month', o.order_datetime)::DATE as order_month,
	c.city AS order_city,
	oi.product_id,
	p.product_name,
	p.category,

	COUNT(DISTINCT oi.order_id) AS total_times_ordered,
	SUM(oi.quantity) AS total_quantity_ordered
	
FROM clean.fact_orders AS o
JOIN clean.dim_customers AS c
	ON o.customer_id = c.customer_id

JOIN clean.fact_order_items AS oi
	ON o.order_id = oi.order_id

JOIN clean.dim_products AS p
	ON oi.product_id = p.product_id

GROUP BY 
	DATE_TRUNC('month', o.order_datetime)::DATE,
	c.city,
	oi.product_id,
	p.product_name,
	p.category),

month_city AS
(SELECT 
	order_month,
	order_city,
	MIN(order_month) OVER(PARTITION BY order_city)::DATE
	AS starting_month,
	MAX(order_month) OVER(PARTITION BY order_city)::DATE
	AS current_month,
	product_id,
	product_name,
	category,
	total_times_ordered,
	total_quantity_ordered
FROM city_demand
ORDER BY order_month)

SELECT 
	order_month,
	order_city,
	
	(EXTRACT(YEAR FROM
		current_month)*12
	+ EXTRACT(MONTH FROM
		current_month))
	-
	(EXTRACT(YEAR FROM
		starting_month)*12
	+ EXTRACT(MONTH FROM
		starting_month)) + 1
	AS operating_months,
	
	product_id,
	product_name,
	category,
	total_times_ordered,
	total_quantity_ordered
FROM month_city;
