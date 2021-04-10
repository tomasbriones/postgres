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

---2 facturas para el cliente 1---
INSERT INTO invoice (createt_at,client_id,sub_total,iva,total) VALUES ('2021-03-11',1,1200000,120000,1320000),('2021-04-01',1,36980,3698,40678);
INSERT INTO invoice_detail_list (invoice_id,product_id,amount, unitary_price,product_total) VALUES (1,1,3,400000,1200000),(2,6,1,5990,5990),(2,2,1,30990,30990);

---3 facturas para el cliente 2---
INSERT INTO invoice (createt_at,client_id,sub_total,iva,total) VALUES ('2021-03-15',2,3570,357,3927),('2021-03-20',2,1880,188,2068),('2021-04-01',2,33870,3387,37257);
INSERT INTO invoice_detail_list (invoice_id,product_id,amount, unitary_price,product_total) VALUES (3,3,2,1290,2580),(3,4,1,990,990),(4,8,1,890,890),(4,4,1,990,990),(5,5,3,11290,33870);

---1 factura para el cliente 3---
INSERT INTO invoice (createt_at,client_id,sub_total,iva,total) VALUES ('2021-04-10',3,30990,3099,34089);
INSERT INTO invoice_detail_list (invoice_id,product_id,amount, unitary_price,product_total) VALUES (6,2,1,30990,30990);

---4 facturas para el cliente 4---
INSERT INTO invoice (createt_at,client_id,sub_total,iva,total) VALUES ('2021-02-15',4,5180,518,5698),('2021-02-20',4,436980,43698,480678),('2021-04-01',4,27760,2776,30536),('2021-04-9',4,30990,3099,34089);
INSERT INTO invoice_detail_list (invoice_id,product_id,amount, unitary_price,product_total) VALUES (7,7,2,2590,5180),(8,7,1,5990,5990),(8,1,1,400000,400000),(8,2,2,30990,30990),(9,5,2,11290,22580),(9,7,2,2590,5180),(10,2,1,30990,30990);

---Cliente con compra mas cara---
SELECT cl.client_name as "Cliente con factura mas alta",
inv.total as Total
FROM client as cl 
JOIN invoice as inv ON cl.id=inv.client_id
WHERE inv.total = (SELECT max (invoice.total) from invoice);

-- Cliente con factura mas alta |  total
--------------------------------+---------
-- matias alarcon               | 1320000

---Cliente que pago sobre 100  (dado que 100 no se ajusta a mi escala, puse sobre 100.000 ,pero uno puede editar el rango)---
SELECT cl.client_name as "Cliente que pago sobre 100.000",
inv.total as Total
FROM client as cl 
JOIN invoice as inv ON cl.id=inv.client_id
WHERE inv.total > 100000;

-- Cliente que pago sobre 100.000 |  total
----------------------------------+---------
-- matias alarcon                 | 1320000
-- hernan martinez                |  480678

---cuantos clientes han comprado el producto 6 nombrando el producto que se compro (probar con otros productos)---
SELECT COUNT (cl.client_name) as "cantidad de clientes que han comprado",
pr.product_name as producto
FROM client as cl
JOIN invoice as inv ON cl.id=inv.client_id
JOIN invoice_detail_list as idl ON idl.invoice_id = inv.id
JOIN product as pr ON pr.id = idl.product_id
WHERE idl.product_id=6
GROUP BY producto;

-- cantidad de clientes que han comprado |          producto
-----------------------------------------+----------------------------
--                                     1 | calzoncillos aerodinamicos