/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-12';
SELECT name from animals WHERE (neutered = TRUE)AND(espace_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon') OR (name = 'Pikachu');
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE NOT name = 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;