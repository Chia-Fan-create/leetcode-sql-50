-- LeetCode 550: Game Play Analysis IV
-- Approach:
-- * Make sure to retrieve the initial date of each player 
--   by using a subquery that groups the Activity table by player_id and selects the minimum activity_date as initial_date.
-- 1. Use JOIN to combine the Activity table with the subquery that retrieves the initial date of each player.
-- 2. Use ABS and DATEDIFF to calculate the absolute difference in days between the activity_date and the initial_date for each player.


SELECT
    ROUND(COUNT(DISTINCT a1.player_id) /
    (SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM Activity a1
JOIN (
    SELECT player_id, MIN(activity_date) AS initial_date
    FROM Activity
    GROUP BY player_id
) AS temp 
ON a1.player_id = temp.player_id AND 
    ABS(DATEDIFF(a1.activity_date, temp.initial_date)) = 1
;
