-- url exercise: https://leetcode.com/problems/tree-node/
-- Medium level
WITH table_with_row_number AS (
    SELECT *, 
    ROW_NUMBER() OVER() AS counterrows
    FROM Tree
)

SELECT id,
CASE 
WHEN p_id IS NULL THEN "Root"
WHEN counterrows= 2 THEN "Inner"
ELSE "Leaf"
END AS type
FROM table_with_row_number 

