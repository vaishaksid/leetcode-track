WITH min_dev AS (
  SELECT customer_id, MIN(order_date)
  AS order_date
  FROM Delivery
  GROUP BY customer_id
)

select
round((SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) / count(*)) * 100, 2)
as immediate_percentage
from min_dev m
join Delivery d on d.customer_id = m.customer_id and d.order_date = m.order_date

