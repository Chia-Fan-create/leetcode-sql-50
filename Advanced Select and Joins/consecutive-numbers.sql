-- LeetCode 180: Consecutive Numbers
-- Approach1:
-- *Use self-join to connect the Logs table with itself three times (l1, l2, l3) to compare consecutive rows.
-- 1. Use the WHERE clause to ensure that the IDs of the joined rows are consecutive (l1.id = l2.id - 1 and l2.id = l3.id - 1).

SELECT 
    l3.num AS ConsecutiveNums
FROM 
    Logs l1,
    Logs l2,
    Logs l3
WHERE 
    l1.id = l2.id - 1 AND
    l2.id = l3.id -1 AND
    l1.num = l2.num AND l2.num = l3.num
;
 
-- Approach2:
-- *Use JOIN to connect the Logs table with itself three times (l1, l2, l3) to compare consecutive rows.
-- 1. Use the ON clause to ensure that the IDs of the joined rows are consecutive (l1.id = l2.id - 1 and l2.id = l3.id - 1).
-- 2. Use DISTINCT to ensure that only unique numbers are returned in the result

SELECT 
    DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2
ON l1.id = l2.id - 1
JOIN Logs l3
ON l2.id = l3.id - 1
WHERE l1.num = l2.num AND l3.num = l2.num
;