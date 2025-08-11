# Write your MySQL query statement below
with count_ as (
select query_name, count(rating) as count1 from Queries
where rating < 3
group by query_name
)

SELECT 
  q.query_name, 
  ROUND(SUM(rating / position) / COUNT(*), 2) AS quality,
  CASE 
    WHEN ROUND(count1 / COUNT(*) * 100, 2) IS NULL THEN 0 
    ELSE ROUND(count1 / COUNT(*) * 100, 2) 
  END AS poor_query_percentage
FROM Queries q
LEFT JOIN count_ a ON a.query_name = q.query_name
GROUP BY q.query_name;

