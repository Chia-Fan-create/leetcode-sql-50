-- LeetCode 584: Find Customer Referee
-- Approach:
-- Use select name from Customer table where referee_id is not equal to 2 or is NULL.
SELECT name FROM Customer
WHERE referee_id != 2 OR referee_id is NULL
-- WHERE referee_id <> 2 OR referee_id is NULL
-- Note: 
-- 1. In SQL, both '!=' and '<>' are valid operators for 'not equal to'.
-- 2. The standard condition 'referee_id is NULL' cannot be 'referee_id = null'.