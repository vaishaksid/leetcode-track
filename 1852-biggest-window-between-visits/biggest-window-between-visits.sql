# Write your MySQL query statement below

WITH visit_diffs AS (
    SELECT
        user_id,
        visit_date,
        COALESCE(LEAD(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date),'2021-1-1')  AS next_visit
    FROM UserVisits
)
SELECT
    user_id,
    MAX(DATEDIFF(next_visit, visit_date)) AS biggest_window
FROM visit_diffs
GROUP BY user_id;
