# Write your MySQL query statement below
# select * from Confirmations
select s.user_id,
        ROUND(SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 2) as confirmation_rate
        from Confirmations c
        right join Signups s on c.user_id = s.user_id
group by s.user_id
