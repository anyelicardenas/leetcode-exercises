-- url exercise: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
WITH prueba AS (
    SELECT requester_id as id
    FROM RequestAccepted

    UNION ALL

    SELECT f.accepter_id as id
    FROM RequestAccepted f
)

SELECT  id, count(*) as num FROM prueba group by id 
order by num desc limit 1