CREATE TABLE Student (
    number INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    PRIMARY KEY (number)
);

CREATE TABLE Faculty (
    code INT NOT NULL,
    name VARCHAR(120) NOT NULL,
    address VARCHAR(256) NOT NULL,
    PRIMARY KEY (code)
);

CREATE TABLE Exam (
    code INT NOT NULL,
    name VARCHAR(60) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    duration SMALLINT NOT NULL,
    faculty INT NOT NULL,
    PRIMARY KEY (code),
    FOREIGN KEY (faculty) REFERENCES Faculty(code)
);

CREATE TABLE Application (
    number INT NOT NULL,
    code INT NOT NULL,
    date DATE NOT NULL,
    session TINYINT NOT NULL,
    grade FLOAT,
    PRIMARY KEY (number, code),
    FOREIGN KEY (number) REFERENCES Student(number),
    FOREIGN KEY (code) REFERENCES Exam(code)
);

DELIMITER $$

CREATE TRIGGER Before_Insert_Application
    BEFORE INSERT ON Application FOR EACH ROW
    BEGIN
        IF NEW.grade < 2.0 OR NEW.grade > 6.0
        THEN SIGNAL SQLSTATE '45000'
                SET
                   MESSAGE_TEXT = 'grade should be in interval [2.0, 6.0]',
                   TABLE_NAME = 'Application',
                   COLUMN_NAME = 'grade';
        END IF;
    END;
$$

CREATE TRIGGER Before_Update_Application
    BEFORE UPDATE ON Application FOR EACH ROW
    BEGIN
        IF NEW.grade < 2.0 OR NEW.grade > 6.0
        THEN SIGNAL SQLSTATE '45000'
                SET
                   MESSAGE_TEXT = 'grade should be in interval [2.0, 6.0]',
                   TABLE_NAME = 'Application',
                   COLUMN_NAME = 'grade';
        END IF;
    END;
$$

DELIMITER ;