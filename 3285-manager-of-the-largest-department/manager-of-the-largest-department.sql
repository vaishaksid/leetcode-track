
with temp1 as (
select dep_id, count(*) as num_of_emp
FROM Employees
GROUP BY dep_id
),

temp2 as (
select dep_id, num_of_emp FROM temp1 where 
num_of_emp = (select max(num_of_emp) FROM temp1)

)

select emp_name as manager_name, t.dep_id FROM Employees e
inner join temp2 t on t.dep_id = e.dep_id
WHERE position = 'Manager'
ORDER BY emp_name DESC