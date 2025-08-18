with sub_query as (
SELECT 
    customer_id,
    product_name,
    CASE 
        WHEN MAX(product_name = 'A') OVER (PARTITION BY customer_id) = 1
         AND MAX(product_name = 'B') OVER (PARTITION BY customer_id) = 1
         AND MAX(product_name = 'C') OVER (PARTITION BY customer_id) = 0
        THEN 'YES'
        ELSE 'NO'
    END AS qualifies
FROM Orders
)
select DISTINCT c.customer_id, c.customer_name from sub_query s
join Customers c on c.customer_id = s.customer_id
WHERE qualifies = 'YES'