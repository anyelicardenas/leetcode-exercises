-- 1445. Apples & Oranges
"""
Write a solution to report the difference between the number of apples and oranges sold each day.

Return the result table ordered by sale_date.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+------------+------------+-------------+
| sale_date  | fruit      | sold_num    |
+------------+------------+-------------+
| 2020-05-01 | apples     | 10          |
| 2020-05-01 | oranges    | 8           |
| 2020-05-02 | apples     | 15          |
| 2020-05-02 | oranges    | 15          |
| 2020-05-03 | apples     | 20          |
| 2020-05-03 | oranges    | 0           |
| 2020-05-04 | apples     | 15          |
| 2020-05-04 | oranges    | 16          |
+------------+------------+-------------+
"""

WITH apples_oranges AS (
SELECT sale_date, fruit,
CASE
WHEN fruit = 'apples' THEN sold_num
END AS apples,
CASE 
WHEN fruit = 'oranges' THEN sold_num
END AS oranges
FROM Sales
),

diff_sold_fruit AS (SELECT sale_date, (apples -
LEAD(oranges) OVER()) AS diff
FROM apples_oranges )

SELECT sale_date, diff
FROM diff_sold_fruit
GROUP BY sale_date
