-- LeetCode 1141: User Activity for the Past 30 Days I
-- Approach:
-- 1. Use WHERE clause to filter the activity_date
-- 2. 30 days calculation '2019-07-27' - 30 days + 1 day = '2019-06-28'
-- 3. Use GROUP BY to group the data by activity_date

SELECT 
activity_date AS day,
COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date
;