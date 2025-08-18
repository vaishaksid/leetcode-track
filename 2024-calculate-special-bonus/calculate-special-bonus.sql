# Write your MySQL query statement below
with cover as (
SELECT 
  employee_id,
  CASE 
    WHEN employee_id % 2 = 1 AND LEFT(name,1) != 'M' THEN salary
    ELSE 0
  END AS bonus
FROM Employees)

select employee_id, bonus FROM cover
ORDER BY employee_id