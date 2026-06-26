-- LeetCode 176: Second Highest Salary
-- Note:
-- * :Write a solution to find the second highest distinct salary from the Employee table.
-- meaning to merge the duplicate salaries into one distinct salary and then find the second highest salary from the merged distinct salaries.
-- it is not mean to remove the duplicate salaries from the Employee table.

-- my approach:
-- 1. Use a subquery to select the distinct salaries from the Employee table.
-- 2. Order the distinct salaries in descending order and use LIMIT and OFFSET to get the second highest salary.
SELECT
(SELECT
    salary
FROM Employee
GROUP BY salary
ORDER BY salary DESC
LIMIT 1 OFFSET 1
) AS SecondHighestSalary
;

-- Simplified version of the above query
SELECT (
    SELECT DISTINCT salary 
    FROM Employee 
    ORDER BY salary DESC 
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;