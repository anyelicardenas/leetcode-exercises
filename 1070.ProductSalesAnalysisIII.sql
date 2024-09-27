-- url exercise:https://leetcode.com/problems/product-sales-analysis-iii/description/
-- Medium level 
-- 1070. Product Sales Analysis III

WITH first_year_of_sell AS
(
    SELECT product_id, 
    MIN(year) as year
    FROM Sales
    GROUP BY product_id
)

SELECT product_id, year as first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (SELECT product_id, year FROM first_year_of_sell)



