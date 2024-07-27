-- https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50
WITH category_salary AS    
    (
    SELECT *,
    CASE
        WHEN income < 20000 THEN "Low Salary"
        WHEN income BETWEEN 20000 AND 50000 THEN "Average Salary"
        WHEN income > 20000 THEN "High Salary"
    END AS category
    FROM Accounts
    ),
category_list AS
(
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT a.category, COUNT(b.category) AS accounts_count
FROM category_list a
LEFT JOIN category_salary b ON a.category = b.category
GROUP BY a.category;