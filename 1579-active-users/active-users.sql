WITH distinct_logins AS (
  SELECT DISTINCT id, login_date
  FROM Logins
),
lead_check AS (
  SELECT
    id,
    login_date,
    LEAD(login_date, 1) OVER (PARTITION BY id ORDER BY login_date) AS d1,
    LEAD(login_date, 2) OVER (PARTITION BY id ORDER BY login_date) AS d2,
    LEAD(login_date, 3) OVER (PARTITION BY id ORDER BY login_date) AS d3,
    LEAD(login_date, 4) OVER (PARTITION BY id ORDER BY login_date) AS d4
  FROM distinct_logins
),
five_day_ids AS (
  SELECT DISTINCT id
  FROM lead_check
  WHERE DATEDIFF(d1, login_date) = 1
    AND DATEDIFF(d2, login_date) = 2
    AND DATEDIFF(d3, login_date) = 3
    AND DATEDIFF(d4, login_date) = 4
)
SELECT f.id, a.name
FROM Accounts a
JOIN five_day_ids f ON f.id = a.id
ORDER BY f.id;
