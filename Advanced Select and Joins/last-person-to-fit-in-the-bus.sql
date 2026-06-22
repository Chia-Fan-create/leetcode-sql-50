-- LeetCode 1204: Last Person to Fit in the Bus
-- What I learned:
-- * Use SUM(weight) OVER(ORDER BY turn ASC) to calculate the cumulative weight.

SELECT
    person_name
FROM
(SELECT
turn,
person_name,
weight,
SUM(weight) OVER(ORDER BY turn ASC) AS test
FROM
Queue
ORDER BY turn ASC) temp
WHERE temp.test <= 1000 
ORDER BY turn desc
LIMIT 1
;

-- Approach 2:
SELECT
    person_name
FROM
(SELECT
turn,
person_name,
weight,
SUM(weight) OVER(ORDER BY turn ASC) AS test
FROM
Queue
ORDER BY turn ASC) temp
WHERE temp.test - weight <= 1000
ORDER BY turn desc
LIMIT 1
;

-- Approach 3:
-- Use JOIN to combine the Queue table with itself, 
-- comparing the turn values and summing the weights of the people in the queue up to the current turn.

SELECT
    q1.person_name
FROM Queue q1 JOIN Queue q2
ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1
;