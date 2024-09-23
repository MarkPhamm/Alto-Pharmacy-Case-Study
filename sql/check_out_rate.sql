
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
  EXTRACT(MONTH FROM checkout_started_at);
  
