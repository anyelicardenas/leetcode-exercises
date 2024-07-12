-- url exercise:https://leetcode.com/problems/customers-who-bought-all-products/

WITH count_all_products AS (
    SELECT product_key, COUNT(product_key) AS products FROM Product
)

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT customer.product_key) = (SELECT products FROM count_all_products