-- AVG order value
SELECT  
  AVG(CASE WHEN customer_added_non_med_to_order = 1 THEN order_total_dollars ELSE NULL END) as non_med_added_avg_order_value,
  AVG(CASE WHEN customer_added_non_med_to_order = 0 THEN order_total_dollars ELSE NULL END) as non_med_not_added_avg_order_value
FROM 
  modealto.checkout_attempts ca
JOIN 
  modealto.order_status os
ON os.order_id = ca.order_id
WHERE
  delivery_status = 'delivered';