-- url exercise:https://leetcode.com/problems/team-scores-in-football-tournament/description/
-- Medium level

WITH team_points AS (
    SELECT host_team,
    CASE
    WHEN host_goals > guest_goals THEN 3
    WHEN host_goals =  guest_goals THEN 1
    WHEN host_goals < guest_goals THEN 0
    END AS num_points
    FROM Matches

    UNION ALL

    SELECT guest_team,
    CASE
    WHEN host_goals =  guest_goals THEN 1
    WHEN guest_goals > host_goals THEN 3
    WHEN host_goals < guest_goals THEN 0
    ELSE 0
    END AS num_points
    FROM Matches
)


SELECT team_id, team_name,
CASE 
WHEN team_id = host_team  THEN SUM(num_points) 
ELSE 0
END AS num_points
FROM Teams
LEFT JOIN team_points
ON Teams.team_id = team_points.host_team
GROUP BY team_id
ORDER BY num_points DESC, team_id ASC