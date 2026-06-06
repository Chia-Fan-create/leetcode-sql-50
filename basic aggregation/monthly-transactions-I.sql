-- LeetCode 1193: Monthly Transactions I
-- Approach:
-- 1. Use DATE_FORMAT to extract the year and month from trans_date
-- 2. Group by the extracted month and country
-- 3. Calculate the required aggregates using COUNT and SUM with CASE statements to differentiate between approved and all transactions

SELECT 
DATE_FORMAT(trans_date, '%Y-%m') AS month,
country,
COUNT(id) AS trans_count,
COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE 
        WHEN state = 'approved' 
        THEN amount 
        ELSE 0
    END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;