CREATE OR REPLACE VIEW analytics_cost.monthly_supplier_product_procurement AS
WITH supplier_procurement AS
(SELECT 
	DATE_TRUNC('month', po.po_date)::DATE AS po_month,
	po.supplier_id,
	po.product_id,
	
	SUM(po.ordered_quantity) AS procurement_volume,
	SUM(po.ordered_quantity * po.unit_procurement_cost)
	AS procurement_cost,

	ROUND(
		100.0* SUM(po.received_quantity)/
		SUM(po.ordered_quantity), 2)
	AS monthly_fulfillment_rate,

	ROUND(AVG(actual_lead_time_days), 2)
	AS avg_lead_time_days
FROM clean.fact_purchase_orders AS po

GROUP BY
	DATE_TRUNC('month', po.po_date)::DATE,
	po.supplier_id,
	po.product_id)

SELECT 
	sp.po_month,
	sp.supplier_id,
	s.supplier_name,
	s.supplier_type,
	sp.product_id,
	p.product_name,
	p.category,
	s_p.minimum_order_qty,
	sp.procurement_volume,
	sp.procurement_cost,
	sp.monthly_fulfillment_rate,
	sp.avg_lead_time_days
FROM supplier_procurement AS sp
JOIN clean.dim_suppliers AS s
	ON sp.supplier_id = s.supplier_id
	
JOIN clean.dim_products AS p
	ON sp.product_id = p.product_id

JOIN clean.dim_supplier_products AS s_p
	ON 	sp.supplier_id = s_p.supplier_id
	AND sp.product_id = s_p.product_id
	
ORDER BY
	sp.po_month,
	sp.supplier_id,
	sp.product_id