
SELECT t1.team_name AS home_team,
       t2.team_name AS away_team
FROM Teams t1
CROSS JOIN Teams t2
where t1.team_name != t2.team_name