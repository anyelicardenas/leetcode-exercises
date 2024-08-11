-- url exercise:https://leetcode.com/problems/bank-account-summary-ii/

WITH balance_accounts AS (
    SELECT t.trans_id, 
    t.account , 
    t.amount, 
    t.transacted_on, 
    Users.name,
    SUM(amount) OVER(PARTITION BY t.account) AS BALANCE
    FROM Transactions AS t
    INNER JOIN Users
    ON t.account = Users.account
    )

SELECT NAME, BALANCE FROM balance_accounts
WHERE BALANCE > 10000
GROUP BY name