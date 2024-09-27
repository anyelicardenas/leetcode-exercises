-- url exercise:https://leetcode.com/problems/shortest-distance-in-a-plane/
-- Medium level 
-- 612. Shortest Distance in a Plane
SELECT 
ROUND(sqrt(POWER(COALESCE(c.x,0) - p.x, 2) + POWER(COALESCE(c.y, 0) - p.y, 2)), 2) AS shortest
FROM POINT2D p
CROSS JOIN POINT2D c
HAVING shortest != 0
ORDER BY shortest
LIMIT 1 