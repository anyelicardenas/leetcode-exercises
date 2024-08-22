-- url exercise:https://leetcode.com/problems/department-highest-salary/
-- Medium level 

WITH max_salary_per_department AS (SELECT * , 
MAX(salary) OVER(PARTITION BY departmentId) as max_salary
FROM EMPLOYEE)

SELECT 
d.name AS Department,
m.name AS Employee,
max_salary AS Salary 
FROM max_salary_per_department AS m
INNER JOIN DEPARTMENT as d
ON m.departmentId = d.id
WHERE salary = max_salary
