-- LeetCode 626: Exchange Seats
-- Approach:
-- 1. Use a CASE statement to determine the new seat id for each student based on the current seat id.
-- 2. If the current seat id is even, the new seat id will be the current seat id minus 1 (the student moves to the left).

SELECT
    CASE 
        WHEN id % 2 = 0 THEN  id - 1
        WHEN id = (SELECT MAX(id) FROM Seat) AND id%2 != 0 THEN id
        WHEN id % 2 != 0 THEN id + 1
    END AS id,
    student
FROM Seat
ORDER BY id ASC
;