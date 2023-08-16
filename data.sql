/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8),('Pikachu', '2021-01-07', 1, FALSE, 15.04) ;

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, TRUE, 11);

-- add species column

ALTER TABLE animals ADD species VARCHAR(50);

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
values('Charmander', '2020-02-08', 0, FALSE, -11),('Plantmon', '2021-11-15', 2, TRUE, -5.7)

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13), ('Angemon', '2005-06-12', 1, TRUE, -45), ('Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, espace_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17), ('Ditto', '2022-05-14', 4, TRUE, 22);

-- add in owners

BEGIN;
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
COMMIT;

BEGIN;
INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');
COMMIT;

BEGIN;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
COMMIT;

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name ='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name ='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name ='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name ='Boarmon';
COMMIT;

BEGIN;
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');
COMMIT;

BEGIN;
INSERT INTO specializations VALUES (1, 1), (2, 3), (1, 3), (2, 4);
COMMIT;

BEGIN;
INSERT INTO visits VALUES (1, 1, '2020-05-24'),
(1, 3, '2020-07-22'), (2, 4, '2021-02-02'),
(3, 2, '2020-01-05'), (3, 2, '2020-03-08'), 
(3,2, '2020-05-14'), (4,3, '2021-05-21'),
(7,4, '2021-02-24'), (8,2, '2019-12-21'),
(8,1, '2020-08-10'), (8,2, '2021-04-07')
(9, 3, '2019-09-29'), (1,4, '2020-10-03')
(1,4, '2021-11-04'), (11,2, '2019-01-24')
(11,2, '2019-05-15'),
(11,2, '2020-02-27'),(11,2, '2020-08-03')
(12,3, '2020-05-24'),(12,1, '2021-01-11');

COMMIT;