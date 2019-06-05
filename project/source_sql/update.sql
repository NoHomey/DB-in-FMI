UPDATE `Student`
SET `email` = 'hrisitina_mladenova@gmail.com'
WHERE `id` = 4;

UPDATE `Exam_Result`
SET `comment` = 'Practice more, you can do better!'
WHERE `student` = 1 AND `exam` = 1;
