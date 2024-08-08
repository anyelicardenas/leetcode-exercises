-- url exercise: https://leetcode.com/problems/rank-scores/description/
-- medium level

WITH scores_descending  AS (
    SELECT * FROM Scores
    ORDER BY score DESC
)

SELECT score,
DENSE_RANK() OVER(ORDER BY score DESC) as "rank"
FROM order_desc