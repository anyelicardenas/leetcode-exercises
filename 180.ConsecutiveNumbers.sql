WITH comparising AS (
    SELECT *, 
        LEAD(id) OVER() AS id_siguiente,
        LEAD(num) OVER() AS num_siguiente,
        LAG(num) OVER() AS num_anterior,
        LAG(id) OVER() AS id_anterior
    FROM Logs
    ORDER BY id
)

SELECT num AS ConsecutiveNums 
FROM comparising
WHERE num = num_siguiente
AND num = num_anterior
AND id = id_anterior + 1
AND id = id_siguiente - 1
GROUP BY num;

