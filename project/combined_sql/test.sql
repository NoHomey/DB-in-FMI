CREATE TABLE `Student`
(
  `id` integer PRIMARY KEY,
  `mother` integer,
  `father` integer,
  `main_parent` integer NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` char(1),
  `phone` varchar(20),
  `email` varchar(100),
  `birthdate` date NOT NULL,
  `address` varchar(255) NOT NULL
);

CREATE TABLE `Parent`
(
  `id` integer PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` char(1),
  `phone` varchar(20) NOT NULL,
  `email` varchar(100),
  `birthdate` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `work` varchar(100)
);

CREATE TABLE `Teacher`
(
  `id` integer PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` char(1),
  `work_phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL
);

CREATE TABLE `Class`
(
  `id` integer PRIMARY KEY,
  `lead_teacher` integer NOT NULL,
  `school_year` year NOT NULL,
  `number` integer NOT NULL,
  `letter` char(1) NOT NULL,
  `class_room` integer NOT NULL,
  `class_hour` time NOT NULL
);

CREATE TABLE `Student_in_Class`
(
  `student` integer,
  `class_id` integer,
  PRIMARY KEY (`student`, `class_id`)
);

CREATE TABLE `Course`
(
  `id` integer PRIMARY KEY,
  `teacher` integer NOT NULL,
  `class_id` integer NOT NULL,
  `name` varchar(255) NOT NULL,
  `semester` char(1) NOT NULL
);

CREATE TABLE `Program_entry`
(
  `id` integer PRIMARY KEY,
  `course` integer NOT NULL,
  `day_of_week` tinyint NOT NULL,
  `room` integer NOT NULL,
  `starts` time NOT NULL,
  `hours` tinyint NOT NULL
);

CREATE TABLE `Exam`
(
  `id` integer PRIMARY KEY,
  `course` integer NOT NULL,
  `room` integer NOT NULL,
  `starts` datetime NOT NULL,
  `hours` tinyint NOT NULL
);

CREATE TABLE `Exam_Result`
(
  `student` integer,
  `exam` integer,
  `grade` float NOT NULL,
  `comment` varchar(255),
  PRIMARY KEY (`student`, `exam`)
);

