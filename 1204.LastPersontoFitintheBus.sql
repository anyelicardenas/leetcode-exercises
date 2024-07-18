--Medium level
--url exercise: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
WITH sum_weight_of_persons AS  (
    SELECT *,
    SUM(weight) OVER(ORDER BY turn) AS sum_of_weight
    FROM Queue
    ORDER BY turn
    )

SELECT person_name FROM sum_weight_of_persons
WHERE sum_of_weight = 1000 OR person_name = (SELECT person_name FROM sum_weight_of_persons
WHERE sum_of_weight <= 1000
ORDER BY turn DESC
LIMIT 1)



