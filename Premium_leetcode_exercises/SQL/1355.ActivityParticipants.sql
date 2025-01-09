"""Find the names of all the activities with neither the maximum nor the minimum number of participants.

Each activity in the Activities table is performed by any person in the table Friends.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Friends table:
+------+--------------+---------------+
| id   | name         | activity      |
+------+--------------+---------------+
| 1    | Jonathan D.  | Eating        |
| 2    | Jade W.      | Singing       |
| 3    | Victor J.    | Singing       |
| 4    | Elvis Q.     | Eating        |
| 5    | Daniel A.    | Eating        |
| 6    | Bob B.       | Horse Riding  |
+------+--------------+---------------+
Activities table:
+------+--------------+
| id   | name         |
+------+--------------+
| 1    | Eating       |
| 2    | Singing      |
| 3    | Horse Riding |
+------+--------------+
Output: 
+--------------+
| activity     |
+--------------+
| Singing      |
+--------------+"""
# Write your MySQL query statement below
WITH count_activities AS (SELECT id, name, activity,
COUNT(activity) AS count_activity
FROM Friends
GROUP BY activity
ORDER BY count_activity DESC
),

max_and_min AS (
    SELECT id, name, activity, count_activity,
    MAX(count_activity) OVER() AS maximum,
    MIN(count_activity) OVER() AS minimun
    FROM count_activities
)

SELECT activity
FROM max_and_min
WHERE count_activity != maximum
AND count_activity != minimun

