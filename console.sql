--1
CREATE DATABASE UniversityDB;
--2
\connect UniversityDB;
CREATE SCHEMA university;
--3
CREATE TABLE university.Students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50)  NOT NULL,
    birt_date DATE,
    email TEXT NOT NULL UNIQUE
);
CREATE TABLE university.Courses(
    course_id SERIAL PRIMARY KEY,
    coure_name VARCHAR(100) NOT NULL,
    credits INT
);

--4
CREATE TABLE university.Enrollments(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES  university.Students(student_id),
    FOREIGN KEY (course_id) REFERENCES university.Courses(course_id)
);

--5
-- a)
CREATE TABLE students();
CREATE TABLE course();
CREATE TABLE enrollments();
-- b)
ALTER TABLE students ADD COLUMN birth_date DATE CHECK( EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date) >= 18);

--c)

DROP TABLE university.Enrollments;
DROP TABLE university.Students;
DROP TABLE university.Courses;




