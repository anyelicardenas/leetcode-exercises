--  1113. Reported Posts
"""
Table: Actions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| post_id       | int     |
| action_date   | date    | 
| action        | enum    |
| extra         | varchar |
+---------------+---------+
This table may have duplicate rows.
The action column is an ENUM (category) type of ('view', 'like', 'reaction', 'comment', 'report', 'share').
The extra column has optional information about the action, such as a reason for the report or a type of reaction.
extra is never NULL.
 
Write a solution to report the number of posts reported yesterday for each report reason. Assume today is 2019-07-05.

Return the result table in any order.
"""

WITH reported_yesterday AS (
SELECT user_id, post_id, action_date, action, extra,
DATE_SUB('2019-07-05', INTERVAL 1 DAY) AS yesterday
FROM Actions
WHERE action = 'report'
),

count_post_reported AS (
    SELECT user_id, post_id, action_date, action, extra AS report_reason,
COUNT(extra) OVER(PARTITION BY extra) AS report_count
FROM reported_yesterday
WHERE action_date = yesterday
GROUP BY extra, post_id
)

SELECT report_reason, report_count
FROM count_post_reported
GROUP BY report_reason, report_count