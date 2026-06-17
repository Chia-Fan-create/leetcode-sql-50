-- LeetCode 1517: Find Users With Valid E-Mails
-- Approach:
-- 1. Use REGEXP to filter the records based on the regular expression pattern for valid e-mails
-- 2. Use LIKE BINARY to ensure that the e-mails end with '@leetcode.com' and are case-sensitive


SELECT
*
FROM
Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$'
AND mail LIKE BINARY '%@leetcode.com'
;