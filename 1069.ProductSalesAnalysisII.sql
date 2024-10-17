-- url exercise:https://leetcode.com/problems/product-sales-analysis-ii/description/
WITH sum_products AS (
    SELECT product_id, 
    SUM(quantity) OVER(PARTITION BY product_id) AS total_quantity
    FROM Sales 
)
SELECT product_id,
total_quantity
FROM sum_products
GROUP BY product_id

