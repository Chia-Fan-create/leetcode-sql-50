-- LeetCode 585: Investments in 2016
-- Approach:
-- 1. Use a subquery to find the tiv_2015 values that have duplicates in the Insurance table.
-- 2. Use another subquery to find the (lat, lon) pairs that are unique in the Insurance table.


SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN
(SELECT
    tiv_2015
FROM Insurance
GROUP BY tiv_2015
HAVING COUNT(*) > 1) AND 
    (lat, lon) IN (
        SELECT lat, lon
        FROM Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) =1
)
;
-- TO FIND NOT OF SAME CITY
-- SELECT
--     *
-- FROM Insurance
-- GROUP BY lat, lon
-- HAVING COUNT(*) = 1
-- ;