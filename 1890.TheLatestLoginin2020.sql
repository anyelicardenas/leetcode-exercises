-- https://leetcode.com/problems/the-latest-login-in-2020/
WITH latest_login_users_2020 AS(
    SELECT *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY time_stamp DESC) AS latest_login
    FROM Logins
    WHERE YEAR(time_stamp) = 2020
    ORDER BY time_stamp DESC
)

SELECT user_id,
time_stamp AS last_stamp
FROM latest_login_users_2020
WHERE latest_login = 1