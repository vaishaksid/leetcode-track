select name as Customers
from Customers c 
left join Orders o on o.customerID = c.id
where o.id is null