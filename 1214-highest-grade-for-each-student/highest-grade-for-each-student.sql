# Write your MySQL query statement below
with sub_query as (
select DISTINCT student_id,
MAX(grade) as grade
FROM Enrollments
group by student_id
ORDER BY student_id
)
select s.student_id, min(e.course_id) as course_id , s.grade FROM sub_query s
join Enrollments e on e.student_id = s.student_id AND e.grade = s.grade
group by s.student_id, s.grade
ORDER BY student_id