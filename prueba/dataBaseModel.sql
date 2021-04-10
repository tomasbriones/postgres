---creamos base de datos---
CREATE DATABASE prueba;

---nos cambiamos a la base de datos---
\c prueba;

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
    product_name VARCHAR(50),
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

---Creamos los registros asociados a las tablas---
INSERT INTO client (rut,client_name,adress) VALUES ('15290068-6', 'matias alarcon','moneda 1234'),('20445098-3', 'josefa de las mercedes', 'diagonal paraguay 11 dpto 4'),('12334567-3','barbara vial', 'las condes 3441'), ('7890998-2','hernan martinez','el avellano 300, santiago'),('17289999-k','maria antonia diaz','quinta normal');

INSERT INTO category (category_name, description_id) VALUES ('insumos basicos','articulos escenciales para vivir dia a dia'),('materiales construccion','todo para construir y aareglar lo que sea'),('deporte','articulos deportivos de todos los deportes');

INSERT INTO product (product_name,unitary_price,category_id,description_product) VALUES ('bicicleta muy buena',400000,3,'bicicleta rapida y portable'),('zapatillas rapidas',30990,3,'zapatillas de la mejor calidad a buen precio'),('cereales donpepito',1290,1,'con todos los ingredientes escenciales'),('enlatados sanfra',990,1,'para sobrevivir la pandemia'),('set clavos 3/4 1kg',11290,2,'claves para tabiques'),('calzoncillos aerodinamicos',5990,3,'para sentirte calido y aerodinamico en todo momento'),('martillo ham',2590,2,'martillo economico y portable'),('tallarines mipasta',890,1,'cocer 3 min y servir al plato, pasta unica');

