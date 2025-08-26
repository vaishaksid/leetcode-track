with temp as(
select
Wimbledon as player,
count(*) as num_of_times_Wimbledon
from Championships
group by Wimbledon
UNION all
select
Fr_open as player_Fr_open,
count(*) as num_of_times_Fr_open
from Championships
group by Fr_open
UNION all
SELECT
US_open as player_US_open,
count(*) as num_of_times_US_open
from Championships
group by US_open
UNION all
SELECT
Au_open as player_Au_open,
count(*) as num_of_times_Au_open
from Championships
group by Au_open
)


select player as player_id, player_name,
SUM(num_of_times_Wimbledon) as grand_slams_count
FROM temp t
join Players p on p.player_id = t.player
GROUP BY player