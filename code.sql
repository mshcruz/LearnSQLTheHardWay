/* Exercise 1*/
CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	age INTEGER
);

/* Exercise 2*/
CREATE TABLE IF NOT EXISTS person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	age INTEGER
);

CREATE TABLE pet (
	id INTEGER PRIMARY KEY,
	name TEXT,
	breed TEXT,
	age INTEGER,
	dead INTEGER
);

CREATE TABLE person_pet (
	person_id INTEGER,
	pet_id INTEGER
);

/* Exercise 3*/
INSERT INTO person (id, first_name, last_name, age)
		VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
		VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);

/* Exercise 4*/
INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);

/* Exercise 5*/
SELECT * FROM person;

SELECT name, age FROM pet;

SELECT name, age FROM pet WHERE dead = 0;

SELECT * FROM person WHERE first_name != "Zed";

SELECT * FROM pet WHERE age > 10;

SELECT * FROM person WHERE age < 30;

SELECT * FROM person WHERE age > 30;

SELECT * FROM person WHERE first_name = "Zed" AND age > 30;

SELECT * FROM person WHERE first_name = "Zed" OR first_name = "John" AND age > 15;

/* Exercise 6*/
SELECT pet.id, pet.name, pet.age, pet.dead
	FROM pet, person_pet, person
	WHERE
	pet.id = person_pet.pet_id AND
	person_pet.person_id = person.id AND
	person.first_name = "Zed";

/* Exercise 7*/
/* make sure there's dead pets*/
SELECT name, age FROM pet WHERE dead = 1;

/* aww poor robot*/
DELETE FROM pet WHERE dead = 1;

/* make sure the robot is gone */
SELECT * FROM pet;

/* let's resurrect the robot*/
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);

/* the robot LIVES! */
SELECT * FROM pet;

/* Exercise 8*/
DELETE FROM pet WHERE id IN (
	SELECT pet.id
	FROM pet, person_pet, person
	WHERE
	person.id = person_pet.person_id AND
	pet.id = person_pet.pet_id AND
	person.first_name = "Zed"
);

SELECT * FROM pet;
SELECT * FROM person_pet;

DELETE FROM person_pet
	WHERE pet_id NOT IN (
		SELECT id FROM pet
	);

SELECT * FROM person_pet;

DELETE FROM person_pet WHERE pet_id IN (
	SELECT id
	FROM pet
	WHERE
	dead = 1
);

SELECT * FROM person_pet;

/* Exercise 9 */
UPDATE person SET first_name = "Hilarious Guy"
	WHERE first_name = "Zed";

UPDATE pet SET name = "Fancy Pants"
	WHERE id=0;

SELECT * FROM person;
SELECT * FROM pet;

UPDATE person SET first_name = "Zed"
	WHERE id = 0;

UPDATE pet SET dead = 1
	WHERE id = 1;

UPDATE pet SET name = "DECEASED" WHERE id IN (
	SELECT id FROM pet WHERE dead = 1
);

SELECT * FROM person;
SELECT * FROM pet;

/* Exercise 10*/
SELECT * FROM pet;

UPDATE pet SET name = "Zed's Pet" WHERE id IN (
	SELECT pet.id
	FROM pet, person_pet, person
	WHERE
	person.id = person_pet.person_id AND
	pet.id = person_pet.pet_id AND
	person.first_name = "Zed"
);

UPDATE pet SET dead = 1
	WHERE id = 1;

UPDATE pet SET name = "Zed's Dead Pet" WHERE id IN (
	SELECT pet.id
	FROM pet, person_pet, person
	WHERE
	person.id = person_pet.person_id AND
	pet.id = person_pet.pet_id AND
	person.first_name = "Zed" AND
	pet.dead = 1
);

SELECT * FROM pet;

/* Exercise 11*/
/* This should fail because 0 is already taken. */
/* INSERT INTO person (id, first_name, last_name, age)
	VALUES (0, 'Frank', 'Smith', 100);
*/

/* We can force it by doing an INSERT OR REPLACE. */
INSERT OR REPLACE INTO person (id, first_name, last_name, age)
	VALUES (0, 'Frank', 'Smith', 100);

SELECT * FROM person;

/* And shorthand for that is just REPLACE. */
REPLACE INTO person (id, first_name, last_name, age)
	VALUES (0, 'Zed', 'Shaw', 37);

/* Now you can see I'm back. */
SELECT * FROM person;

/* Replace unicorn with a parrot*/
INSERT OR REPLACE INTO pet (id, name, breed, age, dead)
	VALUES (0, "Zed's Pet", "Parrot", 10, 0);

SELECT * FROM pet;

/* Exercise 12*/
ALTER TABLE person ADD COLUMN height REAL;

ALTER TABLE person ADD COLUMN weight REAL;
