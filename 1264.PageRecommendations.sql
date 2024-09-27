-- url exercise:https://leetcode.com/problems/page-recommendations/
-- Medium level
-- 1264. Page Recommendations
 
WITH friends_of_user1 AS (
    SELECT user1_id, user2_id,
    CASE
    WHEN user1_id = 1 THEN user1_id
    ELSE 0
    END AS user1_id_test,
    CASE 
    WHEN user2_id = 1 THEN user2_id
    ELSE 0
    END AS user2_id_test
    FROM Friendship
),

pages_of_user1 AS(
    SELECT page_id 
    FROM friends_of_user1 f 
    INNER JOIN Likes l
    ON f.user1_id = l.user_id
    WHERE user1_id_test != user2_id_test 
    AND l.page_id not in (SELECT page_id FROM Likes WHERE user_id = 1)
    AND l.user_id != 1
),

pages_of_user2 AS (
    SELECT DISTINCT page_id 
    FROM friends_of_user1 f 
    INNER JOIN Likes l
    ON f.user2_id = l.user_id
    WHERE user1_id_test != user2_id_test 
    AND l.page_id not in (SELECT page_id FROM Likes WHERE user_id = 1)
    AND l.user_id != 1
)

SELECT page_id AS recommended_page FROM pages_of_user1 
UNION
SELECT page_id AS recommended_page FROM pages_of_user2