ALTER TABLE `Student` ADD FOREIGN KEY (`mother`) REFERENCES `Parent` (`id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`father`) REFERENCES `Parent` (`id`);

ALTER TABLE `Student` ADD FOREIGN KEY (`main_parent`) REFERENCES `Parent` (`id`);

ALTER TABLE `Class` ADD FOREIGN KEY (`lead_teacher`) REFERENCES `Teacher` (`id`);

ALTER TABLE `Student_in_Class` ADD FOREIGN KEY (`student`) REFERENCES `Student` (`id`);

ALTER TABLE `Student_in_Class` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`teacher`) REFERENCES `Teacher` (`id`);

ALTER TABLE `Course` ADD FOREIGN KEY (`class_id`) REFERENCES `Class` (`id`);

ALTER TABLE `Program_entry` ADD FOREIGN KEY (`course`) REFERENCES `Course` (`id`);

ALTER TABLE `Exam` ADD FOREIGN KEY (`course`) REFERENCES `Course` (`id`);

ALTER TABLE `Exam_Result` ADD FOREIGN KEY (`student`) REFERENCES `Student` (`id`);

ALTER TABLE `Exam_Result` ADD FOREIGN KEY (`exam`) REFERENCES `Exam` (`id`);
CREATE VIEW Grade AS
SELECT
    `Exam_Result`.`student` as `student`,
    `Student`.`first_name` as `student_first_name`,
    `Student`.`last_name` as `student_last_name`,
    `Class`.`id` as `class`,
    `Class`.`school_year` as `school_year`,
    `Class`.`number` as `class_number`,
    `Class`.`letter` as `class_letter`,
    `Course`.`id` as `course`,
    `Course`.`name` as `course_name`,
    `Course`.`semester` as `course_semester`,
    `Teacher`.`id` as `teacher`,
    `Teacher`.`first_name` as `teacher_first_name`,
    `Teacher`.`last_name` as `teacher_last_name`,
    `Exam`.`starts` as `exam_date`,
    `Exam_Result`.`grade` as `grade`,
    `Exam_Result`.`comment` as `comment`
FROM
    `Exam_Result`
    JOIN `Student`
    ON `Exam_Result`.`student` = `Student`.`id`
    JOIN `Exam`
    ON `Exam_Result`.`exam` = `Exam`.`id`
    JOIN `Course`
    ON `Exam`.`course` = `Course`.`id`
    JOIN `Class`
    ON `Course`.`class_id` = `Class`.`id`
    JOIN `Teacher`
    ON `Course`.`teacher` = `Teacher`.`id`;

CREATE VIEW Program AS
SELECT
    `Program_entry`.`id` as `entry`,
    `Program_entry`.`day_of_week` as `day_of_week`,
    `Program_entry`.`room` as `room`,
    `Program_entry`.`starts` as `starts`,
    `Program_entry`.`hours` as `hours`,
    `Program_entry`.`course` as `course`,
    `Course`.`name` as `subject`,
    `Course`.`semester` as `semester`,
    `Course`.`teacher` as `teacher`,
    `Teacher`.`first_name` as `teacher_first_name`,
    `Teacher`.`last_name` as `teacher_last_name`,
    `Course`.`class_id` as `class_id`,
    `Class`.`school_year` as `school_year`,
    `Class`.`number` as `class_number`,
    `Class`.`letter` as `class_letter`
FROM
    `Program_entry`
    JOIN `Course`
    ON `Program_entry`.`course` = `Course`.`id`
    JOIN `Teacher`
    ON `Course`.`teacher` = `Teacher`.`id`
    JOIN `Class`
    ON `Course`.`class_id` = `Class`.`id`;
INSERT INTO `Teacher` (`id`, `first_name`, `last_name`, `gender`, `work_phone`, `email`, `address`)
VALUES
    (1, 'Veselka', 'Hristova', 'F', '0899881278', 'v.hristova@tues.com', 'Sofia, str. Momina sulza 15'),
    (2, 'Kiril', 'Mitov', 'M', '0988812571', 'k.mitov@tues.com', 'Sofia, bul. Bulgariq 100'),
    (3, 'Mariqna', 'Krachunova', 'F', '0899882687', 'm.krachunova@tues.com', 'Sofia, bul. Lomsko shose 17');

INSERT INTO `Class` (`id`, `lead_teacher`, `school_year`, `number`, `letter`, `class_room`, `class_hour`)
VALUES
    (1, 1, 2016, 12, 'B', 42, '14:00:00'),
    (2, 3, 2016, 12, 'A', 29, '13:15:00');

INSERT INTO `Course` (`id`, `teacher`, `class_id`, `name`, `semester`)
VALUES
    (1, 1, 1, 'Mathematics', 'F'),
    (2, 1, 1, 'Mathematics', 'S'),
    (3, 3, 1, 'Literature', 'F'),
    (4, 3, 1, 'Literature', 'S'),
    (5, 2, 1, 'Technology of Programming', 'F'),
    (6, 2, 1, 'Data bases', 'S'),
    (7, 1, 2, 'Mathematics', 'F'),
    (8, 1, 2, 'Mathematics', 'S'),
    (9, 3, 2, 'Literature', 'F'),
    (10, 3, 2, 'Literature', 'S'),
    (11, 2, 2, 'Technology of Programming', 'F'),
    (12, 2, 2, 'Data bases', 'S');

INSERT INTO `Program_entry` (`id`, `course`, `day_of_week`, `room`, `starts`, `hours`)
VALUES
    (1, 1, 1, 42, '11:15:00', 2),
    (2, 3, 2, 29, '10:20:00', 2),
    (3, 5, 3, 32, '11:20:00', 3),
    (4, 3, 4, 32, '14:00:00', 2),
    (5, 1, 5, 42, '16:10:00', 2),
    (6, 7, 1, 42, '14:15:00', 2),
    (7, 9, 2, 29, '12:20:00', 2),
    (8, 11, 3, 32, '16:20:00', 3),
    (9, 9, 4, 32, '12:00:00', 2),
    (10, 7, 5, 42, '14:10:00', 2);

INSERT INTO `Exam` (`id`, `course`, `room`, `starts`, `hours`)
VALUES
    (1, 1, 47, '2015-12-17 12:00:00', 2),
    (2, 1, 47, '2016-01-15 10:00:00', 2),
    (3, 3, 29, '2015-01-10 12:00:00', 2),
    (4, 3, 29, '2015-01-17 11:00:00', 3),
    (5, 7, 46, '2015-01-10 14:00:00', 2),
    (6, 7, 47, '2015-01-20 10:00:00', 3);

INSERT INTO `Parent` (`id`, `first_name`, `last_name`, `gender`, `phone`, `email`, `birthdate`, `address`, `work`)
VALUES
    (1, 'Antonia', 'Stavreva', 'F', '0899881268', 'stavreva@gmail.com', '1970-02-02', 'Sofia, City center, str. Ivan Vazov 5', 'Layer'),
    (2, 'Anton', 'Stavrev', 'M', '0899886890', 'stavrev@gmail.com', '1968-11-15', 'Sofia, City center, str. Ivan Vazov 5', 'Judge'),
    (3, 'Milna', 'Angelova', 'F', '0899885412', 'a.angelova@gmail.com', '1980-10-12', 'Sofia, Drujba 1, str. Ivan Penkov 10', 'Banker'),
    (4, 'Angel', 'Mladenov', 'M', '0899885313', 'mladenov@angel.com', '1980-07-13', 'Sofia, Poduqne, garata 182', 'Teacher');

INSERT INTO `Student` (`id`, `mother`, `father`, `main_parent`, `first_name`, `last_name`, `gender`, `phone`, `email`, `birthdate`, `address`)
VALUES
    (1, 1, 2, 1, 'Ivan', 'Stavrev', 'M', '0899881345', 'ivan.stavrev@gmail.com', '1997-11-16', 'Sofia, City center, str. Ivan Vazov 5'),
    (2, 1, 2, 2, 'Mila', 'Stavreva', 'F', '0988131791', 'mila.stavreva@gmail.com', '1997-10-14', 'Sofia, City center, str. Ivan Vazov 5'),
    (3, 3, NULL, 3, 'Jordan', 'Angelov', 'M', '0888123773', 'jordan-69@gmail.com', '1997-03-03', 'Sofia, Drujba 1, str. Ivan Penkov 10'),
    (4, NULL, 4, 4, 'Hristina', 'Mladenova', 'F', '08819319392', 'hrisitooo0@gmail.com', '1997-03-19', 'Sofia, Poduqne, garata 182');

INSERT INTO `Student_in_Class` (`student`, `class_id`)
VALUES
    (1, 1),
    (2, 2),
    (3, 1),
    (4, 2);

INSERT INTO `Exam_Result` (`student`, `exam`, `grade`)
VALUES
    (1, 1, 5.25),
    (3, 1, 6),
    (1, 2, 5),
    (3, 2, 6),
    (1, 3, 6),
    (3, 3, 5),
    (1, 4, 6),
    (3, 4, 6),
    (2, 5, 5),
    (4, 5, 5),
    (2, 6, 6),
    (4, 6, 6);
UPDATE `Student`
SET `email` = 'hrisitina_mladenova@gmail.com'
WHERE `id` = 4;

UPDATE `Exam_Result`
SET `comment` = 'Practice more, you can do better!'
WHERE `student` = 1 AND `exam` = 1;
DELETE FROM `Program_entry`
WHERE `id` = 10;
SELECT * FROM Grade;

SELECT * FROM Program;