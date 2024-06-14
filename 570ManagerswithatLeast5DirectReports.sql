-- Description problem url: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

SELECT name
FROM Employee
WHERE id in (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(managerId) >= 5 ) 