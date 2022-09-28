/* create a table */

CREATE TABLE medical_hitories (
    id INT NOT NULL GENERATED AS ALWAYS,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(250)
    PRIMARY KEY(id)
);

CREATE TABLE patients (
    id INT NOT NULL GENERATED AS ALWAYS,
    name VARCHAR(250),
    date_of_birth DATE,
    PRIMARY KEY(id),
);

CREATE TABLE treatments (
    id INT NOT NULL GENERATED AS ALWAYS,
    type VARCHAR(200),
    name VARCHAR(250),
    PRIMARY KEY(id),
);

CREATE TABLE invoices (
    id INT NOT NULL GENERATED AS ALWAYS,
    total_amount DECIMAL,
    generated_id TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_hitories(id),
    PRIMARY KEY(id),
);

CREATE TABLE invoice_items (
    id INT NOT NULL GENERATED AS ALWAYS,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
);

CREATE TABLE medical_hitories_treatment (
    medical_history_id INT REFERENCES medical_hitories(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(medical_history_id, treatment_id),
);