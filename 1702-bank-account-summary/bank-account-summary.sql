# Write your MySQL query statement below
WITH AGG AS (
select paid_by as id, -sum(amount) as total_amount from Transactions
GROUP BY paid_by
union
select paid_to as id , sum(amount) from Transactions
GROUP BY paid_to
),
total as (
select id, SUM(total_amount) as tot from AGG a
GROUP BY id
)

select u.user_id, u.user_name,
CASE WHEN tot is null THEN credit ELSE tot + credit END as credit,
CASE WHEN tot + credit < 0 THEN 'Yes' ELSE 'No' END AS credit_limit_breached
from Users u
left join total t on t.id = u.user_id