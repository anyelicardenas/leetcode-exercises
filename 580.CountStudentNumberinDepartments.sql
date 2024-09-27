-- url exercise:https://leetcode.com/problems/count-student-number-in-departments/description/
-- Medium level

WITH counter_each_department AS (
    SELECT *,
    COUNT(dept_id) AS count_dept
    FROM Student
    GROUP BY dept_id
)

SELECT dept_name, COALESCE(count_dept, 0) AS student_number 
FROM counter_each_department c
RIGHT JOIN Department d
ON c.dept_id = d.dept_id
ORDER BY student_number DESC, dept_name ASC