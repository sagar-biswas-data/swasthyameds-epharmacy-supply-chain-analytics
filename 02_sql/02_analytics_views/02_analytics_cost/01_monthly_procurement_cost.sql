CREATE OR REPLACE VIEW analytics_cost.monthly_procurement_cost AS
WITH po_monthly AS
(SELECT 
	DATE_TRUNC('month', po_date)::DATE AS po_month,

	SUM(ordered_quantity) AS purchase_order_volume,
	SUM(ordered_quantity*unit_procurement_cost) AS procurement_cost
FROM clean.fact_purchase_orders
WHERE po_status NOT IN ('Pending', 'Cancelled')
GROUP BY 
	DATE_TRUNC('month', po_date)::DATE

ORDER BY 
	DATE_TRUNC('month', po_date)::DATE),
	
po_metrics AS
(SELECT *,
	LAG(procurement_cost) OVER(
		ORDER BY po_month)
	AS prev_month_procurement
FROM po_monthly)

SELECT 
	po_month,
	purchase_order_volume,
	procurement_cost,
	CASE
		WHEN prev_month_procurement IS NULL OR prev_month_procurement = 0
            THEN NULL
        ELSE
            ROUND(
                ((procurement_cost - prev_month_procurement)/
				prev_month_procurement) * 100, 2)
    END AS mom_growth_pct,

	ROUND(
		procurement_cost / purchase_order_volume, 2)
	AS avg_cost_per_unit
FROM po_metrics;