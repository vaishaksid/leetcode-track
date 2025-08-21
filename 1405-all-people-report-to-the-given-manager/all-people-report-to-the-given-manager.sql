WITH RECURSIVE chain AS (
  SELECT e.employee_id, 1 AS lvl
  FROM Employees e
  WHERE e.manager_id = 1

  UNION ALL

  SELECT e.employee_id, c.lvl + 1
  FROM Employees e
  JOIN chain c
    ON e.manager_id = c.employee_id
  WHERE c.lvl < 5
)

SELECT DISTINCT employee_id
FROM chain
WHERE employee_id <> 1
ORDER BY employee_id;


