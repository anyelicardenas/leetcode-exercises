-- url exercise:https://leetcode.com/problems/capital-gainloss/description/
-- Medium level

WITH gains AS (
    SELECT *, 
    SUM(price) AS capital_gains
    FROM Stocks
    WHERE operation LIKE "%Sell%"
    GROUP BY stock_name
),

loss AS (
    SELECT stock_name, 
    operation,
    price,
    SUM(price) AS capital_loss
    FROM Stocks
    WHERE operation LIKE "%Buy%"
    GROUP BY stock_name
)

SELECT gains.stock_name, (capital_gains - capital_loss) AS capital_gain_loss
FROM gains
LEFT JOIN loss
ON gains.stock_name = loss.stock_name