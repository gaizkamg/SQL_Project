USE upv_university;

-- Average grade that is given by each professor
SELECT
    P.professors_id,
    P.professors_fullName,
    AVG(G.grades_grade) AS AverageGrade
FROM professors P
JOIN courses C ON P.professors_id = C.courses_professor_id
JOIN grades G ON C.courses_id = G.grades_course_id
GROUP BY P.professors_id, P.professors_fullName;

-- Top grade for each student
SELECT
	S.students_id,
    S.students_fullName,
    MAX(G.grades_grade) AS TopGrade
FROM students S
JOIN grades G ON S.students_id = G.grades_students_id
GROUP BY S.students_id, S.students_fullName;

-- Sort students by the courses that they are enrolled in
SELECT
	S.students_id,
    C.courses_name AS CourseName,
    S.students_fullName AS StudentName
    
FROM students S
JOIN grades G ON S.students_id = G.grades_students_id
JOIN courses C ON G.grades_course_id = C.courses_id
ORDER BY  C.courses_name, S.students_id;

-- Create a summary report of courses and their average grades, sorted by difficulty
SELECT 
	C.courses_name AS CourseName,
    AVG(G.grades_grade) AS AverageGrade

FROM courses C 
JOIN grades G ON C.courses_id = G.grades_course_id
GROUP BY C.courses_id, c.courses_name
ORDER BY AverageGrade ASC;

-- Finding which student and professor have the most courses in common
SELECT
    S.students_fullName AS StudentName,
    P.professors_fullName AS ProfessorName,
    COUNT(C.courses_id) AS CommonCourses
FROM Students S
JOIN Grades G ON S.students_id = G.grades_students_id
JOIN Courses C ON G.grades_course_id = C.courses_id
JOIN Professors P ON C.courses_professor_id = P.professors_id
GROUP BY S.students_fullName, P.professors_fullName
ORDER BY CommonCourses DESC;
