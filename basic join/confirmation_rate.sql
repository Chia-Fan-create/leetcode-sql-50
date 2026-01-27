-- LeetCode 1934: Confirmation Rate
-- Approach:
-- 1. Use a LEFT JOIN to combine the Signups and Confirmations tables on user_id.
-- 2. Use AVG with a conditional expression to calculate the confirmation rate for each user.
-- 3. Group the results by user_id to get the confirmation rate per user.
SELECT s.user_id,
    ROUND(AVG(c.action = 'confirm',1,0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;