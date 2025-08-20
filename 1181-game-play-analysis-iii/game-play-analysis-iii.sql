# Write your MySQL query statement below
select player_id, event_date, 
SUM(games_played) OVER(partition by player_id ORDER BY event_Date ASC) as games_played_so_far
from Activity
