-- -- LeetCode 1280: Students and Examinations
-- Approach:
-- 1. Use a CROSS JOIN to create all possible combinations of students and subjects.
-- 2. Use a LEFT JOIN to link these combinations with the Examinations table to find out which exams were attended.
-- 3. Use COUNT to get the total number of exams attended for each student-subject pair.
SELECT s.student_id, s.student_name, sub.subject_name, -- Can not use e.subject_name directly as it may be NULL!
       COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub -- Generate all combinations of students and subjects!
LEFT JOIN Examinations e
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name -- Join to find attended exams
GROUP BY s.student_id, sub.subject_name -- Group by student and subject
ORDER BY s.student_id, sub.subject_name; -- Order the results as required
-- Note: 
-- 1. CROSS JOIN creates a Cartesian product of Students and Subjects.
-- 2. LEFT JOIN ensures that we include all combinations even if there are no attended exams