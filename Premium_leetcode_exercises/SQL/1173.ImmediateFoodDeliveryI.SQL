-- 1173. Immediate Food Delivery I
"""
Table: Delivery
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the primary key (column with unique values) of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

Write a solution to find the percentage of immediate orders in the table, rounded to 2 decimal places.

"""
WITH type_of_delivery AS (
    SELECT delivery_id, customer_id, order_date,
    customer_pref_delivery_date,
    CASE 
    WHEN order_date = customer_pref_delivery_date THEN 'inmediate'
    ELSE 'scheduled'
    END AS delivery_type
    FROM Delivery
)

SELECT  ROUND((SELECT COUNT(delivery_type) FROM type_of_delivery WHERE delivery_type = 'inmediate')/COUNT(*) * 100, 2 ) AS immediate_percentage
FROM type_of_delivery