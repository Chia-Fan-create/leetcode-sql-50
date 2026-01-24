-- LeetCode 595: Big Countries
-- Approach:
-- Use select name, population, area from the World table where 
-- area is greater than or equal to 3000000 OR population is greater than or equal to 25000000.

SELECT name, population, area FROM World
WHERE area >= 3000000 or population >= 25000000;