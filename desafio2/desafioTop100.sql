----CREATE DATA BASE PELICULAS----

CREATE DATABASE peliculas;

----Crear tablas de peliculas y reparto----

CREATE TABLE peliculas (id SERIAL PRIMARY KEY, pelicula VARCHAR(25), año INT,  estreno DATE, director VARCHAR(40));
CREATE TABLE repartos (id INT, actor VARCHAR(40),FOREIGN KEY (id) REFERENCES peliculas(id));