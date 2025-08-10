WITH report_counts AS (
  SELECT 
    managerId, 
    COUNT(*) AS report_count
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
)
SELECT 
  e.name
FROM report_counts r
JOIN Employee e ON r.managerId = e.id
WHERE r.report_count >= 5;
