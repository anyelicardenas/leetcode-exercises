-- url exercise: https://leetcode.com/problems/human-traffic-of-stadium/submissions/1373598094/
-- Hard level
WITH people_greater_or_equal_100 AS (
    SELECT *
    FROM Stadium
    WHERE people in (SELECT people FROM Stadium WHERE people >= 100 ORDER BY visit_date)
),

consecutive_ids_evaluation AS (
    SELECT *,
    LAG(id) OVER() AS previous_id,
    LAG(id, 2) OVER() AS second_previous_id,
    LEAD(id) OVER(ORDER BY id) AS next_id,
    LEAD(id, 2) OVER(ORDER BY id) AS second_next_id,
    (id+1) AS id_plus_one
    FROM people_greater_or_equal_100
),

filter_consecutive_rows AS (
    SELECT *,
    CASE
        WHEN next_id != id_plus_one AND previous_id+1 = id and second_previous_id +2 = id THEN 1
        WHEN (next_id = id_plus_one OR next_id IS NULL) AND (next_id-1 = id AND second_next_id-2 = id )  THEN 2
        WHEN next_id = id_plus_one AND ((previous_id+1 = id and second_previous_id +2 = id) OR (previous_id+1 =id AND next_id-1 = id)) THEN 3
        WHEN (second_next_id IS NULL or next_id IS NULL) AND previous_id+1= id AND second_previous_id +2 = id THEN 4
    ELSE 0
    END AS consecutive_ids
    FROM consecutive_ids_evaluation
    ),

only_consecutive_rows AS (
    SELECT id, 
    visit_date, 
    people
    FROM filter_consecutive_rows
    WHERE consecutive_ids != 0
)

SELECT * FROM only_consecutive_rows
WHERE (SELECT COUNT(*) FROM only_consecutive_rows) >= 3