-- LeetCode 1251: Average Selling Price
-- Approach:
-- 1. Use GROUP BY to group the results by product_id
-- 2. Use LEFT JOIN to combine the Prices table with the UnitsSold table
-- 3. Use SUM to calculate the total revenue and total units sold for each product
-- 4. Use ROUND to round the average price to 2 decimal places
-- 5. Use BETWEEN to filter the UnitsSold records that fall within the price validity period
SELECT p.product_id,
ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id AND
u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;