-- LeetCode 1661: Average Time of Process Per Machine
-- Approach:
-- 1. Use JOIN to combine the Activity table with itself
-- 2. Use ROUND and AVG to calculate the average processing time per process
-- 3. Group the results by machine_id
SELECT a1.machine_id, 
ROUND(AVG(a1.timestamp - a2.timestamp), 3) AS processing_time
FROM Activity a1
JOIN Activity a2
ON a1.process_id = a2.process_id
AND a1.machineid = a2.machine_id
AND a1.activity_type = 'end'
AND a2.activity_type = 'start'
GROUP BY a1.machine_id;