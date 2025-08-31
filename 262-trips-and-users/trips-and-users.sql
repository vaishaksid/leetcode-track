WITH legit_drivers AS (
  SELECT client_id, driver_id, status, request_at
  FROM Trips
  WHERE client_id IN (SELECT users_id FROM Users WHERE banned = 'No')
    AND driver_id IN (SELECT users_id FROM Users WHERE banned = 'No')
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
),
total_req AS (
  SELECT request_at, COUNT(*) AS total_requests
  FROM legit_drivers
  GROUP BY request_at
),
total_cancel AS (
  SELECT request_at, COUNT(*) AS c1
  FROM legit_drivers
  WHERE status IN ('cancelled_by_client', 'cancelled_by_driver')
  GROUP BY request_at
)
SELECT
  r.request_at AS Day,
  ROUND(
    CASE
      WHEN r.total_requests > 0
        THEN COALESCE(c.c1, 0) / r.total_requests
      ELSE 0
    END,
    2
  ) AS `Cancellation Rate`
FROM total_req r
LEFT JOIN total_cancel c
  ON r.request_at = c.request_at

