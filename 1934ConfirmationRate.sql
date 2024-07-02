-- url excercise:
-- Medium level

WITH action_confirm AS(
    SELECT user_id, COUNT(action) as only_confirm FROM Confirmations 
    WHERE action LIKE "confirmed"
    GROUP BY user_id
),

all_counts AS 
(SELECT Signups.user_id, action, COUNT(action) as all_actions, 
CASE
    WHEN only_confirm THEN only_confirm
    ELSE 0
END AS all_confirmate
FROM Signups 
LEFT JOIN Confirmations
ON Signups.user_id  = Confirmations.user_id 
LEFT JOIN action_confirm
ON Signups.user_id  = action_confirm.user_id 
GROUP BY Signups.user_id )

SELECT user_id,
CASE
    WHEN ROUND(all_confirmate/ all_actions, 2) THEN ROUND(all_confirmate/ all_actions, 2)
    ELSE 0
END AS confirmation_rate
FROM all_counts