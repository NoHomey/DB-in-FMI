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
