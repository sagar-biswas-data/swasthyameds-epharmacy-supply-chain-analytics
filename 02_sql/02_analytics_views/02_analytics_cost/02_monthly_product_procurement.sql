CREATE OR REPLACE VIEW analytics_cost.monthly_product_procurement AS
WITH demand AS
(SELECT 
	DATE_TRUNC('month', o.order_datetime)::DATE AS order_month,
	oi.product_id,
	SUM(oi.quantity) AS demand_volume
	
FROM clean.fact_order_items AS oi
JOIN clean.fact_orders AS o
	ON o.order_id = oi.order_id

GROUP BY 
	DATE_TRUNC('month', o.order_datetime)::DATE,
	oi.product_id

ORDER BY
	oi.product_id,
	order_month),

procurement AS
(SELECT 
	DATE_TRUNC('month', po_date)::DATE AS po_month,
	product_id,
	
	SUM(ordered_quantity) AS procurement_volume,
	SUM(ordered_quantity * unit_procurement_cost)
	AS procurement_cost

FROM clean.fact_purchase_orders
WHERE po_status IN ('Received', 'Partially Received')

GROUP BY 
	DATE_TRUNC('month', po_date)::DATE,
	product_id

ORDER BY
	product_id,
	po_month),

monthly_data AS
(SELECT 
	d.order_month AS po_month,

	d.product_id,

	COALESCE(d.demand_volume, 0) AS demand_volume,

	COALESCE(p.procurement_volume, 0) AS procurement_volume,

	COALESCE(p.procurement_cost, 0) AS procurement_cost

FROM demand AS d
FULL OUTER JOIN procurement p
	ON d.order_month = p.po_month
		AND d.product_id = p.product_id)

SELECT
	md.po_month,
	p.product_id,

	p.product_name,
	p.category,
	p.shelf_life_days,

	md.demand_volume,
	md.procurement_volume,
	md.procurement_cost,

	SUM(md.demand_volume) OVER(
		PARTITION BY md.product_id
		ORDER BY md.po_month
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW) AS cumulative_demand_volume,

	SUM(md.procurement_volume) OVER(
		PARTITION BY md.product_id
		ORDER BY md.po_month
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW) AS cumulative_procurement_volume

FROM monthly_data AS md
JOIN clean.dim_products AS p
	ON p.product_id = md.product_id

ORDER BY
	p.product_id,
	md.po_month
	