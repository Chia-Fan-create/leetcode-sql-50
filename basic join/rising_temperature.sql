-- -- LeetCode 197: Rising Temperature
-- Approach:
-- 1. Use JOIN to combine the Weather table with itself
-- 2. Use DATEDIFF to find records where the date difference is 1 day
SELECT today.id
FROM Weather today
JOIN Weather yesterday
ON DATEDIFF(today.recordDate, yesterday.recordDate)= 1 -- ON is used to specify the join condition
WHERE today.temperature > yesterday.temperature; -- WHERE clause filters records