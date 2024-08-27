-- url exercise: https://leetcode.com/problems/nth-highest-salary/
-- Medium level
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    SELECT salary FROM (
      SELECT salary, ROW_NUMBER() OVER(ORDER BY salary DESC)  AS counterRows,
      LAG(salary) OVER(ORDER BY salary DESC) AS nextSalary
      FROM Employee
      GROUP BY Salary
    ) AS orderSalaryDesc
    WHERE counterRows = N
    AND ((nextSalary != salary) OR (salary AND nextSalary IS NULL))
  );
END;