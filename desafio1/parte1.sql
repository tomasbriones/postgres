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
