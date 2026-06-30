-- LeetCode 1321: Restaurant Growth
-- Approach:
-- 1. Use a subquery to calculate the total amount spent by customers on each visited_on date.
-- 2. Join the subquery with itself to calculate the total amount spent in the last 7 days for each visited_on date.
-- 3. Use HAVING clause to filter out the dates where there are not enough data points (less than 7 days).
-- GROUP BY a.visited_on to get the total amount and average amount for each visited_on date.


SELECT 
    a.visited_on,
    SUM(b.day_total) AS amount,
    ROUND(SUM(b.day_total) / 7, 2) AS average_amount
FROM (
    SELECT visited_on, SUM(amount) AS day_total
    FROM Customer
    GROUP BY visited_on
) a
JOIN (
    SELECT visited_on, SUM(amount) AS day_total
    FROM Customer
    GROUP BY visited_on
) b
ON b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on
GROUP BY a.visited_on
HAVING COUNT(b.visited_on) = 7
ORDER BY a.visited_on
;


