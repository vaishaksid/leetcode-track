select p.product_id,
ROUND(CASE 
      WHEN SUM(units * price) / SUM(units) IS NULL 
      THEN 0 
      ELSE SUM(units * price) / SUM(units)
    END
  , 2) AS average_price
from UnitsSold u
right join Prices p on p.product_id = u.product_id 
AND u.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id
