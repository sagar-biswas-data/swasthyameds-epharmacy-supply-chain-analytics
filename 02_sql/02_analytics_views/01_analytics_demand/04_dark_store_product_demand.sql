CREATE OR REPLACE VIEW analytics_demand.dark_store_product_demand AS
WITH dark_store_demand AS 
(SELECT
	DATE_TRUNC('month', o.order_datetime)::DATE as order_month,
	d.dark_store_id,
	ds.dark_store_name,
	ds.city AS dark_store_city,
	ds.opening_date,
	oi.product_id,
	p.product_name,
	p.category,

	COUNT(DISTINCT oi.order_id) AS order_frequency,
	SUM(oi.quantity) AS order_volume

FROM clean.fact_orders AS o
JOIN clean.fact_order_items AS oi
	ON o.order_id = oi.order_id

JOIN clean.fact_deliveries AS d
	ON d.order_id = o.order_id

JOIN clean.dim_dark_stores AS ds
	ON ds.dark_store_id = d.dark_store_id

JOIN clean.dim_products AS p
	ON p.product_id = oi.product_id

GROUP BY 
	DATE_TRUNC('month', o.order_datetime)::DATE,
	d.dark_store_id,
	ds.dark_store_name,
	ds.city,
	ds.opening_date,
	oi.product_id,
	p.product_name,
	p.category)

SELECT 
	dark_store_id,
	dark_store_name,
	dark_store_city,

	(EXTRACT(YEAR FROM
		MAX(order_month) OVER(PARTITION BY dark_store_id)::DATE)*12
	+ EXTRACT(MONTH FROM
		MAX(order_month) OVER(PARTITION BY dark_store_id)::DATE))
	-
	(EXTRACT(YEAR FROM
		opening_date)*12
	+ EXTRACT(MONTH FROM
		opening_date)) + 1
	AS operating_months,

	product_id,
	product_name,
	category,
	order_frequency,
	order_volume
FROM dark_store_demand;