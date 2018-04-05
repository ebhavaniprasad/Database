/* Using the informatics database for creating a patient table */
USE informatics;

/* Creating the patient table */

CREATE TABLE patient (
patient_id INTEGER PRIMARY KEY,
place VARCHAR(50) NOT NULL,
profession VARCHAR(50) NOT NULL,
age INTEGER NOT NULL
);

/* Describes the schema for the created patient table */
DESCRIBE patient;

/* Inserting the data into patient table */
INSERT INTO patient (patient_id, place, profession, age)
VALUES (101, 'Indiana', 'Software', 23);

INSERT INTO patient (patient_id, place, profession, age)
VALUES (102, 'Ohio', 'Teacher', 45);

INSERT INTO patient (patient_id, place, profession, age)
VALUES (103, 'Ohio', 'Doctor', 65);

INSERT INTO patient (patient_id, place, profession, age)
VALUES (104, 'Indiana', 'Software', 34);

INSERT INTO patient (patient_id, place, profession, age)
VALUES (105, 'Wisconsin', 'Pharmacist', 69);

/* Creating the disease table */

CREATE TABLE disease (
patient_id INTEGER NOT NULL,
disease_name VARCHAR(50) NOT NULL,
duration_stay INTEGER NOT NULL,
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

ALTER TABLE disease 
CHANGE COLUMN duration_of_stay  duration_of_stay INTEGER NOT NULL;

/* Describes the schema for the created patient table */
DESCRIBE disease;

/* Inserting the data into disease table */

INSERT INTO disease (patient_id, disease_name, duration_of_stay)
VALUES (101, 'Gastritis', 12);

INSERT INTO disease (patient_id, disease_name, duration_of_stay)
VALUES (102, 'Cancer', 12);

INSERT INTO disease (patient_id, disease_name, duration_of_stay)
VALUES (103, 'Fever', 4);

INSERT INTO disease (patient_id, disease_name, duration_of_stay)
VALUES (104, 'Flu', 2);

INSERT INTO disease (patient_id, disease_name, duration_of_stay)
VALUES (105, 'Cancer', 89);

UPDATE disease
SET duration_of_stay = 56
WHERE patient_id= 102;

/* Displaying the contents in the disease table */

SELECT * 
FROM disease;

/* Creating the provider table */

CREATE TABLE provider (
disease_id INTEGER AUTO_INCREMENT, 
disease_name VARCHAR(50), 
doctor_name VARCHAR(50) NOT NULL,
PRIMARY KEY (disease_id, disease_name)
);
/* Describes the schema for the provider table */
DESCRIBE provider;

/* Inserting the data into the provider table */

INSERT INTO provider (disease_name, doctor_name)
VALUES ('Cancer', 'Mary Smith');

INSERT INTO provider (disease_name, doctor_name)
VALUES ('Flu', 'Sam Jones');

INSERT INTO provider (disease_name, doctor_name)
VALUES ('Fever', 'John Smith');

INSERT INTO provider (disease_name, doctor_name)
VALUES ('Gastritis', 'Thomas Jefferson');

INSERT INTO provider (disease_name, doctor_name)
VALUES ('Vertigo', 'Anthony Hopkins');

SELECT *
FROM provider;


/* List the patient_id and age of patients who are NOT suffering with Cancer */

SELECT p.patient_id, p.age
FROM patient AS p JOIN disease AS d
ON p.patient_id= d.patient_id
WHERE d.disease_name != 'Cancer';

/* List disease_name where patients are in profession of Software or Doctor */

SELECT d.disease_name
FROM patient AS p JOIN disease AS d
ON p.patient_id= d.patient_id
WHERE p.profession IN ('Software','Doctor');

/* List disease_name where the doctor's name has Smith */

SELECT pd.disease_name
FROM provider AS pd
WHERE pd.doctor_name LIKE '% Smith';

/* Give the average age of patients by the name of the place */

SELECT p.place, ROUND(sum(p.age)/count(place), 1) AS 'Average age'
FROM patient AS p
GROUP BY p.place;

/* Give the patient_id sorted in descending by their age */

SELECT p.patient_id AS 'sorted id'
FROM patient AS p
ORDER BY p.age DESC;

/* Give the unique count of places from patient table. */

SELECT COUNT(DISTINCT p.place) AS 'Unique count'
FROM patient AS p;

/* Give a combination of the patient and disease tables without duplicating columns */

SELECT p.*, d.disease_name, duration_of_stay
FROM patient AS p JOIN disease AS d
ON p.patient_id= d.patient_id;

SELECT * 
FROM patient
WHERE age= 69;


SELECT *
FROM patient
WHERE age =
(
SELECT max(age)
FROM patient
);

SELECT place, age, count(place), round(age/count(place), 1), age/count(place)
FROM patient
GROUP BY place;