------Crear base de datos posts------
CREATE DATABASE posts; 

------Crear tabla posts------
CREATE TABLE posts(id SERIAL, nombre_usuario VARCHAR(25),fecha_creacion DATE, contenido VARCHAR(200), descripcion VARCHAR(100));

---id | nombre_usuario | fecha_creacion | contenido | descripcion 
------+----------------+----------------+-----------+-------------

------Insertar datos------
INSERT INTO posts(nombre_usuario,fecha_creacion,contenido,descripcion) VALUES('Pamela','2021-03-31','mi foto de onstigem','aqui agregue mi foto'),('Pamela','2021-03-31','mi perfil de onstigem','aqui agregue mi perfil'),('Carlos','2021-03-31','mi foto de fecibuk','aqui agregue mi foto');
--id | nombre_usuario | fecha_creacion |       contenido       |      descripcion       
-----+----------------+----------------+-----------------------+------------------------
-- 1 | Pamela         | 2021-03-31     | mi foto de onstigem   | aqui agregue mi foto
-- 2 | Pamela         | 2021-03-31     | mi perfil de onstigem | aqui agregue mi perfil
-- 3 | Carlos         | 2021-03-31     | mi foto de fecibuk    | aqui agregue mi foto

------Agregar Columna nueva------
ALTER TABLE posts ADD COLUMN titulo VARCHAR(30);

------Agregar titulos a filas------
UPDATE posts SET titulo = 'pamela post1' WHERE id = 1;
UPDATE posts SET titulo = 'pamela post2' WHERE id = 2;
UPDATE posts SET titulo = 'carlos post1' WHERE id = 3;

 --id | nombre_usuario | fecha_creacion |       contenido       |      descripcion       |    titulo    
------+----------------+----------------+-----------------------+------------------------+--------------
  --1 | Pamela         | 2021-03-31     | mi foto de onstigem   | aqui agregue mi foto   | pamela post1
  --2 | Pamela         | 2021-03-31     | mi perfil de onstigem | aqui agregue mi perfil | pamela post2
  --3 | Carlos         | 2021-03-31     | mi foto de fecibuk    | aqui agregue mi foto   | carlos post1

------Insertar 2 posts------
INSERT INTO posts(nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES('Pedro','2021-04-01','mi foto de onstigem','aqui agregue mi foto','post pedro1'),('Pedro','2021-04-01','mi perfil de onstigem','aqui agregue mi perfil','post pedro2');

 --id | nombre_usuario | fecha_creacion |       contenido       |      descripcion       |    titulo    
------+----------------+----------------+-----------------------+------------------------+--------------
  --1 | Pamela         | 2021-03-31     | mi foto de onstigem   | aqui agregue mi foto   | pamela post1
  --2 | Pamela         | 2021-03-31     | mi perfil de onstigem | aqui agregue mi perfil | pamela post2
  --3 | Carlos         | 2021-03-31     | mi foto de fecibuk    | aqui agregue mi foto   | carlos post1
  --4 | Pedro          | 2021-04-01     | mi foto de onstigem   | aqui agregue mi foto   | post pedro1
  --5 | Pedro          | 2021-04-01     | mi perfil de onstigem | aqui agregue mi perfil | post pedro2

------Eliminar post de carlos------
DELETE FROM posts WHERE id = 3;

 --id | nombre_usuario | fecha_creacion |       contenido       |      descripcion       |    titulo    
------+----------------+----------------+-----------------------+------------------------+--------------
  --1 | Pamela         | 2021-03-31     | mi foto de onstigem   | aqui agregue mi foto   | pamela post1
  --2 | Pamela         | 2021-03-31     | mi perfil de onstigem | aqui agregue mi perfil | pamela post2
  --4 | Pedro          | 2021-04-01     | mi foto de onstigem   | aqui agregue mi foto   | post pedro1
  --5 | Pedro          | 2021-04-01     | mi perfil de onstigem | aqui agregue mi perfil | post pedro2

