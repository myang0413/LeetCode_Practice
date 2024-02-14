-- Write your PostgreSQL query statement below
WITH FirstYearSales AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
)

SELECT
    s.product_id,
    fys.first_year,
    s.quantity,
    s.price
FROM
    Sales s
JOIN
    FirstYearSales fys ON s.product_id = fys.product_id AND s.year = fys.first_year;
     

