CREATE OR REPLACE VIEW analytics_delivery.monthly_dark_store_delivery_performance AS
SELECT 
	DATE_TRUNC('month', order_datetime)::DATE AS order_month,
	dark_store_id,

	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP 
		(ORDER BY picking_wait_minutes):: NUMERIC ,2) AS picking_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY picking_time_minutes):: NUMERIC,2) AS picking_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY packing_wait_minutes):: NUMERIC,2) AS packing_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY packing_time_minutes):: NUMERIC,2) AS packing_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_assigned_wait_minutes):: NUMERIC,2) AS de_assigned_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY total_delivery_time_minutes):: NUMERIC,2) AS total_delivery_time_minutes
FROM analytics_delivery.order_delivery_time_minutes
WHERE delivery_status NOT IN ('Pending', 'Cancelled')

GROUP BY
	dark_store_id,
	DATE_TRUNC('month', order_datetime)::DATE
	
ORDER BY 
	dark_store_id,
	DATE_TRUNC('month', order_datetime)::DATE;