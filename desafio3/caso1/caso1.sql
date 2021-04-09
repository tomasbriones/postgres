---creamos la base de datos donde vamos a trabajar---
CREATE DATABASE caso1;

---cambiamos a base de datos caso1---
\c caso1;

---creamos tabla de datos---
CREATE TABLE department(
    id_deparment SERIAL,
    department_name VARCHAR(50),
    PRIMARY KEY (id_deparment));

CREATE TABLE workers(rut VARCHAR UNIQUE NOT NULL,
    worker_name VARCHAR(50),
    worker_address VARCHAR(100),
    department_id INT,
    PRIMARY KEY (rut),
    FOREIGN KEY (department_id) REFERENCES department (id_deparment));

CREATE TABLE salary(
    salary_id SERIAL,
    drive_file VARCHAR,
    worker_rut VARCHAR,
    PRIMARY KEY (salary_id),
    FOREIGN KEY (worker_rut) REFERENCES workers(rut));

