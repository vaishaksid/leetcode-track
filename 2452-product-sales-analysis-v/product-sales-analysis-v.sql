# Write your MySQL query statement below

with t1 as (

select product_id, user_id, sum(quantity) as q1
FROM Sales 
group by user_id, product_id

)

select user_id,
sum(q1 * price) as spending from t1 t
left join Product p on p.product_id = t.product_id
group by user_id
ORDER BY sum(q1 * price) DESC, user_id ASC