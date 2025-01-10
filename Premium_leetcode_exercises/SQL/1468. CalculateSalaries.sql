-- 1468. Calculate Salaries
"""
Table Salaries:

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| company_id    | int     |
| employee_id   | int     |
| employee_name | varchar |
| salary        | int     |
+---------------+---------+
In SQL,(company_id, employee_id) is the primary key for this table.
This table contains the company id, the id, the name, and the salary for an employee.
 

Find the salaries of the employees after applying taxes. Round the salary to the nearest integer.

The tax rate is calculated for each company based on the following criteria:

0% If the max salary of any employee in the company is less than $1000.
24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
49% If the max salary of any employee in the company is greater than $10000.
Return the result table in any order.

"""

WITH find_max_salary AS (SELECT company_id, 
employee_id, 
employee_name,
salary,
MAX(salary) OVER(PARTITION BY company_id) AS max_salary
FROM Salaries),

find_taxes AS (SELECT company_id,
employee_id, 
employee_name,
salary,
CASE
WHEN max_salary < 1000 THEN 1
WHEN max_salary BETWEEN 1000 AND 10000 THEN 0.24
WHEN max_salary > 10000 THEN 0.49
END AS taxes_rules
FROM find_max_salary)

SELECT company_id,
employee_id, 
employee_name,
CASE
WHEN taxes_rules = 1 THEN salary
ELSE ROUND(salary - (salary * taxes_rules)) 
END AS salary
FROM find_taxes