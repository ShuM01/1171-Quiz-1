CREATE TABLE `Programs` (
  `program_id` INT PRIMARY KEY,
  `program_code` VARCHAR(50),
  `program_name` VARCHAR(100),
  `program_degree` VARCHAR(100)
);

CREATE TABLE `Courses` (
  `courses_id` INT PRIMARY KEY,
  `course_grade` CHAR(2),
  `course_code` CHAR(50),
  `course_title` TEXT,
  `course_credits` INT,
  `course_points` DECIMAL,
  `course_gpa` DECIMAL,
  `CGPA` DECIMAL,
  `semester_id` INT,
  `program_id` INT,
  `comments` VARCHAR(50)
);

CREATE TABLE `Enrolled_Semester` (
  `semester_id` INT PRIMARY KEY,
  `student_id` INT,
  `semester` VARCHAR(50),
  `semester_earned` DECIMAL,
  `semester_attempted` DECIMAL,
  `semester_points` DECIMAL,
  `semester_gpa` DECIMAL
);

CREATE TABLE `EnrolledSemester_Crs` (
  `Crs_id` INT PRIMARY KEY,
  `semester_id` INT,
  `course_id` INT
);

CREATE TABLE `Student_information` (
  `student_id` INT PRIMARY KEY,
  `DOB` INT,
  `gender` CHAR(1),
  `program_start` VARCHAR(100),
  `programEnd` INT,
  `program_status` VARCHAR(100),
  `grad_date` INT,
  `district` TEXT,
  `city` TEXT,
  `ethnicity` TEXT,
  `feeder_id` INT,
  `program_id` INT
);

CREATE TABLE `Feeder` (
  `feeder_id` INT PRIMARY KEY,
  `feeder` TEXT
);

ALTER TABLE `Enrolled_Semester` ADD FOREIGN KEY (`student_id`) REFERENCES `Student_information` (`student_id`);

ALTER TABLE `EnrolledSemester_Crs` ADD FOREIGN KEY (`semester_id`) REFERENCES `Enrolled_Semester` (`semester_id`);

ALTER TABLE `Student_information` ADD FOREIGN KEY (`feeder_id`) REFERENCES `Feeder` (`feeder_id`);

ALTER TABLE `Courses` ADD FOREIGN KEY (`program_id`) REFERENCES `Programs` (`program_id`);

ALTER TABLE `EnrolledSemester_Crs` ADD FOREIGN KEY (`course_id`) REFERENCES `Courses` (`courses_id`);

--Average time to graduation for BINT program:

SELECT 
    AVG(TO_DATE(grad_date, 'MM/DD/YYYY') - TO_DATE("programEnd", 'MM/DD/YYYY')) AS average_time_to_graduation
FROM "Student_information"
WHERE program_status = 'Graduated';

--Graduation rate for BINT program:

SELECT 
    COUNT(*) AS total_graduated,
    COUNT(*) / (SELECT COUNT(*) FROM "Student_information" WHERE program_status = 'Graduated') AS graduation_rate
FROM "Student_information"
WHERE program_status = 'Graduated';

--Ranking feeder institutions by admission rates:

SELECT 
    p.program_code, 
    COUNT(*) AS total_applications, 
    COUNT(*) / (SELECT COUNT(*) FROM "Student_information" WHERE program_status = 'Graduated') AS application_rate,
    COUNT(CASE WHEN program_status = 'Graduated' THEN 1 END) AS total_accepted,
    COUNT(CASE WHEN program_status = 'Graduated' THEN 1 END) / COUNT(*) AS acceptance_rate
FROM "Student_information" s
JOIN "Feeder" f ON s.feeder_id = f.feeder_id
JOIN "Programs" p ON s.program_id = p.program_id
WHERE s.program_status = 'Graduated'
GROUP BY p.program_code
ORDER BY acceptance_rate DESC;

--Overall acceptance rate for BINT program:

SELECT 
    COUNT(*) AS total_accepted,
    CASE WHEN (SELECT COUNT(*) FROM "Student_information" WHERE program_status = 'Graduated') = 0 
         THEN 0
         ELSE COUNT(*) / (SELECT COUNT(*) FROM "Student_information" WHERE program_status = 'Graduated') 
    END AS acceptance_rate
FROM "Student_information"
WHERE program_id = 13 AND program_status = 'Graduated';