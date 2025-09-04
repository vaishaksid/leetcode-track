# Write your MySQL query statement below
# Write your MySQL query statement below
with q1 as (
select book_id, name FROM Books
WHERE available_from < '2019-05-23'

),


q2 as (select book_id from Orders
where dispatch_date < '2019-06-23' and dispatch_date > '2018-06-23'
group by book_id
having sum(quantity) >= 10)


select book_id, name from q1
where book_id not in (select book_id from q2)