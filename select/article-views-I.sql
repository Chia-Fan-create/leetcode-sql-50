-- LeetCode 1148: Article Views I
-- Approach:
-- 1. Use select distinct avoiding duplicates from Views table
-- 2. Use AS to rename author_id to id
-- 3. Use OrDER BY to sort the result in ascending order
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC ;

-- Note: the equal using '=' in sql.