-- url exercise: https://leetcode.com/problems/market-analysis-i/
-- Medium level
WITH orders_in_2019 AS (
    SELECT 
    order_date,
    buyer_id,
    user_id,
    join_date, 
    COUNT(buyer_id) AS orders_in_2019
    FROM ORDERS
    RIGHT JOIN USERS
    ON Orders.buyer_id = Users.user_id
    WHERE YEAR(order_date) = 2019
    GROUP BY buyer_id
    ORDER BY buyer_id
),

no_orders_in_2019 AS (
    SELECT
    user_id,
    join_date
    FROM Users
    WHERE user_id NOT IN (SELECT user_id FROM orders_in_2019)
    GROUP BY user_id
    ORDER BY user_id
),

union_orders AS (
    SELECT user_id,
    join_date,
    orders_in_2019
    FROM orders_in_2019

    UNION 

    SELECT user_id,
    join_date,
    CASE 
    WHEN user_id THEN 0
    END AS orders
    FROM no_orders_in_2019
)

SELECT user_id as buyer_id,
join_date,
orders_in_2019
FROM union_orders
ORDER BY user_id