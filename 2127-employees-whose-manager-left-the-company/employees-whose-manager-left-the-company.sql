-- Write your PostgreSQL query statement below
SELECT e.employee_id
FROM Employees e
WHERE e.salary < 30000 AND NOT EXISTS (
    SELECT 1
    FROM Employees m
    WHERE e.manager_id = m.employee_id
)
AND e.manager_id IS NOT NULL

ORDER BY e.employee_id;