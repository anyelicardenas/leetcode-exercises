-- url exercise:https://leetcode.com/problems/running-total-for-different-genders/description/
-- Medium level
-- 1308. Running Total for Different Genders
SELECT gender, day, 
SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total
FROM Scores
ORDER BY gender ASC, day ASC 