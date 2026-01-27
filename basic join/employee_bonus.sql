-- -- LeetCode 577: Employee Bonus
-- Approach:
-- 1. Use LEFT JOIN and ON to combine employees and bonuses tables based on empId
-- 2. Use WHERE clause to filter for bonuses less than 1000 or NULL bonuses
SELECT e.name, b.bonus
FROM employees e
LEFT JOIN bonuses b 
ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
-- Note:
-- ON is used to specify the join condition between two tables
