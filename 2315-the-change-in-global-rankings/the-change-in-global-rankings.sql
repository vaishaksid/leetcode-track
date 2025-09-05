# Write your MySQL query statement below
with n1 as (
select team_id, name, points,
RANK() OVER(ORDER BY points DESC, name ASC) as rnk1
from Teampoints

),
n2 as (
select t.team_id, name, points + points_change as points,
RANK() OVER(ORDER BY points + points_change DESC, name ASC) as rnk2
from Teampoints t
join PointsChange p on p.team_id = t.team_id
)

SELECT n.team_id, n.name,
CAST(rnk1 AS SIGNED) - CAST(rnk2 as SIGNED) as rank_diff
FROM n1 n
join n2 m on m.team_id = n.team_id