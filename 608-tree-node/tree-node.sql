# Write your MySQL query statement below

select id,
CASE WHEN p_id is null then 'Root'
WHEN id not in (select p_id from Tree where p_id is not null) THEN 'Leaf' ELSE 'Inner' END as type
from Tree