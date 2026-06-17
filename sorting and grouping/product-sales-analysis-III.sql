-- LeetCode 1070: Product Sales Analysis III
-- Approach:
-- My answer:
-- 1. Use JOIN to combine the Sales table with a subquery that retrieves the minimum year for each product_id.
-- 2. Filter the Sales table to include only the rows where the product_id and year
--    match the product_id and minimum year for each product_id in the Sales table.

SELECT
    s.product_id,
    s.year AS first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN
    (SELECT
    product_id,
    MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id) temp
ON s.product_id = temp.product_id AND s.year = temp.first_year
;


-- Solution from LeetCode:
-- 1. Use WHERE + IN and a subquery to filter the Sales table to include only the rows where the product_id and year match the product_id and minimum year for each product_id in the Sales table.

SELECT 
  product_id, 
  year AS first_year, 
  quantity, 
  price 
FROM 
  Sales 
WHERE 
  (product_id, year) IN (
    SELECT 
      product_id, 
      MIN(year) AS year 
    FROM 
      Sales 
    GROUP BY 
      product_id
  );