-- url exercise: https://leetcode.com/problems/top-travellers/
WITH sum_distance_traveled AS (
    SELECT name, 
    SUM(distance) AS travelled_distance
    FROM Rides 
    RIGHT JOIN Users
    ON Rides.user_id = Users.id
    GROUP BY user_id
    ORDER BY travelled_distance DESC, name ASC
)

SELECT name,
CASE 
WHEN travelled_distance THEN travelled_distance
ELSE 0
END AS travelled_distance
FROM sum_distance_traveled

