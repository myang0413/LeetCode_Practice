-- Write your PostgreSQL query statement below
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > '2019-07-27'::date - INTERVAL '30 days' AND activity_date <= '2019-07-27'::date
GROUP BY activity_date