SELECT dept, title FROM instructor;

SELECT name, program FROM student WHERE student_id = 7656;

SELECT name FROM student NATURAL JOIN enrolls WHERE course_id = 837873;

CREATE VIEW better_students AS
    SELECT * FROM student NATURAL JOIN (
        SELECT year, enrolls.semester, max, student_id FROM enrolls INNER JOIN (
            SELECT max(grade), semester
            FROM enrolls 
            WHERE year BETWEEN 1900 AND 2018
            GROUP BY semester   
        ) AS max_per_semester
        ON max_per_semester.semester = enrolls.semester AND max_per_semester.max = enrolls.grade
    ) AS best_student_per_semester;

SELECT * FROM better_students;