-- LeetCode 1174: Immediate Food Delivery II
-- Approach:
-- 1. Use GROUP BY to group deliveries by customer_id
-- 2. Use subquery method to calculate the minimum order_date and customer_pref_delivery_date for each customer_id
-- 2. Use CASE statement to categorize deliveries as immediate (1) or not (0) based on the comparison of order_date and customer_pref_delivery_date
-- 3. Use SUM and COUNT to calculate the percentage of immediate deliveries, and ROUND to format the result to 2 decimal places


SELECT 
ROUND(100*SUM(category)/COUNT(*),2) AS immediate_percentage
FROM
(SELECT
    CASE
        WHEN MIN(order_date) = MIN(customer_pref_delivery_date)
        THEN 1
        ELSE 0
    END AS category
FROM Delivery
GROUP BY customer_id) AS temp
;