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
