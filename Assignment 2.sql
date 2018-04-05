/* Using the informatics database for creating a movie table */
USE informatics;

/* 1. Create the movie table with the appropriate data types and column definitions */

CREATE TABLE movie (
id INTEGER PRIMARY KEY,
name VARCHAR(100) NOT NULL,
release_date DATE NOT NULL,
lang VARCHAR(30) NOT NULL 
);

/* Shows the schema for the movie table */
DESCRIBE movie;

/* Inserting the data into the movie table */
/* 3. Insert data, as shown above into the two tables using INSERT INTO statements */

INSERT INTO movie (id, name, release_date, lang) 
VALUES (1, 'The Dark Knight', '2008-07-18', 'en_US');

INSERT INTO movie (id, name, release_date, lang)
VALUES (2, 'The Shawshank Redemption', '1994-09-23', 'en_US');

INSERT INTO movie (id, name, release_date, lang)
VALUES (3, 'Infernal Affairs', '2004-09-24', 'cn');

INSERT INTO movie (id, name, release_date, lang)
VALUES (4, '3 Idiots', '2009-12-23', 'hn');

/* Displaying the data in the movie table */

SELECT * 
FROM movie;

/*  Shows the list of all tables in the database */
SHOW TABLES;

/* 2. Create the movie_cast table with the appropriate data types and column definitions */
CREATE TABLE movie_cast (
movie_id INTEGER PRIMARY KEY,
director_name VARCHAR(50) NOT NULL,
actor_name VARCHAR(50) NOT NULL,
actress_name VARCHAR(50) NOT NULL
);

/* Shows the schema for the movie_cast table */
DESCRIBE movie_cast;

/* Inserting the data into movie_cast table */
/* 3. Insert data, as shown above into the two tables using INSERT INTO statements */ 

INSERT INTO movie_cast (movie_id, director_name, actor_name, actress_name)
VALUES (1, 'Christopher Nolan', 'Christian Bale', 'Maggie Gyllenhaal');

INSERT INTO movie_cast (movie_id, director_name, actor_name, actress_name)
VALUES (2, 'Frank Darabont', 'Morgan Freeman', 'Renee Blaine');

INSERT INTO movie_cast (movie_id, director_name, actor_name, actress_name)
VALUES (3, 'Andrew Lau', 'Tony Leung', 'Kelly Chen');

INSERT INTO movie_cast (movie_id, director_name, actor_name, actress_name)
VALUES (4, 'Rajkumar Hirani', 'Aamir Khan', 'Kareena Kapoor');

/* Displaying the data in the movie_cast table */

SELECT *
FROM movie_cast;

/* 4. Create a view called movie_actor_actress, which selects the name, actor_name and actress_name. */

CREATE VIEW movie_actor_actress AS 
SELECT name, actor_name, actress_name
FROM movie As m 
JOIN movie_cast AS mc
ON m.id= mc.movie_id;

/* Displaying the movie_actor_actress view */
SELECT * 
FROM movie_actor_actress;


/* 5. List name of movie that was released before 2008-01-01 */

SELECT name
FROM  movie
WHERE release_date < '2008-01-01';

/* Trying to DELETE the rows from the tables where language is hn */
CREATE TABLE combined AS 
SELECT *
FROM movie AS m
JOIN movie_cast AS mc
ON m.id= mc.movie_id;

SELECT *
FROM combined;

/* 6. DELETE the rows from the tables where language is hn */
DELETE m.*, mc.*
FROM movie AS m
LEFT JOIN movie_cast AS mc
ON m.id= mc.movie_id
WHERE m.lang = 'hn';

/* Displaying the updated content after deleting the rows from two tables  */
SELECT * 
FROM movie;

SELECT *
FROM movie_cast;

/* 7. Renaming the movie_cast table to movie_people */
RENAME TABLE movie_cast TO movie_people;

SELECT * 
FROM movie_people;

/* 8. Deleting the release_date column from movie table */
ALTER TABLE movie
DROP COLUMN release_date;

/* Displaying the table after deleting the release_date column from movie table */
SELECT *
FROM movie;

/* 9. List the Names of directors who have made an English movie */
SELECT mp.director_name
FROM movie AS m
JOIN movie_people AS mp
ON m.id=mp.movie_id
WHERE m.lang= 'en_US';


/* 10. List of actor_name and actress_name who have acted in a Chinese movie */
SELECT mp.actor_name AS 'Actor', mp.actress_name AS 'Actress'
FROM movie AS m
JOIN movie_people AS mp
ON m.id=mp.movie_id
WHERE m.lang= 'cn';













