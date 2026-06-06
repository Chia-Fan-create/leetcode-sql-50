-- LeetCode 1075: Project Employees I
-- Approach:
-- 1. Use LEFT JOIN to combine the Project table with the Employee table
-- 2. Use SUM to calculate the total experience years for each project
-- 3. Use COUNT to count the number of employees for each project
-- 4. Use ROUND to round the average years to 2 decimal places
-- 5. Group the results by project_id
SELECT 
    project_id, 
    ROUND(SUM(e.experience_years)/COUNT(e.employee_id),2) AS average_years
FROM Project p
LEFT JOIN Employee e
ON 
    p.employee_id = e.employee_id
GROUP BY 
    project_id;