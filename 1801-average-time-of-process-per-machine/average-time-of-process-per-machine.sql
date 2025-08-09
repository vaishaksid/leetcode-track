WITH start_cte AS (
  SELECT machine_id, process_id, `timestamp` AS start_time
  FROM Activity
  WHERE activity_type = 'start'
),
end_cte AS (
  SELECT machine_id, process_id, `timestamp` AS end_time
  FROM Activity
  WHERE activity_type = 'end'
)
SELECT
  s.machine_id,
  ROUND(AVG(e.end_time - s.start_time), 3) AS processing_time
FROM start_cte s
JOIN end_cte e
  ON s.machine_id = e.machine_id
 AND s.process_id = e.process_id
GROUP BY s.machine_id;
