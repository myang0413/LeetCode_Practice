SELECT
    s.student_id,
    s.student_name,
    subj.subject_name,
    COALESCE(e.attended_exams, 0) AS attended_exams
FROM
    (Students s
    CROSS JOIN Subjects subj)
LEFT JOIN
    (SELECT
         student_id,
         subject_name,
         COUNT(*) AS attended_exams
     FROM
         Examinations
     GROUP BY
         student_id, subject_name) e ON s.student_id = e.student_id AND subj.subject_name = e.subject_name
ORDER BY
    s.student_id,
    subj.subject_name;
