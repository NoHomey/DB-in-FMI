DELIMITER $$

CREATE TRIGGER Before_Insert_Exam_Result
BEFORE INSERT ON `Exam_Result` FOR EACH ROW
BEGIN
    IF NEW.grade < 2.0 OR NEW.grade > 6.0
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'grade should be in interval [2.0, 6.0]',
            TABLE_NAME = 'Exam_Result',
            COLUMN_NAME = 'grade';
    END IF;
END;
$$

CREATE TRIGGER Before_Update_Exam_Result
BEFORE UPDATE ON `Exam_Result` FOR EACH ROW
BEGIN
    IF NEW.grade < 2.0 OR NEW.grade > 6.0
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'grade should be in interval [2.0, 6.0]',
            TABLE_NAME = 'Exam_Result',
            COLUMN_NAME = 'grade';
    END IF;
END;
$$

CREATE TRIGGER Before_Insert_Course
BEFORE INSERT ON `Course` FOR EACH ROW
BEGIN
    IF NEW.semester != 'F' AND NEW.semester != 'S'
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'semester should be F or S',
            TABLE_NAME = 'Course',
            COLUMN_NAME = 'semester';
    END IF;
END;
$$

CREATE TRIGGER Before_Update_Course
BEFORE UPDATE ON `Course` FOR EACH ROW
BEGIN
    IF NEW.semester != 'F' AND NEW.semester != 'S'
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'semester should be F or S',
            TABLE_NAME = 'Course',
            COLUMN_NAME = 'semester';
    END IF;
END;
$$

CREATE TRIGGER Before_Insert_Program_entry
BEFORE INSERT ON `Program_entry` FOR EACH ROW
BEGIN
    IF NEW.day_of_week < 1 OR NEW.day_of_week > 5
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'day_of_week should be in (1, 2, 3, 4, 5)',
            TABLE_NAME = 'Program_entry',
            COLUMN_NAME = 'day_of_week';
    END IF;
END;
$$

CREATE TRIGGER Before_Update_Program_entry
BEFORE UPDATE ON `Program_entry` FOR EACH ROW
BEGIN
    IF NEW.day_of_week < 1 OR NEW.day_of_week > 5
    THEN SIGNAL SQLSTATE '45000'
        SET
            MESSAGE_TEXT = 'day_of_week should be in (1, 2, 3, 4, 5)',
            TABLE_NAME = 'Program_entry',
            COLUMN_NAME = 'day_of_week';
    END IF;
END;
$$

DELIMITER ;
