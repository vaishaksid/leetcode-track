# Write your MySQL query statement below
with agg as (
select customer_id, order_id, order_date,
RANK() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rnk
from Orders

)

select c.name as customer_name, a.customer_id, a.order_id, a.order_date from agg a 
join Customers c on c.customer_id = a.customer_id
WHERE rnk <= 3
ORDER BY c.name ASC, a.customer_id ASC, order_date DESC