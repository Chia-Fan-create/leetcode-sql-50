-- LeetCode 196: Delete Duplicate Emails
-- Approach:
-- 1. Use self join to find duplicate emails
-- 2. Use DELETE statement to delete the duplicate records

DELETE
p1
FROM Person p1
INNER JOIN Person p2
WHERE p1.id > p2.id AND p1.email = p2.email;
