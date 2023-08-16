/* Database schema to keep the structure of entire database. */

 CREATE DATABASE vet_clinic;

CREATE TABLE animals ( 
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL, date_of_birth DATE NOT NULL,
  espace_attempts INT, neutered BOOLEAN NOT NULL,
  weight_kg  DEC(11, 5)
);
