-- Creation of the database
CREATE DATABASE IF NOT EXISTS upv_university;
USE upv_university;

-- Creation of the students table
CREATE TABLE students (
  `students_id` INT NOT NULL AUTO_INCREMENT,
  `students_fullName` VARCHAR(45) NOT NULL,
  `students_email` VARCHAR(45) NOT NULL,
  `students_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE INDEX `students_id_UNIQUE` (`students_id` ASC) VISIBLE,
  UNIQUE INDEX `students_email_UNIQUE` (`students_email` ASC) VISIBLE,
  UNIQUE INDEX `students_user_UNIQUE` (`students_user` ASC) VISIBLE);
  
-- Creation of the professors table  
CREATE TABLE professors (
  `professors_id` INT NOT NULL AUTO_INCREMENT,
  `professors_fullName` VARCHAR(45) NOT NULL,
  `professors_email` VARCHAR(45) NOT NULL,
  `professors_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`professors_id`),
  UNIQUE INDEX `professors_id_UNIQUE` (`professors_id` ASC) VISIBLE,
  UNIQUE INDEX `professors_user_UNIQUE` (`professors_user` ASC) VISIBLE,
  UNIQUE INDEX `professors_email_UNIQUE` (`professors_email` ASC) VISIBLE);
  
-- Creation of the courses table    
CREATE TABLE courses (
  `courses_id` INT NOT NULL AUTO_INCREMENT,
  `courses_name` VARCHAR(45) NOT NULL,
  `courses_professor_id` INT NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE INDEX `courses_id_UNIQUE` (`courses_id` ASC) VISIBLE,
  CONSTRAINT `courses_professor_id`
	  FOREIGN KEY (`courses_professor_id`)
	  REFERENCES `upv_university`.`professors` (`professors_id`)
	  ON DELETE CASCADE
	  ON UPDATE NO ACTION);

-- Creation of the grades table
CREATE TABLE `upv_university`.`grades` (
  `grades_id` INT NOT NULL AUTO_INCREMENT,
  `grades_course_id` INT NOT NULL,
  `grades_students_id` INT NOT NULL,
  `grades_grade` CHAR(2) NOT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE INDEX `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
  INDEX `grades_course_id_idx` (`grades_course_id` ASC) VISIBLE,
  INDEX `grades_students_id_idx` (`grades_students_id` ASC) VISIBLE,
  CONSTRAINT `grades_course_id`
    FOREIGN KEY (`grades_course_id`)
    REFERENCES `upv_university`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `grades_students_id`
    FOREIGN KEY (`grades_students_id`)
    REFERENCES `upv_university`.`students` (`students_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);    
  

