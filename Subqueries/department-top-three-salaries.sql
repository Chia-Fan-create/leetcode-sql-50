-- LeetCode 185: Department Top Three Salaries
-- Approach:
-- 1. Use DENSE_RANK() window function to assign a rank to each employee's salary within their department.
-- * DENSE_RANK() OVER (PARTITION BY A ORDER BY B) assigns a rank to each row within a partition of the result set, with no gaps in ranking values.

SELECT
    Department,
    Employee,
    Salary
FROM
(SELECT
    d.name AS Department,
    e.name AS Employee,
    salary AS Salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
FROM Employee e
JOIN Department d
ON e.departmentId = d.id
) temp
WHERE temp.rnk <= 3
ORDER BY Department ASC, Salary DESC
;

-- Another approach of subquery using CTE (Common Table Expression)
WITH ranked AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary
FROM ranked
WHERE rnk <= 3;