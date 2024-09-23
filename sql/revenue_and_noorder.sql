USE ALTO_PHARMACY

-- Revenue and number of orders
SELECT  
  YEAR(checkout_completed_at) AS check_out_year, 
  MONTH(checkout_completed_at) AS check_out_month,
  SUM(order_total_dollars) AS Revenue, 
  COUNT(*) AS Number_of_Order
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
ON os.order_id = ca.order_id
WHERE
  delivery_status = 'delivered'
GROUP BY 
  YEAR(checkout_completed_at),
  MONTH(checkout_completed_at)
ORDER BY 
  YEAR(checkout_completed_at),
  MONTH(checkout_completed_at);

-- Revenue and number of orders breakdown by month
SELECT  
  YEAR(checkout_completed_at) AS check_out_year, 
  MONTH(checkout_completed_at) AS check_out_month,
  SUM(order_total_dollars) AS Revenue, 
  COUNT(*) AS Number_of_Order
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
ON os.order_id = ca.order_id
WHERE
  delivery_status = 'delivered'
GROUP BY 
  YEAR(checkout_completed_at),
  MONTH(checkout_completed_at)
ORDER BY 
  YEAR(checkout_completed_at),
  MONTH(checkout_completed_at);
