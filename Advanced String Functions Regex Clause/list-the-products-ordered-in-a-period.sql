-- LeetCode 1327: List the Products Ordered in a Period
-- Approach:
-- Note:
-- remember the implement steps and the order of the steps when using aggregate functions:
-- 1. Use WHERE clause to filter the records based on the date range (WHERE CANNOT USE aggregate functions!!!)
-- 2. Use GROUP BY clause to group the records by product_id
-- 3. Use HAVING clause to filter the groups based on the aggregate function

SELECT
    product_name,
    SUM(unit) AS unit
FROM
    Products p
LEFT JOIN
    Orders o
ON p.product_id = o.product_id
WHERE MONTH(order_date) = '02' AND YEAR(order_date) = '2020' 
GROUP BY o.product_id
HAVING unit >= 100
;