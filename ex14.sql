ALTER /*TABLE*/ person ADD COLUMN dead INTEGER;

ALTER TABLE person ADD COLUMN phone_number INTEGER;

ALTER TABLE person ADD COLUMN salary FLOAT;

ALTER TABLE person ADD COLUMN dob DATETIME;

/*ALTER TABLE pet ADD COLUMN dob DATETIME;*/

ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

ALTER TABLE pet ADD COLUMN parent INTEGER;

UPDATE person SET 
	dead = 0,
	phone_number = 012345,
	salary = 200.1,
	dob = "1980-01-01"
	WHERE id = 0;

UPDATE pet SET
	dob = "2012-12-12"
	WHERE id = 0;

UPDATE person_pet SET
	purchased_on = "2013-01-01"
	WHERE person_id = 0 AND pet_id = 0;

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (1, "John", "Snow", 20, 0, 67890, 0.50, "1800-08-08");

INSERT INTO person (id, first_name, last_name, age, dead, phone_number, salary, dob)
	VALUES (2, "Spider", "Man", 30, 0, 409273, 2133.50, "1970-08-08");
	
INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (1, "Ken", "Dog", 88888888, 0, "2004-04-04", 0);

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (3, "Pluto", "Dog", 5, 0, "1960-05-05", 1);

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (4, "Fourth pet", "Horse", 3, 0,  "2010-10-10", 3);

INSERT INTO pet (id, name, breed, age, dead, dob, parent)
	VALUES (2, "Second pet", "Eagle", 1, 0, "2015-11-11", 1);
	
INSERT INTO person_pet (person_id, pet_id, purchased_on) VALUES (1, 3, "1900-09-09");

INSERT INTO person_pet (person_id, pet_id, purchased_on) VALUES (2, 2, "2010-04-04");

INSERT INTO person_pet (person_id, pet_id, purchased_on) VALUES (0, 4, "1999-03-03");

INSERT INTO person_pet (person_id, pet_id, purchased_on) VALUES (1, 1, "1998-08-08");

SELECT * FROM pet;

SELECT * FROM person;

SELECT * FROM person_pet;

SELECT pet.name, person.first_name
	FROM person, pet, person_pet
	WHERE person_pet.purchased_on > "2004-01-01" 
		AND person_pet.person_id = person.id
		AND person_pet.pet_id = pet.id;

SELECT name 
	FROM pet
	WHERE pet.parent = 1;

