-- Write your PostgreSQL query statement below
WITH FirstOrders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM
        Delivery
    GROUP BY
        customer_id
),
ImmediateFirstOrders AS (
    SELECT
        fo.customer_id,
        d.order_date,
        d.customer_pref_delivery_date,
        CASE
            WHEN d.order_date = d.customer_pref_delivery_date THEN 'Immediate'
            ELSE 'Scheduled'
        END AS order_type
    FROM
        FirstOrders fo
    JOIN Delivery d ON fo.customer_id = d.customer_id AND fo.first_order_date = d.order_date
)
SELECT
    ROUND((COUNT(*) FILTER (WHERE order_type = 'Immediate')::DECIMAL / COUNT(*)) * 100, 2) AS immediate_percentage
FROM
    ImmediateFirstOrders;