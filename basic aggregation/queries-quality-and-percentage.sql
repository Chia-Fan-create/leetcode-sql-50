-- LeetCode 1211: Queries Quality and Percentage
-- Approach:
-- 1. Use AVG() to calculate the average quality of each query
-- 2. Use COUNT() and CASE to calculate the percentage of queries that are in the top 3 positions
-- 3. Use GROUP BY to group the results by query_name

SELECT
    query_name,
    ROUND(AVG(rating/position),2) AS quality,
    ROUND(100* COUNT(
    CASE 
        WHEN position < 3 
        THEN 1 ELSE 0 END) / 
        COUNT(*),2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
;