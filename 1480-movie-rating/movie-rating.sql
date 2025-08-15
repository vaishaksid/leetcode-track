# Write your MySQL query statement below

(
  SELECT title AS results
  FROM MovieRating m
  JOIN Movies m1 ON m.movie_id = m1.movie_id
  WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-28'
  GROUP BY m.movie_id, title
  ORDER BY AVG(rating) DESC, title
  LIMIT 1
)
UNION ALL
(
  SELECT u.name AS results
  FROM MovieRating m
  JOIN Users u ON u.user_id = m.user_id
  GROUP BY m.user_id, u.name
  ORDER BY COUNT(m.user_id) DESC, u.name
  LIMIT 1
);
