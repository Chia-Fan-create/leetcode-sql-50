-- LeetCode 1667: Fix Names in a Table
-- Approach:
-- 1. Use CONCAT to concatenate the first letter of the name in uppercase and the rest of the name in lowercase
-- ** CONCAT(UPPER(LEFT(column_name, 1)), LOWER(SUBSTRING(column_name, 2))) AS title_case

SELECT
user_id,
CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name
FROM Users
ORDER BY user_id ASC;