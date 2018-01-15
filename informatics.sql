/* Creating an informatics database */
CREATE DATABASE informatics;

/* Use database */
USE informatics;

/* Creating an employee table */
CREATE TABLE employee (
firstname  VARCHAR(50) NOT NULL,
lastname   VARCHAR(50) NOT NULL,
salary     INT(6)      NOT NULL,
experience INT(2)      NOT NULL,
age        INT(2)      NOT NULL
);

/* Shows the schema for employee table */ 
DESCRIBE employee;

/* Shows the tables list in a informatics database*/
SHOW TABLES;

/* Inserting values into employee table */
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('John', 'George', 10000, 12, 45);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Harry', 'Jane', 5000, 3, 27);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Peter', 'Ethan', 4000, 3, 25);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Brown', 'Smith', 8000, 6, 31);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Andrew', 'Thomas', 5600, 5, 33);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Matthew', 'Thomas', 7800, 5, 35);
INSERT INTO employee (firstname, lastname, salary, experience, age)
VALUES ('Peter', 'George', 12000, 14, 48);

/* Viewing the employee table contents */
SELECT *
FROM employee;

/* Get the firstname and lastname of the employees whose salary is greater than 6000. */
SELECT firstname, lastname
FROM employee
WHERE salary > 6000;
/* Get all the details of the employees whose age is less than 40 years. */
SELECT *
FROM employee
WHERE age < 40;

/* List names of the employees whose experience is greater than 4 years and age less than 40 years. */
SELECT CONCAT(firstname, lastname) AS 'name'
FROM employee
WHERE experience > 4 AND age < 40;

/* Get all the lastnames without repetition of any rows from employee table. */
SELECT DISTINCT lastname
FROM employee;

/* Get the salary and age of the employees whose firstname is Peter. */
SELECT salary, age 
FROM employee
WHERE firstname = 'Peter';

/* Creating student_grade table */

CREATE TABLE student_grade (
name      VARCHAR(50) NOT NULL,
course    VARCHAR(50) NOT NULL, 
semester  VARCHAR(50) NOT NULL, 
grade     VARCHAR(50) NOT NULL
);

/* Shows the tables list in a informatics database*/
SHOW TABLES;
/* Shows the schema for the student_grade table */
DESCRIBE student_grade;

/* Inserting values into a student_grade table */
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('Sarah', 'I501', 'First', 'A');
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('Mike', 'I530', 'Second', 'B');
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('John', 'I530', 'First', 'A');
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('Smith', 'I501', 'First', 'A');
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('Matt', 'I530', 'Second', 'B');
INSERT INTO student_grade (name, course, semester, grade)
VALUES ('Jessica', 'I535', 'First', 'A');

/*  Viewing the student_grade table contents */
SELECT *
FROM student_grade;

/* Get the name of students who took I501 course and received A grade. */ 
SELECT name
FROM student_grade
WHERE course = 'I501' AND grade = 'A';

/* Get list of distinct courses from the above table. */ 
SELECT DISTINCT course
FROM student_grade;

/* Get the course and grades of the students who are in first semester */ 
SELECT course, grade
FROM student_grade
WHERE semester = 'First';

/* Get all details of the students who took I530 course */ 
SELECT *
FROM student_grade
WHERE course = 'I530';

/* Get all details of student(s) named Smith */ 
SELECT * 
FROM student_grade
WHERE name = 'Smith';





