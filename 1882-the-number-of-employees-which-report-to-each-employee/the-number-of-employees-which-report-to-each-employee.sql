# Write your MySQL query statement below
# select if reports to has his id

with o1 as (
select reports_to as employee_id, count(*) as reports_count,
round(sum(age) / count(*)) as average_age
from Employees
where reports_to is not null
group by reports_to
)

select o1.employee_id, e.name, o1.reports_count, average_age FROM o1
join Employees e on e.employee_id = o1.employee_id
order by employee_id