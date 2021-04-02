----CREATE DATA BASE PELICULAS----

CREATE DATABASE peliculas;

----Crear tablas de peliculas y reparto----

CREATE TABLE peliculas (id INT PRIMARY KEY, pelicula VARCHAR(100), año_estreno INT, director VARCHAR(50));
CREATE TABLE repartos (id INT, actor VARCHAR(40),FOREIGN KEY (id) REFERENCES peliculas(id));

----cargar datos a ambas tablas desde csv-----

\copy peliculas (id,pelicula,año,estreno,director) FROM 'C:\Users\giani\OneDrive\Escritorio\postgres\desafio2\ApoyoDesafio2\peliculas.csv' delimiter ',' CSV header;
--error con cantidad de bits en string, corregir con ALTER TABLE peliculas ALTER COLUMN pelicula TYPE VARCHAR(150);----
\copy repartos (id,actor) FROM 'C:\Users\giani\OneDrive\Escritorio\postgres\desafio2\ApoyoDesafio2\reparto.csv' delimiter ',' CSV header;
--corregir Alex Angulo linea 575---

