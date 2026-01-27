-- LeetCode 570: Managers with at least 5 direct reports
-- Approach:
-- 1. Use JOIN to combine employees table with itself to link managers and their direct reports
-- 2. Use GROUP BY to group by manager's empId and name
-- 3. Use HAVING to filter for managers with at least 5 direct reports
SELECT e1.name 
FROM employees e1
JOIN employees e2 
ON e1.empId = e2.managerId
GROUP BY e1.empId, e1.name -- Group by manager's empId and name in case of duplicate names
HAVING COUNT(e2.empId) >= 5; 