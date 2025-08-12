# Write your MySQL query statement below
select user_id, count(*) as followers_count From Followers
group by user_id
ORDER BY user_id ASC
