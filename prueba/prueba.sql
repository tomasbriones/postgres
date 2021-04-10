---creamos base de datos---
CREATE DATABASE ventas;

---nos cambiamos a la base de datos---
\c ventas;

---creamos tablas---
CREATE TABLE client (
    id SERIAL,
    rut VARCHAR(20),
    client_name VARCHAR(50),
    adress VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE invoice (
    id SERIAL,
    createt_at DATE,
    client_id INT NOT NULL,
    sub_total INT,
    iva INT,
    total INT,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE category (
    id SERIAL,
    category_name VARCHAR(50),
    description_id VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id SERIAL,
    unitary_price INT,
    category_id INT NOT NULL,
    description_product VARCHAR(200),
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE invoice_detail_list (
    invoice_id INT NOT NULL,
    product_id INT NOT NULL,
    amount INT,
    unitary_price INT,
    product_total INT,
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);