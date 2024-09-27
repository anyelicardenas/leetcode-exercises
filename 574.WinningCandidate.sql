-- url exercise: https://leetcode.com/problems/winning-candidate/
-- Medium level

WITH votes_of_each_candidate AS (
    SELECT *,
    COUNT(candidateId) as counter_of_votes
    FROM Vote
    GROUP BY candidateId
),

max_number_of_votes AS (
    SELECT *
    FROM votes_of_each_candidate
    ORDER BY counter_of_votes DESC
    LIMIT 1  
)

SELECT name
FROM Candidate