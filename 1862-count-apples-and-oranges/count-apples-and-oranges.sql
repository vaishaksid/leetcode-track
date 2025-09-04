# Write your MySQL query statement below

WITH temp_table AS (
    SELECT 
        b.apple_count   AS box_apples,
        b.orange_count  AS box_oranges,
        c.apple_count   AS chest_apples,
        c.orange_count  AS chest_oranges,

        SUM(
            COALESCE(b.apple_count, 0) + COALESCE(c.apple_count, 0)
        ) OVER (ORDER BY b.chest_id) AS running_apple_total,

        SUM(
            COALESCE(b.orange_count, 0) + COALESCE(c.orange_count, 0)
        ) OVER (ORDER BY b.chest_id) AS running_orange_total
    FROM Boxes b
    LEFT JOIN Chests c 
      ON b.chest_id = c.chest_id
)
SELECT 
    max(running_apple_total) as apple_count, 
    max(running_orange_total) as orange_count
FROM temp_table;


