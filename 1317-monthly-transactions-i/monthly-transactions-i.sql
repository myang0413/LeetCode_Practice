SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    count(id) as trans_count, 
    SUM(CASE WHEN state = 'approved' then 1 else 0 END) as approved_count, 
    SUM(amount) as trans_total_amount, 
    SUM(CASE WHEN state = 'approved' then amount else 0 END) as approved_total_amount
FROM transactions
GROUP BY country,month
