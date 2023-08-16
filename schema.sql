/* Database schema to keep the structure of entire database. */

 CREATE DATABASE vet_clinic;

CREATE TABLE animals ( 
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL, date_of_birth DATE NOT NULL,
  espace_attempts INT, neutered BOOLEAN NOT NULL,
  weight_kg  DEC(11, 5),PRIMARY KEY(id)
);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY, 
  full_name VARCHAR(60) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY(id)
);

 CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL,
  PRIMARY KEY(id)
);

ALTER TABLE animals DROP species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(60) NOT NULL,
  age INT NOT NULL,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations(
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
  PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
  animal_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets(id),
  PRIMARY KEY (animal_id, vets_id, date_of_visit)
);
