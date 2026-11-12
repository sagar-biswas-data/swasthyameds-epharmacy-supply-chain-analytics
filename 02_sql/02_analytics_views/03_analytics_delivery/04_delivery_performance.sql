CREATE OR REPLACE VIEW analytics_delivery.order_delivery_time_minutes AS
WITH order_deliveries AS
(SELECT 
	o.order_id,
	o.customer_id,
	c.city AS customer_city,
	o.dark_store_id,
	ds.city AS dark_store_city,
	o.order_datetime,
	ROUND(EXTRACT(EPOCH FROM(
		o.promised_delivery_datetime - o.order_datetime))/ 60, 2)
	AS promised_delivery_time_minutes,
	o.total_items AS total_items_ordered,
	o.payment_type,
	o.order_status,

	ROUND(EXTRACT(EPOCH FROM(
		picking_start_datetime - order_received_datetime))/ 60, 2)
	AS picking_wait_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		picking_completed_datetime - picking_start_datetime))/ 60, 2)
	AS picking_time_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		packing_start_datetime - picking_completed_datetime))/ 60, 2)
	AS packing_wait_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		packing_completed_datetime - packing_start_datetime))/ 60, 2)
	AS packing_time_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		de_assigned_datetime - packing_completed_datetime))/ 60, 2)
	AS de_assigned_wait_minutes,
	
	d.de_id AS assigned_de_id,

	ROUND(EXTRACT(EPOCH FROM(
		de_arrival_datetime - de_assigned_datetime))/ 60, 2)
	AS de_arrival_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		order_picked_datetime - de_arrival_datetime))/ 60, 2)
	AS de_pickup_wait_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		out_for_delivery_datetime - order_picked_datetime))/ 60, 2)
	AS dispatch_delay_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		customer_arrival_datetime - out_for_delivery_datetime))/ 60, 2)
	AS last_mile_delivery_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		delivered_datetime - customer_arrival_datetime))/ 60, 2)
	AS delivery_handover_minutes,

	ROUND(EXTRACT(EPOCH FROM(
		delivered_datetime - order_received_datetime))/ 60, 2)
	AS total_delivery_time_minutes,

	d.delivery_status,

	ROUND(EXTRACT(EPOCH FROM(
		o.promised_delivery_datetime - d.delivered_datetime))/ 60, 2)
	AS diff_expectation_minutes,
	
	d.delivery_distance_km,
	d.delivery_attempts,
	d.failure_reason
	
FROM clean.fact_orders AS o
JOIN clean.fact_deliveries AS d
	ON o.order_id = d.order_id

JOIN clean.dim_customers AS c
	ON c.customer_id = o.customer_id

JOIN clean.dim_dark_stores AS ds
	ON ds.dark_store_id = d.dark_store_id
	
ORDER BY 
	o.order_id)
	
SELECT 
	order_id,
	customer_id,
	customer_city,
	dark_store_id,
	dark_store_city,
	order_datetime,
	promised_delivery_time_minutes,
	total_items_ordered,
	payment_type,
	order_status,
	picking_wait_minutes,
	picking_time_minutes,
	packing_wait_minutes,
	packing_time_minutes,
	de_assigned_wait_minutes,
	assigned_de_id,
	de_arrival_minutes,
	de_pickup_wait_minutes,
	dispatch_delay_minutes,
	last_mile_delivery_minutes,
	delivery_handover_minutes,
	total_delivery_time_minutes,
	delivery_status,

	CASE
		WHEN diff_expectation_minutes BETWEEN -10 AND +10
		THEN 'Delivered On-Time'

		WHEN diff_expectation_minutes < -10
		THEN 'Delayed'

		WHEN diff_expectation_minutes > 10
		THEN 'Arrived Early'
		ELSE 'Not Delivered'
	END AS delivery_time_status,

	CASE
		WHEN diff_expectation_minutes BETWEEN -10 AND +10
		THEN 0.0

		WHEN diff_expectation_minutes < -10
		THEN ABS(diff_expectation_minutes)

		WHEN diff_expectation_minutes > 10
		THEN ABS(diff_expectation_minutes)
		ELSE NULL
	END AS by_minutes,

	delivery_distance_km,
	delivery_attempts,
	failure_reason
	
FROM order_deliveries;