# Write your MySQL query statement below
with agg as (
select stock_name, operation, operation_day, 
CASE WHEN operation = 'Sell' THEN -1 * price ELSE price END as price
from Stocks
)

select stock_name, -1 * sum(price) as capital_gain_loss from agg
group by stock_name

