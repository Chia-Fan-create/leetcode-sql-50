-- LeetCode 1907: Count Salary Categories

-- Approach 1:
-- Use 'Category' AS a new column to label the salary categories. + with WHERE clause to filter the income ranges for each category.
-- Use COUNT(account_id) to count the number of accounts in each category.

SELECT 
    'Low Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION
SELECT 
    'Average Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000
UNION
SELECT 
    'High Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000
;

-- Approach 2:
-- Use a derived table to create a list of salary categories and then 
-- LEFT JOIN it with the Accounts table to count the number of accounts in each category. 
-- This approach ensures that all categories are included

SELECT 
    v.category,
    COUNT(a.account_id) AS accounts_count
FROM (
    SELECT 'Low Salary' AS category UNION ALL
    SELECT 'Average Salary' UNION ALL
    SELECT 'High Salary'
) v
LEFT JOIN Accounts a ON 
    CASE 
        WHEN a.income < 20000 THEN 'Low Salary'
        WHEN a.income >= 20000 AND a.income <= 50000 THEN 'Average Salary'
        ELSE 'High Salary'
    END = v.category
GROUP BY v.category;

-- Approach 3:
-- Use CASE statement to categorize the income into 'Low Salary', 'Average Salary', and 'High Salary'.
-- Use COUNT(account_id) to count the number of accounts in each category.      

SELECT
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
        WHEN income > 50000 THEN 'High Salary'
    END AS category,
    COUNT(account_id) AS accounts
FROM Salary
GROUP BY category
UNION ALL
SELECT 'Low Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Salary WHERE income < 20000)
UNION ALL
SELECT 'Average Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Salary WHERE income BETWEEN 20000 AND 50000)
UNION ALL
SELECT 'High Salary', 0
WHERE NOT EXISTS (SELECT 1 FROM Salary WHERE income > 50000);   
