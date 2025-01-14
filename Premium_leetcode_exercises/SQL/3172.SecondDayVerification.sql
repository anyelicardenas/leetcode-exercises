"""
Write a Solution to find the user IDs of those who verified their sign-up on the second day.

Return the result table ordered by user_id in ascending order.

The result format is in the following example.

Example:
Input:
emails table:

+----------+---------+---------------------+
| email_id | user_id | signup_date         |
+----------+---------+---------------------+
| 125      | 7771    | 2022-06-14 09:30:00|
| 433      | 1052    | 2022-07-09 08:15:00|
| 234      | 7005    | 2022-08-20 10:00:00|
+----------+---------+---------------------+
texts table:
+---------+----------+--------------+---------------------+
| text_id | email_id | signup_action| action_date         |
+---------+----------+--------------+---------------------+
| 1       | 125      | Verified     | 2022-06-15 08:30:00|
| 2       | 433      | Not Verified | 2022-07-10 10:45:00|
| 4       | 234      | Verified     | 2022-08-21 09:30:00|
+---------+----------+--------------+---------------------+
Output:
+---------+
| user_id |
+---------+
| 7005    |
| 7771    |
+---------+
"""
-- 3172. Second Day Verification
WITH test AS (SELECT user_id, text_id, t.email_id, signup_action, action_date, 
DATEDIFF(action_date, signup_date) AS second_day_verified
FROM Texts t
INNER JOIN emails e 
ON t.email_id = e.email_id
ORDER BY user_id )

SELECT user_id FROM test WHERE second_day_verified = 1
AND signup_action = 'Verified'