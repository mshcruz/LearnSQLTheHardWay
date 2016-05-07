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
