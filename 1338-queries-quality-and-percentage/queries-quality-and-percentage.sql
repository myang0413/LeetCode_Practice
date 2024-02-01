-- Write your PostgreSQL query statement below
SELECT 
    query_name,
    ROUND(AVG(rating::numeric / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100, 2) AS poor_query_percentage
FROM 
    Queries

WHERE query_name is NOT NULL

GROUP BY 
    query_name;