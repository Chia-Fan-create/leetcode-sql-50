-- LeetCode 1527: Patients with a Condition
-- NOTE:
-- OR need to use two full completed conditions
-- WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%' instead of 
-- WHERE conditions LIKE 'DIAB1%' OR '% DIAB1%'
-- Approach:
-- 1. Use 'DIAB1%' to find conditions that start with 'DIAB1'
-- 2. Use '% DIAB1%' to find conditions that contain 'DIAB1' and avoid the string like "SADIAB100"
SELECT
patient_id,
patient_name,
conditions 
FROM
Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
;