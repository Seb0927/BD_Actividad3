-- Creacion de la base de datos
CREATE DATABASE lab4
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;

-- Conexion a la base de datos
\c lab4

CREATE SEQUENCE seq_student
INCREMENT 168
START 7488;

CREATE SEQUENCE seq_course
INCREMENT 23
START 837827;

CREATE TABLE student (
    student_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_student'),
    name VARCHAR(100) NOT NULL,
    program VARCHAR(100) NOT NULL 
);

CREATE TABLE instructor (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL 
);

CREATE TABLE course (
    course_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_course'),
    title VARCHAR(100) NOT NULL,
    syllabus VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL 
);

CREATE TABLE course_offering (
    sec_id SERIAL,
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    time VARCHAR(100) NOT NULL,
    classroom VARCHAR(100) NOT NULL, 
    course_id INTEGER NOT NULL,
    CONSTRAINT fk_course_id
        FOREIGN KEY (course_id)
        REFERENCES course (course_id),
    PRIMARY KEY(course_id, sec_id, year, semester)
);

CREATE TABLE enrolls (
    sec_id SERIAL,
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    classroom VARCHAR(100) NOT NULL, 
    grade NUMERIC(3, 2) CHECK (grade BETWEEN 1 AND 5),
    course_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    CONSTRAINT fk_course_id
        FOREIGN KEY (course_id)
        REFERENCES course (course_id),
    CONSTRAINT fk_student_id
        FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    PRIMARY KEY(student_id, course_id, sec_id, year, semester)
);

CREATE TABLE teaches (
    sec_id SERIAL,
    year INTEGER NOT NULL,
    semester INTEGER NOT NULL,
    classroom VARCHAR(100) NOT NULL, 
    course_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    CONSTRAINT fk_course_id
        FOREIGN KEY (course_id)
        REFERENCES course (course_id),
    CONSTRAINT fk_instructor_id
        FOREIGN KEY (instructor_id)
        REFERENCES instructor (instructor_id),
    PRIMARY KEY(instructor_id, course_id, sec_id, year, semester)
);

CREATE TABLE requires ( 
    main_course_id INTEGER NOT NULL,
    prerequisite_id INTEGER NOT NULL,
    CONSTRAINT fk_main_course_id
        FOREIGN KEY (main_course_id)
        REFERENCES course (course_id),
    CONSTRAINT fk_prerequisite_id
        FOREIGN KEY (prerequisite_id)
        REFERENCES course (course_id),
    PRIMARY KEY(main_course_id, prerequisite_id)
);