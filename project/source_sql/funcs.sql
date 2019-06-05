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
