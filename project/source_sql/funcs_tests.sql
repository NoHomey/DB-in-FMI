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
