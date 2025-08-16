# Write your MySQL query statement below

WITH dump AS (
select pid,
  CASE 
    WHEN COUNT(*) OVER (PARTITION BY lat, lon) > 1 THEN 'Y'
    ELSE 'N'
  END AS lat_dup,
  CASE
    WHEN COUNT(*) OVER(PARTITION BY tiv_2015) > 1 THEN 'Y'
    ELSE 'N'
    END AS tiv_dup,
    tiv_2016
from Insurance
)

SELECT round(sum(tiv_2016), 2) as tiv_2016 FROM dump
WHERE lat_dup = 'N' and tiv_dup = 'Y'
