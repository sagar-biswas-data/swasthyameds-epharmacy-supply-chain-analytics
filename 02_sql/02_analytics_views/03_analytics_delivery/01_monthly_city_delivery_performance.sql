CREATE OR REPLACE VIEW analytics_delivery.monthly_city_delivery_performance AS
SELECT 
	DATE_TRUNC('month', order_datetime)::DATE AS order_month,
	customer_city AS order_city,

	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY promised_delivery_time_minutes):: NUMERIC,2) 
	AS avg_promised_delivery_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY picking_wait_minutes):: NUMERIC,2) 
	AS picking_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY picking_time_minutes):: NUMERIC,2) 
	AS picking_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY packing_wait_minutes):: NUMERIC,2) 
	AS packing_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY packing_time_minutes):: NUMERIC,2) 
	AS packing_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_assigned_wait_minutes):: NUMERIC,2) 
	AS de_assigned_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_arrival_minutes):: NUMERIC,2) AS de_arrival_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY de_pickup_wait_minutes):: NUMERIC,2) 
	AS de_pickup_wait_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY dispatch_delay_minutes):: NUMERIC,2) 
	AS dispatch_delay_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY last_mile_delivery_minutes):: NUMERIC,2) 
	AS last_mile_delivery_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY delivery_handover_minutes):: NUMERIC,2) 
	AS delivery_handover_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY total_delivery_time_minutes):: NUMERIC,2) 
	AS total_delivery_time_minutes,
	ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP
		(ORDER BY delivery_distance_km):: NUMERIC,2) 
	AS avg_delivery_distance_km
	
FROM analytics_delivery.order_delivery_time_minutes
WHERE delivery_status NOT IN ('Pending', 'Cancelled')

GROUP BY
	DATE_TRUNC('month', order_datetime)::DATE,
	customer_city
ORDER BY 
	DATE_TRUNC('month', order_datetime)::DATE;