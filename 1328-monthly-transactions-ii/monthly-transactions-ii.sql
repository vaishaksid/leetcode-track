-- MySQL 8.0+ (uses CTEs)

WITH approved_transactions AS (
  SELECT
      t.country,
      COUNT(*) AS approved_count,
      SUM(t.amount) AS approved_amount,
      DATE_FORMAT(t.trans_date, '%Y-%m') AS m1
  FROM Transactions t
  WHERE t.state = 'approved'
  GROUP BY t.country, DATE_FORMAT(t.trans_date, '%Y-%m')
),
chargeback_transactions AS (
  SELECT
      t.country,
      COUNT(*) AS chargeback_count,
      SUM(t.amount) AS chargeback_amount,
      DATE_FORMAT(c.trans_date, '%Y-%m') AS m2
  FROM Chargebacks c
  LEFT JOIN Transactions t
    ON t.id = c.trans_id
  GROUP BY t.country, DATE_FORMAT(c.trans_date, '%Y-%m')
),
full_join_union AS (
  -- Left side: all approved rows, attach chargebacks when present
  SELECT
      a.m1 AS month,
      a.country,
      a.approved_count,
      a.approved_amount,
      COALESCE(c.chargeback_count, 0) AS chargeback_count,
      COALESCE(c.chargeback_amount, 0) AS chargeback_amount
  FROM approved_transactions a
  LEFT JOIN chargeback_transactions c
    ON c.country = a.country
   AND c.m2 = a.m1

  UNION ALL

  -- Right-only rows: chargebacks that had no matching approved row
  SELECT
      c.m2 AS month,
      c.country,
      COALESCE(a.approved_count, 0) AS approved_count,
      COALESCE(a.approved_amount, 0) AS approved_amount,
      c.chargeback_count,
      c.chargeback_amount
  FROM chargeback_transactions c
  LEFT JOIN approved_transactions a
    ON a.country = c.country
   AND a.m1 = c.m2
  WHERE a.country IS NULL
)
SELECT
    month,
    country,
    approved_count,
    approved_amount,
    chargeback_count,
    chargeback_amount
FROM full_join_union
ORDER BY month, country;
