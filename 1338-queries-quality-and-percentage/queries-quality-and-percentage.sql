WITH stats AS (
  SELECT 
    query_name,
    COUNT(*) AS total_count,
    ROUND(SUM(rating / position) / COUNT(*), 2) AS quality,
    SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS poor_count
  FROM Queries
  GROUP BY query_name
)

SELECT 
  query_name,
  quality,
  ROUND(poor_count / total_count * 100, 2) AS poor_query_percentage
FROM stats;

