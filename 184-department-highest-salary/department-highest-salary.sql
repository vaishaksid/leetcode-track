# Write your MySQL query statement below
with max_sal as (
select departmentID, max(salary) as salary
from Employee
group by departmentID
)

select d.name as Department, e.name as Employee, m.salary as Salary from max_sal m
join Employee e on m.departmentID = e.departmentID and m.salary = e.salary
join Department d on m.departmentID = d.id