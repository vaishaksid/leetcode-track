# Write your MySQL query statement below
# Write your MySQL query statement below
SELECT user_id, name, mail
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$'
and mail like '%@leetcode.com' COLLATE utf8mb4_bin;