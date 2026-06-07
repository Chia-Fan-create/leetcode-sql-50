-- LeetCode 1484: Group Sold Products by the Date
-- Approach:
-- 1. Use GROUP_CONCAT to concatenate the products
-- ** GROUP_CONCAT(tag SEPARATOR ', ')

SELECT
sell_date,
COUNT(DISTINCT product) AS num_sold,
GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
;