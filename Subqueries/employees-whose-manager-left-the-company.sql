-- LeetCode 1978: Employees Whose Manager Left the Company
-- Approach:
-- 1. Use NOT IN method:
-- SELECT * FROM Table1 WHERE Table1.principal NOT IN (SELECT principal FROM table2)

SELECT 
employee_id
FROM Employees 
WHERE salary < 30000 AND manager_id NOT IN 
(SELECT employee_id FROM Employees)
ORDER BY employee_id ASC;