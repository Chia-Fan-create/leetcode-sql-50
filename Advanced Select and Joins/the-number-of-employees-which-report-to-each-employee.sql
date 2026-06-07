-- LeetCode 1731: The Number of Employees Which Report to Each Employee
-- Approach:
-- 1. Use LEFT JOIN and ON to connect the Employees table with itself
-- 2. Use GROUP BY to group the data by reports_to
-- 3. Use ORDER BY to sort the results by employee_id in ascending order

SELECT
e1.reports_to AS employee_id,
e2.name AS name,
COUNT(e1.reports_to) AS reports_count,
ROUND(AVG(e1.age),0) AS average_age
FROM Employees e1
LEFT JOIN Employees e2
ON e1.reports_to = e2.employee_id 
WHERE e1.reports_to IS NOT NULL
GROUP BY e1.reports_to
ORDER BY e1.reports_to ASC
;