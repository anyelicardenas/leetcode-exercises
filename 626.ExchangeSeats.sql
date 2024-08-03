WITH twoConsecutiveStudents AS  (
    SELECT id, student,
    id + 1 AS nextValue
    FROM Seat
    ),

oddId as (
    SELECT a.id, a.student, a.nextValue, b.student as nextStudent
    FROM twoConsecutiveStudents as a
    JOIN twoConsecutiveStudents as b on a.nextValue = b.id
    WHERE a.id %2 != 0
),

evenId as (
    SELECT a.id, a.student, a.nextValue, b.student as nextStudent
    FROM twoConsecutiveStudents as a
    LEFT JOIN twoConsecutiveStudents as b on a.nextValue = b.id 
    WHERE a.id %2 = 0
),

consolidatedResults as (
    SELECT id + 1 as id, student
    FROM oddId

    UNION

    SELECT id -1 as id, student
    FROM evenId
),

missingStudents as (
    SELECT s.id, s.student 
    FROM consolidatedResults as c
    RIGHT JOIN Seat as s ON c.id =s.id
    WHERE c.id is NULL
    ORDER BY c.id
),

disorderedResult as (
    SELECT * FROM consolidatedResults
    UNION
    SELECT * FROM missingStudents
    
)
SELECT * FROM disorderedResult
ORDER BY id;




