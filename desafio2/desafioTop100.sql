----CREATE DATA BASE PELICULAS----

CREATE DATABASE peliculas;

----Crear tablas de peliculas y reparto----

CREATE TABLE peliculas (id INT PRIMARY KEY, pelicula VARCHAR(100), año_estreno INT, director VARCHAR(50));
CREATE TABLE repartos (id INT, actor VARCHAR(40),FOREIGN KEY (id) REFERENCES peliculas(id));

----cargar datos a ambas tablas desde csv-----

\copy peliculas (id,pelicula,año,estreno,director) FROM 'C:\Users\tomas\escritorio\postgres\desafio2\ApoyoDesafio2\peliculas.csv' delimiter ',' CSV header;
--error con cantidad de bits en string, corregir con ALTER TABLE peliculas ALTER COLUMN pelicula TYPE VARCHAR(150);----
\copy repartos (id,actor) FROM 
\copy peliculas (id,pelicula,año,estreno,director) FROM 'C:\Users\tomas\escritorio\postgres\desafio2\ApoyoDesafio2\reparto.csv' delimiter ',' CSV header;
--corregir Alex Angulo linea 575 porque no detecta UTF-8---

--listar todo el reparto de la pelicula Titanic----
SELECT * FROM peliculas as pe JOIN repartos as re ON re.id = pe.id WHERE pe.pelicula = 'Titanic';
-- id | pelicula | año_estreno |   director    | id |       actor
------+----------+-------------+---------------+----+-------------------
--  2 | Titanic  |        1997 | James Cameron |  2 | Leonardo DiCaprio
--  2 | Titanic  |        1997 | James Cameron |  2 | Kate Winslet
--  2 | Titanic  |        1997 | James Cameron |  2 | Billy Zane
--  2 | Titanic  |        1997 | James Cameron |  2 | Kathy Bates
--  2 | Titanic  |        1997 | James Cameron |  2 | Frances Fisher
--  2 | Titanic  |        1997 | James Cameron |  2 | Bernard Hill
--  2 | Titanic  |        1997 | James Cameron |  2 | Jonathan Hyde
--  2 | Titanic  |        1997 | James Cameron |  2 | Danny Nucci
--  2 | Titanic  |        1997 | James Cameron |  2 | David Warner
--  2 | Titanic  |        1997 | James Cameron |  2 | Bill Paxton
--  2 | Titanic  |        1997 | James Cameron |  2 | Gloria Stuart
--  2 | Titanic  |        1997 | James Cameron |  2 | Victor Garber
--  2 | Titanic  |        1997 | James Cameron |  2 | Suzy Amis

---listar titulos de pelicula donde actua Harrison Ford----
SELECT pe.pelicula, re.actor FROM peliculas AS pe JOIN repartos as re ON re.id = pe.id WHERE re.actor = 'Harrison Ford' ;
--                   pelicula                    |     actor
-------------------------------------------------+---------------
-- Star Wars. Episodio IV: Una nueva esperanza   | Harrison Ford
-- Indiana Jones y la ├║ltima cruzada            | Harrison Ford
-- En busca del arca perdida                     | Harrison Ford
-- Star Wars. Episodio V: El imperio contraataca | Harrison Ford
-- Star Wars. Episodio VI: El retorno del Jedi   | Harrison Ford
-- Blade Runner                                  | Harrison Ford
-- Apocalypse Now                                | Harrison Ford
-- Indiana Jones y el templo maldito             | Harrison Ford

---10 directores mas populares---
SELECT pe.director, count(pe.pelicula) AS total FROM peliculas AS pe GROUP BY pe.director ORDER BY total DESC FETCH FIRST 10 ROWS only;
--       director       | total
------------------------+-------
-- Steven Spielberg     |     9
-- Francis Ford Coppola |     4
-- Peter Jackson        |     4
-- Quentin Tarantino    |     3
-- Martin Scorsese      |     3
-- Robert Zemeckis      |     3
-- James Cameron        |     3
-- Ridley Scott         |     3
-- George Lucas         |     3
-- Frank Darabont       |     2

SELECT COUNT(DISTINCT actor) as "total actores" from repartos;
-- total actores
-----------------
--           831

---Peliculas entre 1990 y 1999 ordenadas por titulo---
SELECT * FROM peliculas WHERE (año_estreno >= 1990 AND año_estreno <= 1999) ORDER BY pelicula ASC;