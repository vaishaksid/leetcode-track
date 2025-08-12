# Write your MySQL query statement below
with min_year as (
select product_id, 
min(year) as min1
from Sales
group by product_id
)


select m.product_id, min1 as first_year, quantity, price from min_year m
inner join Sales s on s.product_id = m.product_id and m.min1 = s.year
