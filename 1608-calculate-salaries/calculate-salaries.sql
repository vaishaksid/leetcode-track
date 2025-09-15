
with max_salary as (
select company_id, max(salary) as max_sal
from Salaries
group by company_id
)

SELECT
s.company_id,
  s.employee_id,
  s.employee_name,
  ROUND(
    CASE 
      WHEN max_sal < 1000 THEN s.salary * 1.0
      WHEN max_sal BETWEEN 1000 AND 10000 THEN s.salary * 0.76
      ELSE s.salary * 0.51
    END
  ) AS salary
from Salaries s
left join max_salary m on m.company_id = s.company_id