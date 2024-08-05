-- url exercise: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
WITH ManagerEmployeePairs AS (
    SELECT a.id AS idManager, 
    a.name AS nameManager, 
    a.salary AS salaryManager, 
    a.managerid AS Manager, 
    b.name AS Employee,
    b.salary AS salaryEmployee
    FROM employee AS a
    INNER JOIN Employee AS b
    ON a.id = b.managerid
)

SELECT Employee  
FROM ManagerEmployeePairs
WHERE salaryEmployee > salaryManager
