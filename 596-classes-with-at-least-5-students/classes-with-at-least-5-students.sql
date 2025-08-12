with count1 as (
select class, count(student) as c1 from Courses
group by class
)

select class from count1
where c1 >= 5