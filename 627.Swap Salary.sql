-- url exercise:https://leetcode.com/problems/swap-salary/description/
-- Update values
UPDATE Salary
SET sex = CASE
WHEN sex = 'f' THEN 'm'
WHEN sex = 'm' THEN 'f'
END 
