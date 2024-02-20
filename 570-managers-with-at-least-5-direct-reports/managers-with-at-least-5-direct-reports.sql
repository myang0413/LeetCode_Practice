SELECT E.name
FROM Employee E
JOIN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(id) >= 5
) AS Mgr ON E.id = Mgr.managerId;