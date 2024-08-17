-- url exercise https://leetcode.com/problems/employees-with-missing-information/
WITH missing_information AS (
    SELECT employee_id FROM Employees
    WHERE employee_id not in (SELECT employee_id FROM Salaries)

    UNION

    SELECT employee_id FROM Salaries
    WHERE employee_id not in (SELECT employee_id FROM Employees)
)

SELECT * FROM missing_information
ORDER BY employee_id 