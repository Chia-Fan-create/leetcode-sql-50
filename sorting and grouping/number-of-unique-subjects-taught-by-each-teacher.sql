-- LeetCode 2356: Number of Unique Subjects Taught by Each Teacher
-- Approach:
-- 1. Use GROUP BY to group the data by teacher_id
-- 2. Use COUNT(DISTINCT subject_id) to count the number of unique subjects taught by each teacher

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;