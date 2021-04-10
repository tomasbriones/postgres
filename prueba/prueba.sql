---creamos base de datos---
CREATE DATABASE ventas;

---nos cambiamos a la base de datos---
\c ventas;

---creamos tablas---
CREATE TABLE cliente (
    id SERIAL,
    rut VARCHAR(20),
    cliente_name VARCHAR(50),
    adress VARCHAR(200)
);

