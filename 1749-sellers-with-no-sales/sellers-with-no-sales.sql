# Write your MySQL query statement below
select seller_name from Seller s 
where seller_id not in 
(select distinct seller_id from Orders
where sale_date >= '2020-01-01' AND sale_date <= '2020-12-31')
ORDER BY seller_name
