WITH UserRatings AS (
    SELECT
        u.name,
        COUNT(*) AS total_ratings
    FROM
        MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
    ORDER BY total_ratings DESC, u.name
    LIMIT 1
), MovieRatings AS (
    SELECT
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM
        MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE
        mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title
    LIMIT 1
)
SELECT name AS results FROM UserRatings
UNION ALL
SELECT title FROM MovieRatings;
