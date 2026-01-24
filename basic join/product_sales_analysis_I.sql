-- -- LeetCode 1068: Product Sales Analysis I
-- Approach:
-- 1. INNER JOIN ensures only records with matching product_id in both tables are included
-- 2. ON clause matches Product.product_id with Sales.product_id
SELECT p.product_name, s.year, s.price
FROM Sales s
INNER JOIN Product p
ON p.product_id = s.product_id;
-- Note:
-- INNER JOIN = JOIN