# Write your MySQL query statement below
with recent as (
select product_id, max(order_date) as recent_order from Orders
group by product_id
)

select product_name, o.product_id, o.order_id, o.order_date from Orders o
join recent r on r.product_id = o.product_id
join Products p on o.product_id = p.product_id
where o.order_date = r.recent_order
ORDER BY product_name, o.product_id, o.order_id