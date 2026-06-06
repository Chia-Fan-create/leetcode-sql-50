-- LeetCode 1633: Percentage of Users Attending a Contest
-- Approach:
-- 1. Use COUNT(*) to get the total number of users
-- 2. Use COUNT(DISTINCT user_id) to get the number of unique users attending the contest
-- 3. Calculate the percentage by dividing the number of unique users by the total number of users and multiplying by 100
SELECT contest_id, 
    ROUND(COUNT(DISTINCT user_id) * 100.0 / 
    (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY 
    percentage DESC,
    contest_id ASC
    ;

-- method 2: use OVER() to calculate the total number of users in the same query

SELECT r.contest_id, 
    -- Over() function to calculate the total number of users in the same query, and then calculate the percentage
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / COUNT(DISTINCT u.user_id) OVER(), 2) AS percentage
FROM Register r
-- use RIGHT JOIN to make sure we include all users, even those who haven't registered for any contest (they will have NULL in r.contest_id)
RIGHT JOIN Users u ON r.user_id = u.user_id
-- Filter out rows where contest_id is NULL, which means those users didn't attend any contest, we only want to calculate percentage for contests that have attendees
WHERE r.contest_id IS NOT NULL
GROUP BY r.contest_id
ORDER BY 
    percentage DESC,
    r.contest_id ASC;

-- method 3: use CROSS JOIN to get the total number of users in a subquery, and then calculate the percentage in the main query

SELECT 
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100 / u.total_users, 2) AS percentage
FROM Register r
CROSS JOIN (
    SELECT COUNT(*) AS total_users FROM Users
) u
GROUP BY r.contest_id, u.total_users
ORDER BY percentage DESC, contest_id ASC;