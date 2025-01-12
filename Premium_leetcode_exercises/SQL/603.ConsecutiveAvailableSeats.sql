"""Find all the consecutive available seats in the cinema.

Return the result table ordered by seat_id in ascending order.

The test cases are generated so that more than two seats are consecutively available.

The result format is in the following example.

Example 1:

Input: 
Cinema table:
+---------+------+
| seat_id | free |
+---------+------+
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+
Output: 
+---------+
| seat_id |
+---------+
| 3       |
| 4       |
| 5       |
+---------+
"""
WITH cinema_free_seats AS (SELECT seat_id, free,
LAG(seat_id) OVER() AS lastval,
LEAD(seat_id) OVER() AS nextval,
LEAD(seat_id, 2) OVER() AS nextval2
FROM Cinema
WHERE free != 0),

free_seats AS (SELECT 
CASE 
WHEN nextval - seat_id  = 1 THEN seat_id
WHEN seat_id-1 = lastval THEN seat_id
END AS seat_id
FROM cinema_free_seats)

SELECT seat_id FROM free_seats
WHERE seat_id IS NOT NULL