-- LeetCode 1045: Customer Who Bought All Products
-- Approach:
-- 1. Use GROUP BY to group the customers by their ID
-- 2. Use HAVING to filter the customers who bought all products 
-- 3. Use a subquery to count the total number of products in the Product table and compare it with 
--    the count of distinct products bought by each customer

SELECT
customer_id
FROM
Customer c
GROUP BY customer_id
HAVING COUNT( DISTINCT c.product_key) = 
(SELECT
COUNT(*)
FROM
Product) 
;