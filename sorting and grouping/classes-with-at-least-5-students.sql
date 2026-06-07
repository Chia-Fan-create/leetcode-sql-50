-- LeetCode 596: Classes With At Least 5 Students
-- Approach:
-- 1. Use GROUP BY to group the data by class
-- 2. **Use HAVING clause to filter the groups that have at least 5 students
-- SQL syntax for GROUP BY and HAVING:
-- SELECT column_name, AGGREGATE_FUNCTION(column_name)
-- FROM table_name
-- WHERE individual_row_condition
-- GROUP BY column_name
-- HAVING aggregate_condition;

SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;