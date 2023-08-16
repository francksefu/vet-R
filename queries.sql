/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-12';
SELECT name from animals WHERE (neutered = TRUE)AND(espace_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
  UPDATE animals SET species = 'unspecified';
  select * from animals;
ROLLBACK;
select * from animals;

BEGIN;
  UPDATE animals SET species ='digimon' WHERE name LIKE '%mon';
  select * from animals;
  UPDATE animals SET species ='pokemon' WHERE species IS NULL;
  select * from animals;
COMMIT;
select * from animals;

BEGIN;
  DELETE FROM animals;
ROLLBACK;
select * from animals;

BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  select * from animals;
  SAVEPOINT SP0;
COMMIT;

BEGIN;
 SAVEPOINT SP1;
 UPDATE animals SET weight_kg = weight_kg*(-1);
 select * from animals;
  ROLLBACK to SP1;
  select * from animals;
  UPDATE animals SET weight_kg = weight_kg*(-1) WHERE weight_kg < 0;
  select * from animals;
COMMIT;

 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE espace_attempts = 0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, MAX(espace_attempts) FROM animals GROUP BY neutered;
 select MIN(weight_kg), MAX(weight_kg), species from animals GROUP BY species;

 --for the last
 SELECT AVG(espace_attempts), species FROM (SELECT*FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31') as animal GROUP BY species;

--
SELECT * from animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT * from animals a JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT * from animals a RIGHT JOIN owners o ON a.owner_id = o.id;
SELECT COUNT(*), s.name from animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT a.name from animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id WHERE (s.name ='Digimon' AND o.full_name = 'Jennifer Orwell');
SELECT a.name, a.date_of_birth, a.espace_attempts,a.neutered, a.weight_kg, s.name from animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id WHERE (a.espace_attempts = 0 AND o.full_name = 'Dean Winchester');
SELECT o.full_name, COUNT(o.id) from animals a JOIN owners o ON a.owner_id = o.id GROUP BY o.id HAVING COUNT(o.id) = (SELECT MAX(num) FROM ( SELECT o.full_name as full_name, COUNT(o.id) as num from animals a JOIN owners o ON a.owner_id = o.id GROUP BY o.id) as tab);

