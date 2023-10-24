USE upv_university;

-- Students
INSERT INTO students (students_fullName, students_email, students_user)
VALUES
    ('John Doe', 'jondoe@upv.com', 'jondoe'),
    ('Jane Smith', 'janesmith@upv.com', 'janesmith'),
    ('Bob Johnson', 'bobjohnson@upv.com', 'bobjohnson');

-- Professors
INSERT INTO professors (professors_fullName, professors_email, professors_user)
VALUES
    ('Barbara Person', 'barbaraP@upv.com', 'barbaraP'),
    ('Stephen Hawkins', 'stephenH@upv.com', 'stephenH'),
    ('Neil Degrasse', 'neilD@upv.com', 'neilD');

-- Courses
INSERT INTO courses (courses_name, courses_professor_id)
VALUES
    ('Introduction to Programming', 1),
    ('Calculus I', 2),
    ('Database Management', 1);
    ('Astrophysics', 3);

-- Grades
INSERT INTO grades (grades_students_id, grades_course_id, grades_grade)
VALUES
    (1, 1, 100),
    (1, 2, 54),
    (2, 1, 68),
    (2, 3, 90),
    (3, 2, 54),
    (3, 3, 75),
    (4, 1, 40),
    (4, 3, 79),
    (1, 2, 99),
    (2, 3, 25);