-- Description exercise: https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50 medium problem  level 

WITH  window_lag AS (
    SELECT *,
    LAG(event_date, 1) OVER ( PARTITION BY player_id
    ORDER BY player_id, event_date ASC ) AS previous_date,
    ROW_NUMBER() OVER(PARTITION BY player_id) as row_num
    FROM Activity
),

filter_by_row AS (SELECT * FROM window_lag
WHERE row_num = 2
),

find_frenquently_gamers AS (
SELECT player_id, event_date, previous_date, DATEDIFF(event_date, previous_date) as diff  FROM filter_by_row
ORDER BY player_id DESC),

first_logged AS (SELECT *  FROM find_frenquently_gamers
WHERE diff = 1 OR diff = -1)

SELECT ROUND(COUNT(player_id)/(SELECT COUNT(DISTINCT player_id) from Activity), 2) AS fraction
FROM first_logged

