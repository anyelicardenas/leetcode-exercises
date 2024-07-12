-- url exercise: https://leetcode.com/problems/second-highest-salary/?envType=study-plan-v2&envId=top-sql-50
-- nivel medio

WITH find_second_salary AS (
SELECT id, 
salary AS SecondSalary,
RANK() OVER(ORDER BY salary DESC) AS second_row
FROM Employee),

salary as (SELECT *,
CASE
    WHEN COUNT(second_row) >= 2 THEN (SELECT DISTINCT SecondSalary FROM find_second_salary WHERE second_row=2)
    ELSE NULL
    END AS SecondHighestSalary
FROM find_second_salary)

SELECT SecondHighestSalary FROM salary

