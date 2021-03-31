------Crear base de datos posts------
CREATE DATABASE posts; 

------Crear tabla posts------
CREATE TABLE posts(id SERIAL, nombre_usuario VARCHAR(25),fecha_creacion DATE, contenido VARCHAR(200), descripcion VARCHAR(100));