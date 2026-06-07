-- LeetCode 1729: Find Followers Count
-- Approach:
-- 1. Use GROUP BY to group the data by user_id
-- 2. Use COUNT(DISTINCT follower_id) to count the number of unique followers for each user

SELECT
user_id,
COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id;