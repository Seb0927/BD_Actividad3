\c lab4

INSERT INTO student(name, program)
VALUES
    ('Student 1', 'Program 1'),
    ('Student 2', 'Program 2'),
    ('Student 3', 'Program 3'),
    ('Student 4', 'Program 4'),
    ('Student 5', 'Program 5'),
    ('Student 6', 'Program 6');

INSERT INTO instructor(name, dept, title)
VALUES
    ('Instructor 1', 'Dept 1', 'Title a'),
    ('Instructor 2', 'Dept 2', 'Title b'),
    ('Instructor 3', 'Dept 3', 'Title c'),
    ('Instructor 4', 'Dept 4', 'Title d'),
    ('Instructor 5', 'Dept 5', 'Title e'),
    ('Instructor 6', 'Dept 6', 'Title f');

INSERT INTO course(title, syllabus, credits)
VALUES
    ('Course 1', 'Syllabus 1', 3),
    ('Course 2', 'Syllabus 2', 4),
    ('Course 3', 'Syllabus 3', 4),
    ('Course 4', 'Syllabus 4', 2),
    ('Course 5', 'Syllabus 5', 3),
    ('Course 6', 'Syllabus 6', 2);

INSERT INTO course_offering(year, semester, time, classroom, course_id)
VALUES
    (1995, 3, '2-4pm', '101', 837827),
    (2000, 4, '6-9am', '102', 837850),
    (2005, 4, '2-5pm', '103', 837873),
    (2010, 2, '7-9pm', '104', 837896),
    (2015, 3, '4-6pm', '105', 837919),
    (2020, 2, '2-4pm', '106', 837942);

INSERT INTO enrolls(year, semester, classroom, grade, course_id, student_id)
VALUES
    (1995, 3, '101', 1.42, 837827, 7488),
    (2000, 4, '102', 3.65, 837850, 7656),
    (2005, 4, '103', 2.29, 837873, 7824),
    (2010, 2, '104', 4.87, 837896, 7992),
    (2015, 3, '105', 5.00, 837919, 8160),
    (2020, 2, '106', 2.99, 837942, 8328);

INSERT INTO teaches(year, semester, classroom, course_id, instructor_id)
VALUES
    (1995, 3, '101', 837827, 1),
    (2000, 4, '102', 837850, 2),
    (2005, 4, '103', 837873, 3),
    (2010, 2, '104', 837896, 4),
    (2015, 3, '105', 837919, 5),
    (2020, 2, '106', 837942, 6);

INSERT INTO requires(main_course_id, prerequisite_id)
VALUES
    (837850, 837827),
    (837873, 837850),
    (837896, 837873),
    (837919, 837896),
    (837942, 837919);