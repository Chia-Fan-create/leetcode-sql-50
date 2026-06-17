-- LeetCode 619: Biggest Single Number
-- How I solved it:
-- 1. Use GROUP BY to group the numbers and HAVING COUNT(*) = 1 to filter out the numbers that appear more than once
-- 2. Use MAX to get the biggest single number

SELECT
MAX(num) AS num
FROM 
(SELECT
*
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1) AS temp
; 