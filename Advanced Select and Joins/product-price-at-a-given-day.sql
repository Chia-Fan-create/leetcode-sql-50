-- LeetCode 1164: Product Price at a Given Day
-- NOTE:
-- 1. First part:
    -- Use GROUP BY and HAVING to filter products that have no price change before '2019-08-16'.
    -- 10 AS price # assigne the default price to those products.
-- 2. Second part:
    -- Use a subquery to find the latest price change for each product on or before '2019-08-16'.
    -- Use IN to filter the products that have a price change on or before '2019-08-16' and retrieve their new price.
-- 3. Use UNION ALL to combine the results from both parts
-- Note: UNION ALL is more efficient than UNION 
-- because it does not require an additional step to remove duplicates.

SELECT 
    product_id,
    10 AS price # learn sth new!!
FROM Products 
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'
UNION ALL # more efficiency than UNION
SELECT
    product_id,
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT
        product_id,
        MAX(change_date)
    FROM 
        Products
    WHERE 
        change_date <= '2019-08-16'
    GROUP BY product_id
)
;
