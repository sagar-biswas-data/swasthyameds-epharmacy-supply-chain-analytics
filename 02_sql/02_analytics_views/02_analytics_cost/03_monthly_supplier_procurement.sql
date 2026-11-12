CREATE OR REPLACE VIEW analytics_cost.monthly_supplier_procurement AS
WITH 
supplier_procurement AS
(SELECT 
	DATE_TRUNC('month', po.po_date)::DATE AS po_month,
	po.supplier_id,

	SUM(po.ordered_quantity) AS procurement_volume,
	SUM(po.ordered_quantity * po.unit_procurement_cost)
	AS procurement_cost,

	ROUND(AVG(discount_pct::NUMERIC), 2)
	AS avg_discount_pct,

	ROUND(
		100.0* SUM(po.received_quantity)/
		SUM(po.ordered_quantity), 2)
	AS monthly_fulfillment_rate,

	ROUND(AVG(actual_lead_time_days), 2)
	AS avg_lead_time_days
FROM clean.fact_purchase_orders AS po

GROUP BY
	DATE_TRUNC('month', po.po_date)::DATE,
	po.supplier_id)

SELECT 
	sp.po_month,
	sp.supplier_id,
	s.supplier_name,
	s.supplier_type,
	s.city,
	s.state,
	
	sp.procurement_volume,
	sp.procurement_cost,
	sp.avg_discount_pct,
	sp.monthly_fulfillment_rate,
	sp.avg_lead_time_days
FROM supplier_procurement AS sp
JOIN clean.dim_suppliers AS s
	ON sp.supplier_id = s.supplier_id

ORDER BY
	sp.po_month,
	sp.supplier_id