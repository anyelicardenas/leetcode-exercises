-- url exercise: https://leetcode.com/problems/second-highest-salary/
-- Medium level 
WITH order_salaries AS (
    SELECT *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS salary_rank,
    LAG(salary) OVER(ORDER BY salary) AS last_salary,
    LEAD(salary) OVER(ORDER BY salary DESC) AS next_salary
    FROM Employee
)

SELECT
CASE 
    WHEN (salary_rank = 2 AND salary != last_salary) OR (salary_rank = 2 AND last_salary IS NULL) THEN salary
    WHEN (salary_rank = 2 AND salary = last_salary) THEN next_salary
    ELSE NULL
END AS SecondHighestSalary
FROM order_salaries
ORDER BY SecondHighestSalary DESC
LIMIT 1