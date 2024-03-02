WITH RECURSIVE LocationCounts AS (
    SELECT lat, lon, COUNT(*) AS location_count
    FROM Insurance
    GROUP BY lat, lon
),
TIV2015Groups AS (
    SELECT tiv_2015, COUNT(*) AS count_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
ValidPolicies AS (
    SELECT i.pid, i.tiv_2016
    FROM Insurance i
    JOIN LocationCounts lc ON i.lat = lc.lat AND i.lon = lc.lon
    JOIN TIV2015Groups tg ON i.tiv_2015 = tg.tiv_2015
    WHERE lc.location_count = 1
)
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM ValidPolicies;