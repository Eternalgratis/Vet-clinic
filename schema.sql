/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY(id)
);


/*Alter table*/
ALTER TABLE animals
ADD species VARCHAR(250);

/* creating multiple tables */
CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
);

ALTER TABLE animals
DROP species;

ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY( species_id) REFERENCES species(id);


ALTER TABLE animals
ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_animals_owners FOREIGN KEY( owner_id) REFERENCES owners(id);

/* create vet table */
CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id INT NOT NULL,
    vets_id INT NOT NULL,
    PRIMARY KEY(species_id, vets_id),
    CONSTRAINT fk_specializations_species  FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_specializations_vets  FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id INT NOT NULL,
    vets_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_visit_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
