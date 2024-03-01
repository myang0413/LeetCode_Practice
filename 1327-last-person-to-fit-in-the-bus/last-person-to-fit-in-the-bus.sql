WITH OrderedQueue AS (
  SELECT
    *,
    SUM(weight) OVER (ORDER BY turn) AS running_total_weight
  FROM Queue
),
LastPerson AS (
  SELECT
    person_name
  FROM OrderedQueue
  WHERE running_total_weight <= 1000
  ORDER BY running_total_weight DESC
  LIMIT 1
)
SELECT person_name FROM LastPerson;