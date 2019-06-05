DELIMITER $$

CREATE FUNCTION full_gender(gender char(1)) RETURNS char(6)
LANGUAGE SQL
BEGIN
    RETURN CASE gender
        WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
        ELSE 'Other'
    END;
END $$

CREATE FUNCTION full_semester(semester char(1)) RETURNS char(6)
LANGUAGE SQL
BEGIN
    RETURN CASE semester
        WHEN 'F' THEN 'First'
        WHEN 'S' THEN 'Second'
        ELSE 'Unknown'
    END;
END $$

CREATE FUNCTION day_of_week_as_string(day_of_week tinyint) RETURNS char(9)
LANGUAGE SQL
BEGIN
    RETURN CASE day_of_week
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        ELSE 'Unknown'
    END;
END $$

DELIMITER ;
SELECT full_semester(semester) as t,
(CASE
    WHEN semester = 'F' THEN 'First'
    WHEN semester = 'S' THEN 'Second'
    ELSE NULL
END) AS c
FROM Course;

SELECT full_gender(gender) as t,
(CASE
    WHEN gender = 'M' THEN 'Male'
    WHEN gender = 'F' THEN 'Female'
    ELSE 'Other'
END) AS c
FROM Student;

SELECT full_gender(gender) as t,
(CASE
    WHEN gender = 'M' THEN 'Male'
    WHEN gender = 'F' THEN 'Female'
    ELSE 'Other'
END) AS c
FROM Teacher;

SELECT full_gender(gender) as t,
(CASE
    WHEN gender = 'M' THEN 'Male'
    WHEN gender = 'F' THEN 'Female'
    ELSE 'Other'
END) AS c
FROM Parent;

SELECT day_of_week_as_string(day_of_week) as t,
(CASE
    WHEN day_of_week = 1 THEN 'Monday'
    WHEN day_of_week = 2 THEN 'Tuesday'
    WHEN day_of_week = 3 THEN 'Wednesday'
    WHEN day_of_week = 4 THEN 'Thursday'
    WHEN day_of_week = 5 THEN 'Friday'
    ELSE NULL
END) AS c
FROM Program_entry;
