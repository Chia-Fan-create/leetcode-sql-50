-- LeetCode 1757: Recyclable and Low Fat Products
-- Approach:
-- Use select product_id from the Products table where both low_fats and recyclable columns have the value 'Y'.
SELECT product_id from Products
WHERE low_fats = 'Y' and recyclable = 'Y'