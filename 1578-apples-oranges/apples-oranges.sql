# Write your MySQL query statement below
select sale_date, 
SUM(CASE WHEN fruit = 'apples' THEN sold_num else -sold_num end)as diff
from Sales
group by sale_date
order by sale_date