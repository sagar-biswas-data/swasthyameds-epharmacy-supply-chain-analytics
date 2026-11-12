CREATE OR REPLACE VIEW analytics_cost.supplier_product_efficiency AS
WITH supplier_efficiency AS
(SELECT 
	po.supplier_id,
	po.product_id,
	ROUND(100* AVG(fulfillment_rate),2)
	AS fulfillment_score,

	ROUND(AVG(po.unit_procurement_cost), 2)
	AS avg_unit_procurement_cost,

	PERCENTILE_CONT(0.5) WITHIN 
	GROUP(ORDER BY actual_lead_time_days)
	AS median_lead_time_days

FROM clean.fact_purchase_orders AS po

WHERE po_status NOT IN ('Cancelled', 'Pending')

GROUP BY 
	po.supplier_id,
	po.product_id
ORDER BY po.product_id),

metrics AS
(SELECT *,
	MAX(avg_unit_procurement_cost) OVER(
		PARTITION BY product_id)
	AS max_procurement_cost,

	MIN(avg_unit_procurement_cost) OVER(
		PARTITION BY product_id)
	AS min_procurement_cost,

	MAX(median_lead_time_days) OVER(
		PARTITION BY product_id)
	AS max_lead_time_days,

	MIN(median_lead_time_days) OVER(
		PARTITION BY product_id)
	AS min_lead_time_days
FROM supplier_efficiency),

product_demand AS
(SELECT 
	product_id,
	ROUND(
	SUM(quantity)/29, 2) AS monthly_demand_volume
FROM clean.fact_order_items
GROUP BY 
	product_id	
ORDER BY 
	product_id),

product_moq AS
(SELECT
	sp.supplier_id,
	sp.product_id,
	pd.monthly_demand_volume,
	
	ROUND((sp.minimum_order_qty /
	pd.monthly_demand_volume),2)
	AS moq_coverage

	
FROM clean.dim_supplier_products AS sp
LEFT JOIN product_demand AS pd
	ON sp.product_id = pd.product_id
	
ORDER BY 
	sp.product_id,
	sp.supplier_id),

minimum_order_qty_score AS
(SELECT 
	*,
	CASE
		WHEN moq_coverage <= 0.25 THEN 100.00

		WHEN moq_coverage <= 0.50 THEN 90.00

		WHEN moq_coverage <= 1.00 THEN 80.00

		WHEN moq_coverage <= 2.00 THEN 65.00

		WHEN moq_coverage <= 4.00 THEN 40.00

		WHEN moq_coverage <= 6.00 THEN 20.00
	ELSE 5
	END AS moq_score
FROM product_moq),

efficienct_suppliers AS
(SELECT
	m.supplier_id,
	m.product_id,
	fulfillment_score,

	CASE
		WHEN max_procurement_cost = min_procurement_cost
			THEN 100.00
		ELSE
			ROUND(
			100 * (max_procurement_cost - avg_unit_procurement_cost)/
			NULLIF((max_procurement_cost - min_procurement_cost),0), 2)
	END
	AS procurement_cost_score,

	CASE
		WHEN max_lead_time_days = min_lead_time_days
			THEN 100.00
		ELSE
			ROUND(
			100 * (max_lead_time_days - median_lead_time_days)::NUMERIC /
			NULLIF((max_lead_time_days - min_lead_time_days)::NUMERIC,0), 2)
	END
	AS lead_time_score,

	ms.moq_score
	
FROM metrics AS m
JOIN minimum_order_qty_score AS ms
	ON m.product_id = ms.product_id
	AND m.supplier_id = ms.supplier_id),

supplier_products_efficiency AS
(SELECT 
	supplier_id,
	product_id,
	fulfillment_score,
	procurement_cost_score,
	lead_time_score,
	moq_score,
	ROUND(
	(0.30*(fulfillment_score)+0.35*(procurement_cost_score)
	+0.20*(lead_time_score)+0.15*(moq_score)),2)
	AS efficiency_score
FROM efficienct_suppliers)

SELECT *,
	RANK() OVER(
		PARTITION BY product_id
		ORDER BY efficiency_score DESC)
	AS supplier_rank
FROM supplier_products_efficiency

ORDER BY
	product_id,
	supplier_rank;