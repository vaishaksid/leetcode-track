WITH req AS (
  SELECT DISTINCT requester_id AS id,
         COUNT(*) OVER (PARTITION BY requester_id) AS c1
  FROM RequestAccepted
),
acc AS (
  SELECT DISTINCT accepter_id AS id,
         COUNT(*) OVER (PARTITION BY accepter_id) AS c1
  FROM RequestAccepted
),
all_ids AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION
  SELECT accepter_id AS id FROM RequestAccepted
)

SELECT 
  u.id,
  COALESCE(r.c1, 0) + COALESCE(a.c1, 0) AS num
FROM all_ids u
LEFT JOIN req r ON u.id = r.id
LEFT JOIN acc a ON u.id = a.id
ORDER BY num DESC
LIMIT 1;

