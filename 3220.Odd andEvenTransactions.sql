-- url exercise: https://leetcode.com/problems/odd-and-even-transactions/
WITH odd_and_even_pairs AS (
    SELECT *,
    CASE
    WHEN amount % 2 != 0 THEN amount
    ELSE 0
    END AS odd_sum,
    CASE
    WHEN amount % 2 = 0 THEN amount
    ELSE 0
    END AS even_sum
    FROM Transactions
    ORDER BY transaction_date
)

SELECT transaction_date , SUM(odd_sum) AS odd_sum, SUM(even_sum) AS even_sum 
FROM odd_and_even_pairs
GROUP BY transaction_date
ORDER BY transaction_date