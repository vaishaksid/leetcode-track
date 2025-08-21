# Write your MySQL query statement below

select followee as follower, COUNT(*) AS num FROM Follow
WHERE followee in (select follower from Follow)
GROUP BY followee
ORDER BY follower