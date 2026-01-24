-- LeetCode 1378: Replace Employee ID With The Unique Identifier
-- Approach:
-- 1. LEFT JOIN ensures all records from Employees are included
-- 2. ON clause matches Employees.id with EmployeeUNI.id
SELECT unique_id, name
FROM Employees e
LEFT JOIN EmployeeUNI uni 
ON e.id = uni.id;