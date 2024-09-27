-- url exercise: https://leetcode.com/problems/second-degree-follower/
-- Medium level 
-- 614. Second Degree Follower
WITH users_that_follow_and_have_followers AS (
    SELECT w.followee, w.follower
    FROM Follow f 
    INNER JOIN Follow w 
    ON w.followee = f.follower
)

SELECT followee AS follower,
COUNT(followee) as num 
FROM Follow
WHERE followee in (SELECT followee FROM users_that_follow_and_have_followers)
GROUP BY followee
ORDER BY follower ASC