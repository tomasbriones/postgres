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
-- id |                  pelicula                  | año_estreno |       director
------+--------------------------------------------+-------------+-----------------------
-- 76 | American Beauty                            |        1999 | Sam Mendes
-- 20 | American History X                         |        1998 | Tony Kaye
--  9 | Braveheart                                 |        1995 | Mel Gibson
--  7 | Cadena perpetua                            |        1994 | Frank Darabont
-- 12 | Eduardo Manostijeras                       |        1990 | Tim Burton
-- 27 | El club de la pelea                        |        1999 | David Fincher
-- 68 | El Padrino. Parte III                      |        1990 | Francis Ford Coppola

---reparto peliculas estrenadas el 2001---
SELECT re.actor AS actores, pe.pelicula AS pelicula, pe.año_estreno AS estreno FROM repartos AS re JOIN peliculas AS pe ON re.id = pe.id WHERE pe.año_estreno = 2001;
-- actores      |                     pelicula                      | estreno
---------------------+---------------------------------------------------+---------
-- Elijah Wood       | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Ian McKellen      | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Viggo Mortensen   | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Sean Astin        | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Sean Bean         | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Cate Blanchett    | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Hugo Weaving      | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Liv Tyler         | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Ian Holm          | El Se├▒or de los anillos: La comunidad del anillo |    2001
-- Christopher Lee   | El Se├▒or de los anillos: La comunidad del anillo |    2001

---Actores de la pelicula mas nueva---
SELECT re.actor,pe.pelicula AS pelicula, pe.año_estreno AS estreno FROM repartos AS re JOIN peliculas AS pe ON re.id = pe.id WHERE pe.año_estreno = (SELECT max(año_estreno) FROM peliculas) ;
--        actor         |      pelicula       | estreno
------------------------+---------------------+---------
-- Christian Bale       | El caballero oscuro |    2008
-- Heath Ledger         | El caballero oscuro |    2008
-- Aaron Eckhart        | El caballero oscuro |    2008
-- Michael Caine        | El caballero oscuro |    2008
-- Gary Oldman          | El caballero oscuro |    2008
-- Maggie Gyllenhaal    | El caballero oscuro |    2008
-- Morgan Freeman       | El caballero oscuro |    2008
-- Eric Roberts         | El caballero oscuro |    2008
-- Cillian Murphy       | El caballero oscuro |    2008
-- Anthony Michael Hall | El caballero oscuro |    2008
-- Michael Jai White    | El caballero oscuro |    2008
-- William Fichtner     | El caballero oscuro |    2008
-- Edison Chen          | El caballero oscuro |    2008
-- Monique Curnen       | El caballero oscuro |    2008
-- Chin Han             | El caballero oscuro |    2008
-- Nestor Carbonell     | El caballero oscuro |    2008
-- Ritchie Coster       | El caballero oscuro |    2008
-- Keith Szarabajka     | El caballero oscuro |    2008
-- Colin McFarlane      | El caballero oscuro |    2008
-- Melinda McGraw       | El caballero oscuro |    2008
-- Nathan Gamble        | El caballero oscuro |    2008
-- Michael Vieau        | El caballero oscuro |    2008
-- Animada              | Wall-E              |    2008
-- Robert Downey Jr.    | Iron Man            |    2008
-- Terrence Howard      | Iron Man            |    2008
-- Gwyneth Paltrow      | Iron Man            |    2008
-- Jeff Bridges         | Iron Man            |    2008
-- Stan Lee             | Iron Man            |    2008
-- Leslie Bibb          | Iron Man            |    2008