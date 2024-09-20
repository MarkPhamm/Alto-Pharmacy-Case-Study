-- non_med_added_rate
SELECT 
  (COUNT(case when customer_added_non_med_to_order = TRUE THEN 1 else NULL END)+0.0)/COUNT(*)*100 as non_med_added_rate
FROM 
  modealto.checkout_attempts
-- WHERE 
--   order_id is not NULL

-- non_med_added_rate Break Down by Month
SELECT 
  EXTRACT(YEAR FROM checkout_started_at) as check_out_year, 
  EXTRACT(MONTH FROM checkout_started_at) as check_out_month,
  (COUNT(case when customer_added_non_med_to_order = TRUE THEN 1 else NULL END)+0.0)/COUNT(*)*100 as non_med_added_rate
FROM 
  modealto.checkout_attempts
-- WHERE 
--   order_id is not NULL
GROUP BY 
  EXTRACT(YEAR FROM checkout_started_at), 
  EXTRACT(MONTH FROM checkout_started_at)
ORDER BY 
  EXTRACT(YEAR FROM checkout_started_at), 
  EXTRACT(MONTH FROM checkout_started_at)


-- Checkout Rate
SELECT 
    ROUND((COUNT(checkout_completed_at) + 0.0) / COUNT(*) * 100, 2) AS check_out_rate
FROM 
    modealto.checkout_attempts;

-- Checkout Rate Break Down By Month
SELECT 
  EXTRACT(YEAR FROM checkout_started_at) as check_out_year, 
  EXTRACT(MONTH FROM checkout_started_at) as check_out_month,
  ROUND((COUNT(checkout_completed_at)+0.0)/COUNT(*)*100,2) as check_out_rate
FROM 
  modealto.checkout_attempts
GROUP BY 
  EXTRACT(YEAR FROM checkout_started_at),
  EXTRACT(MONTH FROM checkout_started_at) 
ORDER BY 
  EXTRACT(YEAR FROM checkout_started_at),
  EXTRACT(MONTH FROM checkout_started_at) 

-- Delivery Rate
SELECT 
    ROUND((COUNT(delivered_date)+0.0)/COUNT(*)*100,2) AS delivery_rate
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
USING (order_id)

-- Delivery Rate Break Down By Month
SELECT 
  EXTRACT(YEAR FROM checkout_completed_at) as check_out_year, 
  EXTRACT(MONTH FROM checkout_completed_at) as check_out_month,
  ROUND((COUNT(CASE WHEN delivery_status = 'delivered' THEN 1 ELSE NULL END)+0.0)/COUNT(*)*100,2) AS delivery_rate
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
USING (order_id)
GROUP BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 
ORDER BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 
  
-- AVG order value
SELECT  
  AVG(CASE WHEN customer_added_non_med_to_order = TRUE THEN order_total_dollars ELSE NULL END) as non_med_added_avg_order_value,
  AVG(CASE WHEN customer_added_non_med_to_order = FALSE THEN order_total_dollars ELSE NULL END) as non_med_not_added_avg_order_value
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
USING(order_id)
WHERE
  delivery_status = 'delivered';
  
-- Revenue and number of order
SELECT  
  EXTRACT(YEAR FROM checkout_completed_at) as check_out_year, 
  EXTRACT(MONTH FROM checkout_completed_at) as check_out_month,
  SUM(order_total_dollars) as Revenue, 
  COUNT(*) as Number_of_Order
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
USING(order_id)
WHERE
  delivery_status = 'delivered'
GROUP BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 
ORDER BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 

-- Revenue and number of order breakdown by month
SELECT  
  EXTRACT(YEAR FROM checkout_completed_at) as check_out_year, 
  EXTRACT(MONTH FROM checkout_completed_at) as check_out_month,
  SUM(order_total_dollars) as Revenue, 
  COUNT(*) as Number_of_Order
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
USING(order_id)
WHERE
  delivery_status = 'delivered'
GROUP BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 
ORDER BY 
  EXTRACT(YEAR FROM checkout_completed_at),
  EXTRACT(MONTH FROM checkout_completed_at) 
  