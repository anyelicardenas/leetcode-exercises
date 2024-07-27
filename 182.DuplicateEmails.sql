-- url exercise: https://leetcode.com/problems/duplicate-emails/
WITH duplicate_emails AS (
    SELECT id, 
    email, 
    COUNT(email) OVER(PARTITION BY email) AS count_emails
    FROM Person
)

SELECT DISTINCT email
FROM duplicate_emails 
WHERE count_emails >= 2