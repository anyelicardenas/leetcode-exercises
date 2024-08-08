-- url exercise: https://leetcode.com/problems/sales-person/description/
WITH uniontables AS (
    SELECT SalesPerson.sales_id, 
    SalesPerson.name,
    Company.com_id, 
    Company.name AS color
    FROM SalesPerson
    RIGHT JOIN Orders 
    ON SalesPerson.sales_id = Orders.sales_id 
    INNER JOIN Company
    ON Orders.com_id  = Company.com_id 
    GROUP BY SalesPerson.sales_id
)

SELECT name FROM uniontables
WHERE color != "RED"

UNION
SELECT name FROM SalesPerson 
WHERE name not in (SELECT name FROM uniontables)
