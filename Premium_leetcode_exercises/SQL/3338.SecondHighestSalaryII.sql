"""+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| emp_id           | int     |
| salary           | int     |
| dept             | varchar |
+------------------+---------+
emp_id is the unique key for this table.
Each row of this table contains information about an employee including their ID, salary, and department.
Write a solution to find the employees who earn the second-highest salary in each department. If multiple employees have the second-highest salary, include all employees with that salary.

Return the result table ordered by emp_id in ascending order.

The result format is in the following example.

 

Example:

Input:

employees table:

+--------+--------+-----------+
| emp_id | salary | dept      |
+--------+--------+-----------+
| 1      | 70000  | Sales     |
| 2      | 80000  | Sales     |
| 3      | 80000  | Sales     |
| 4      | 90000  | Sales     |
| 5      | 55000  | IT        |
| 6      | 65000  | IT        |
| 7      | 65000  | IT        |
| 8      | 50000  | Marketing |
| 9      | 55000  | Marketing |
| 10     | 55000  | HR        |
+--------+--------+-----------+"""

WITH salary_by_dept AS (
    SELECT emp_id, salary, dept, 
COUNT(emp_id) OVER(PARTITION BY dept) AS count_employees,
DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary DESC) as rn
FROM employees
)

SELECT emp_id, dept
FROM salary_by_dept
WHERE rn =2
ORDER BY emp_id ASC