-- LeetCode 602: Friend Requests II: Who Has the Most Friends
-- Approach:
-- * Note remember to use UNION ALL instad of UNION to avoid removing duplicates.
SELECT
    id,
    SUM(num) AS num
FROM
(SELECT 
    requester_id AS id,
    COUNT(accepter_id) AS num
FROM RequestAccepted
GROUP BY id
UNION ALL
SELECT 
    accepter_id AS id,
    COUNT(requester_id) AS num
FROM RequestAccepted
GROUP BY accepter_id) temp
GROUP BY id
ORDER BY num DESC
LIMIT 1
;

-- Another approach is faster:
SELECT
    id,
    COUNT(*) AS num
FROM
(SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted) temp
GROUP BY id
ORDER BY num DESC
LIMIT 1
;