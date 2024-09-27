-- https://leetcode.com/problems/project-employees-iii/
-- 1077. Project Employees III
-- Medium level
WITH joining_tables AS (
    SELECT p.project_id, p.employee_id, name, experience_years
    FROM Project p 
    INNER JOIN Employee e 
    ON p.employee_id = e.employee_id
    ORDER BY experience_years DESC
),

max_experience_for_employee AS (
    SELECT *,
    MAX(experience_years) OVER(PARTITION BY project_id) AS max_experience
    FROM joining_tables
)

SELECT project_id, employee_id
FROM max_experience_for_employee
WHERE experience_years = max_experience