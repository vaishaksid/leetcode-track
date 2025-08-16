# Write your MySQL query statement below
with ranking as (
select salary,
departmentId,
DENSE_RANK() OVER (
    PARTITION BY departmentId
    ORDER BY salary DESC
  ) AS rnk,
  name
from Employee
)

select  d.name as Department, r.name as Employee, salary as Salary from ranking r
join Department d on d.id = r.departmentID
WHERE rnk in (1, 2, 3)


