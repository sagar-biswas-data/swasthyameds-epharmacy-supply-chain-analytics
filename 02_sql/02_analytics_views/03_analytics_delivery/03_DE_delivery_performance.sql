CREATE OR REPLACE VIEW analytics_delivery.DE_delivery_performance AS 
SELECT 
	assigned_de_id,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_assigned_wait_minutes):: NUMERIC,2) AS de_assigned_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_arrival_minutes):: NUMERIC,2) AS de_arrival_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_pickup_wait_minutes):: NUMERIC,2) AS de_pickup_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY dispatch_delay_minutes):: NUMERIC,2) AS dispatch_delay_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY last_mile_delivery_minutes):: NUMERIC,2) AS last_mile_delivery_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY delivery_handover_minutes):: NUMERIC,2) AS delivery_handover_minutes
FROM analytics_delivery.order_delivery_time_minutes
WHERE assigned_de_id IS NOT NULL

GROUP BY assigned_de_id

ORDER BY assigned_de_id;
	
	