-- -- LeetCode 1581: Customer Who Visited but Did Not Make Any Transactions
-- Approach:
-- 1. LEFT JOIN to include all records from Visits and matching records from Transactions
-- 2. ON clause matches Visits.visit_id with Transactions.visit_id
-- 3. WHERE clause filters for NULL transaction_id to find visits without transactions
-- 4. GROUP BY customer_id to aggregate results per customer
SELECT v.customer_id, COUNT(v.customer_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id is NULL
GROUP BY v.customer_id;
-- Note:
-- Why use COUNT() and GROUP BY?
---- By grouping the results by customer_id, 
---- we are telling the database to group all the rows that have the same customer_id together. 
---- This way, we can apply the COUNT function to each group separately, 
---- which gives us the number of visits made by each customer.
---- If we didn't group the results, the COUNT function would simply count 
---- the number of rows in the entire table that match the condition in the WHERE clause, 
---- without distinguishing between different customers.
