# Write your MySQL query statement below




with plat as (
SELECT 'Android' AS platform
UNION ALL
SELECT 'IOS'
UNION ALL
SELECT 'Web'
),

exp1 as (
SELECT 'Reading' AS experiment_name
UNION ALL
SELECT 'Sports'
UNION ALL
SELECT 'Programming'
),

temp as (
select platform, experiment_name from plat
join exp1
)
,
c1 as (
select platform, experiment_name,
COUNT(*) as num_experiments
FROM Experiments
Group by platform, experiment_name 
)

select t.platform, t.experiment_name, 
CASE WHEN num_experiments IS NULL THEN 0 ELSE num_experiments END as num_experiments from temp t 
left join c1 c on c.platform = t.platform and c.experiment_name =  t.experiment_name