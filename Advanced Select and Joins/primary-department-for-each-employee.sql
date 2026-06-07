-- LeetCode 1789: Primary Department for Each Employee
-- Approach:
-- 1. ** Use UNION to combine two sets of results:
--    a. Employees that belong to only one department (using GROUP BY and HAVING)
--    b. Employees that have a primary department (using a simple WHERE clause)

SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1
UNION
SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
;
