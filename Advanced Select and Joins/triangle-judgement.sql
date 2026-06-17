-- LeetCode 610: Triangle Judgement
-- How I solved it:
-- Think the rule of triangle, if the sum of any two sides is greater than the third side, then it is a triangle. 

SELECT
    x,
    y,
    z,
    CASE
    WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes'
    ELSE 'No'
    END AS triangle
FROM 
Triangle
;