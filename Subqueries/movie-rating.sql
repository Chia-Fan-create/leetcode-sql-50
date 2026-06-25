-- LeetCode 1341: Movie Rating

(SELECT
    temp.name AS results
FROM
(SELECT
    COUNT(movie_id) AS CNT_movie,
    r.user_id,
    u.name
FROM MovieRating r
JOIN Users u
ON r.user_id = u.user_id
GROUP BY user_id
ORDER BY CNT_movie DESC, u.name ASC) temp
LIMIT 1)
UNION ALL
(
SELECT
    m.title AS results
FROM
(SELECT
    movie_id,
    AVG(rating) AS test,
    created_at
FROM MovieRating
WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020
GROUP BY movie_id) temp2
JOIN Movies m
ON m.movie_id = temp2.movie_id
ORDER BY temp2.test DESC, m.title ASC
LIMIT 1)
;

-- First query could to simply be written as:
SELECT u.name AS results
FROM MovieRating r
JOIN Users u
ON r.user_id = u.user_id
GROUP BY u.user_id
ORDER BY COUNT(r.movie_id) DESC, u.name ASC
LIMIT 1
