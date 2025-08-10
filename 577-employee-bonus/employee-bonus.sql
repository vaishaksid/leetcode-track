# Write your MySQL query statement below

select name, bonus from Employee e
left join bonus b on b.empID = e.empID
where bonus < 1000 or bonus is null

