-- LeetCode 620: Not Boring Movies
-- Approach:
-- 1. Use % operator to filter movies with odd id
-- 2. Use WHERE clause to filter out movies with 'boring' description
-- 3. Use ORDER BY to sort the results by rating in descending order
SELECT *
FROM Cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC;