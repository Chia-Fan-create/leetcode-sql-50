-- LeetCode 1683: Invalid Tweets
-- Approach:
-- 1. Use CHAR_LENGTH to get the length of content in Tweets table
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;