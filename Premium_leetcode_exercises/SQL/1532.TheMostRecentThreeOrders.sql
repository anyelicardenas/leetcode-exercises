-- 1532. The Most Recent Three Orders
"""Write a solution to find the most recent three orders of each user. If a user ordered less than three orders, return all of their orders.

Return the result table ordered by customer_name in ascending order and in case of a tie by the customer_id in ascending order. If there is still a tie, order them by order_date in descending order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+-------------+-----------+
| customer_id | name      |
+-------------+-----------+
| 1           | Winston   |
| 2           | Jonathan  |
| 3           | Annabelle |
| 4           | Marwan    |
| 5           | Khaled    |
+-------------+-----------+
Orders table:
+----------+------------+-------------+------+
| order_id | order_date | customer_id | cost |
+----------+------------+-------------+------+
| 1        | 2020-07-31 | 1           | 30   |
| 2        | 2020-07-30 | 2           | 40   |
| 3        | 2020-07-31 | 3           | 70   |
| 4        | 2020-07-29 | 4           | 100  |
| 5        | 2020-06-10 | 1           | 1010 |
| 6        | 2020-08-01 | 2           | 102  |
| 7        | 2020-08-01 | 3           | 111  |
| 8        | 2020-08-03 | 1           | 99   |
| 9        | 2020-08-07 | 2           | 32   |
| 10       | 2020-07-15 | 1           | 2    |
+----------+------------+-------------+------+"""


WITH number_recent_orders AS (
    SELECT order_id, order_date, customer_id,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS recent_orders
    FROM Orders
)

SELECT name as customer_name, 
c.customer_id, 
order_id, 
order_date
FROM Customers c
INNER JOIN number_recent_orders n
ON c.customer_id = n.customer_id
WHERE recent_orders = 3 
OR recent_orders = 2
OR recent_orders = 1
ORDER BY name ASC, c.customer_id ASC, order_date DESC