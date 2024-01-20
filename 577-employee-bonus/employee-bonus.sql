# Write your MySQL query statement below
SELECT name, bonus
FROM Employee as e
Left Join Bonus as B
ON e.empId = B.empId
WHERE bonus < 1000 OR bonus IS NULL