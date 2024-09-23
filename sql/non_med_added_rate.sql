USE ALTO_PHARMACY

-- non_med_added_rate before checkout
SELECT 
  (COUNT(case when customer_added_non_med_to_order = 1 THEN 1 else NULL END)+0.0)/COUNT(*)*100 as non_med_added_rate
FROM 
  modealto.checkout_attempts

-- non_med_added_rate before checkout Break Down by Month
SELECT 
  YEAR(checkout_started_at) AS check_out_year, 
  MONTH(checkout_started_at) AS check_out_month,
  (COUNT(CASE WHEN customer_added_non_med_to_order = 1 THEN 1 ELSE NULL END) + 0.0) / COUNT(*) * 100 AS non_med_added_rate
FROM 
  modealto.checkout_attempts
GROUP BY 
  YEAR(checkout_started_at), 
  MONTH(checkout_started_at)
ORDER BY 
  YEAR(checkout_started_at), 
  MONTH(checkout_started_at);

-- non_med_added_rate after checkout
SELECT 
  (COUNT(case when customer_added_non_med_to_order = 1 THEN 1 else NULL END)+0.0)/COUNT(*)*100 as non_med_added_rate
FROM 
  modealto.checkout_attempts
WHERE 
  order_id is not NULL;

-- non_med_added_rate after checkout Break Down by Month
SELECT 
  YEAR(checkout_started_at) AS check_out_year, 
  MONTH(checkout_started_at) AS check_out_month,
  (COUNT(CASE WHEN customer_added_non_med_to_order = 1 THEN 1 ELSE NULL END) + 0.0) / COUNT(*) * 100 AS non_med_added_rate
FROM 
  modealto.checkout_attempts
WHERE 
  order_id IS NOT NULL
GROUP BY 
  YEAR(checkout_started_at), 
  MONTH(checkout_started_at)
ORDER BY 
  YEAR(checkout_started_at), 
  MONTH(checkout_started_at);
