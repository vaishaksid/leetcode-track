SELECT 
o.customer_id,
c.customer_name
From Orders as o
LEFT JOIN Customers as c
on o.customer_id = c.customer_id
GROUP BY o.customer_id
HAVING SUM(product_name='A') > 0
    AND SUM(product_name='B') > 0
    AND SUM(product_name='C') = 0