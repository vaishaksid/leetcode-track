# Write your MySQL query statement below
select project_id,
round(sum(experience_years) / count(p.employee_id), 2) as average_years
FROM Employee e
join Project p on p.employee_id = e.employee_id 
group by project_id