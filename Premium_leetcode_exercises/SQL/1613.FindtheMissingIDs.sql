"""+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
+---------------+---------+
customer_id is the column with unique values for this table.
Each row of this table contains the name and the id customer.
 

Write a solution to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.

Notice that the maximum customer_id will not exceed 100.

Return the result table ordered by ids in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 1           | Alice         |
| 4           | Bob           |
| 5           | Charlie       |
+-------------+---------------+
Output: 
+-----+
| ids |
+-----+
| 2   |
| 3   |
+-----+"""

-- I used a recursive function to generate a list of numbers with range
WITH RECURSIVE numbers AS (
    SELECT 1 AS number
    UNION ALL
    SELECT number + 1 FROM numbers WHERE number < 100
),

missed_id AS (
    SELECT number, customer_id, 
    MAX(customer_id) OVER() AS max_id,
    ROW_NUMBER() OVER() AS rn
    FROM numbers
    LEFT JOIN Customers
    ON numbers.number = customers.customer_id
)

-- Also, I limited with 59 line because I cannot LIMIT by variable 
-- in this case LIMIT max_id 
SELECT number AS ids
FROM missed_id
WHERE rn <= (SELECT rn FROM missed_id WHERE rn = max_id)
AND customer_id IS NULL

