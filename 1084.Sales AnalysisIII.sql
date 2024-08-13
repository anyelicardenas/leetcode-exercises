-- url exercise:https://leetcode.com/problems/sales-analysis-iii/description/
SELECT s.product_id, 
p.product_name
FROM Sales as s
INNER JOIN Product as p
ON s.product_id = p.product_id
GROUP BY s.product_id
HAVING MIN(s.sale_date) >= '2019-01-01'
AND MAX(sale_date) <= '2019-03-31'
