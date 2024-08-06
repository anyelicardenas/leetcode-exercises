-- url exercise: 585. Investments in 2016
-- Medium level
WITH unique_location_policies AS (
    SELECT *, COUNT(lat) AS lat_count, COUNT(lon) AS lon_count
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(lat) = 1 AND COUNT(lon) = 1
),

duplicate_tiv_2015_policies AS (
    SELECT *, COUNT(tiv_2015) AS tiv_2015_count
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(tiv_2015) > 1
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016 
FROM Insurance 
WHERE tiv_2015 IN (SELECT tiv_2015 FROM duplicate_tiv_2015_policies)
AND pid IN (SELECT pid FROM unique_location_policies);