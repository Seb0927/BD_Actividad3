CREATE FUNCTION grade_excep() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.grade < 1.00 OR NEW.grade > 5.00 THEN
        RAISE EXCEPTION 'Grade must be a value between 1.00 and 5.00';
    END IF;
    IF NEW.grade = OLD.grade THEN
        RAISE NOTICE 'Grade has not been modified';
    ELSE 
        RAISE NOTICE 'Grade has been modified TO %', NEW.grade;
    END IF;
    RETURN NEW;
END;
$$ language plpgsql;

CREATE TRIGGER grade_excep_trigger
    BEFORE INSERT OR UPDATE on enrolls
    FOR EACH ROW
    EXECUTE PROCEDURE grade_excep();

CREATE PROCEDURE create_teaches(instructor_id INTEGER, course_id INTEGER) AS $$
    DECLARE 
        sec INTEGER;
        yea INTEGER;
        sem INTEGER;
    BEGIN
        IF EXISTS(SELECT sec_id, semester, year INTO result FROM course_offering 
                    WHERE create_teaches.course_id = course_offering.course_id) THEN

            SELECT sec_id FROM result into sec;
            SELECT semester FROM sem into sem;
            SELECT year FROM result into yea;

            INSERT INTO teaches(course_id, sec_id, semester, year, instructor_id)
            VALUES(course_id, sec, sem, yea, instructor_id);

            COMMIT;
            
        ELSE RAISE NOTICE 'Course % is not in offer', course_id;
        END IF;
    END;
$$ language plpgsql;