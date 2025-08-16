# Write your MySQL query statement below
WITH ranked AS (
  SELECT 
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM Employee
  WHERE salary IS NOT NULL
)

SELECT MAX(CASE WHEN rnk = 2 THEN salary END) AS SecondHighestSalary
FROM ranked;