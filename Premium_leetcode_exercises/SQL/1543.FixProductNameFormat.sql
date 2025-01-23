-- 1543. Fix Product Name Format
"""
Table: Sales

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| sale_id      | int     |
| product_name | varchar |
| sale_date    | date    |
+--------------+---------+
sale_id is the column with unique values for this table.
Each row of this table contains the product name and the date it was sold.
 
Since table Sales was filled manually in the year 2000, product_name may contain leading and/or trailing white spaces, also they are case-insensitive.

Write a solution to report

product_name in lowercase without leading or trailing white spaces.
sale_date in the format ('YYYY-MM').
total the number of times the product was sold in this month.
Return the result table ordered by product_name in ascending order. In case of a tie, order it by sale_date in ascending order.
"""

WITH counting_products AS ( SELECT sale_id, LOWER(TRIM(product_name)) AS product_n, 
DATE_FORMAT(sale_date, '%Y-%m') AS datee
FROM Sales
)

SELECT product_n as product_name, datee as sale_date, COUNT(product_n) AS total
FROM counting_products
GROUP BY datee, product_n
ORDER BY product_n ASC, sale_date 