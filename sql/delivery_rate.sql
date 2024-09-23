USE ALTO_PHARMACY

-- Delivery Rate
SELECT 
    ROUND((COUNT(delivered_date) + 0.0) / COUNT(*) * 100, 2) AS delivery_rate
FROM 
    modealto.checkout_attempts ca
JOIN 
    modealto.order_status os
ON 
    os.order_id = ca.order_id;

-- Delivery Rate Break Down By Month
SELECT 
    YEAR(checkout_completed_at) AS check_out_year, 
    MONTH(checkout_completed_at) AS check_out_month,
    ROUND((COUNT(CASE WHEN delivery_status = 'delivered' THEN 1 ELSE NULL END) + 0.0) / COUNT(*) * 100, 2) AS delivery_rate
FROM 
    modealto.checkout_attempts ca
JOIN 
    modealto.order_status os
ON 
    os.order_id = ca.order_id
GROUP BY 
    YEAR(checkout_completed_at),
    MONTH(checkout_completed_at)
ORDER BY 
    YEAR(checkout_completed_at),
    MONTH(checkout_completed_at);
