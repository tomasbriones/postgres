------Crear tabla comentarios------
CREATE TABLE comentarios(id INT, fecha DATE, hora TIME, contenido VARCHAR(100));

------PRIMAY Y FOREIGN KEY-----
ALTER TABLE posts ADD PRIMAY KEY (id);
ALTER TABLE comentarios ADD FOREIGN KEY (id) REFERENCES posts (id);

 --id | fecha | hora | contenido 
------+-------+------+-----------

------Insertar comentarios a pamela y carlos------
INSERT INTO comentarios (id,fecha,hora,contenido) VALUES ('1','2021-03-30','12:01:00','Aqui escrio algo'),('1','2021-03-30','12:01:00','Aqui escrio algo'),('6','2021-03-30','19:01:00','Aqui escrio algo'),('6','2021-03-30','16:01:00','Aqui escrio algo'),('6','2021-05-30','16:01:00','Aqui escrio algo'),('6','2021-04-30','16:01:00','Aqui escrio algo');

 --id |   fecha    |   hora   |    contenido     
------+------------+----------+------------------
  --1 | 2021-03-30 | 12:01:00 | Aqui escrio algo
  --1 | 2021-03-30 | 12:01:00 | Aqui escrio algo
  --6 | 2021-03-30 | 19:01:00 | Aqui escrio algo
  --6 | 2021-03-30 | 16:01:00 | Aqui escrio algo
  --6 | 2021-05-30 | 16:01:00 | Aqui escrio algo
  --6 | 2021-04-30 | 16:01:00 | Aqui escrio algo

------Crear nuevo post para margarita------
INSERT INTO posts(nombre_usuario,fecha_creacion,contenido,descripcion,titulo) VALUES('Margarita','2021-04-05','mi foto de piterste','aqui agregue foto perfil','post margarita1');

 --id | nombre_usuario | fecha_creacion |       contenido       |       descripcion        |     titulo      
------+----------------+----------------+-----------------------+--------------------------+-----------------
  --1 | Pamela         | 2021-03-31     | mi foto de onstigem   | aqui agregue mi foto     | pamela post1
  --2 | Pamela         | 2021-03-31     | mi perfil de onstigem | aqui agregue mi perfil   | pamela post2
  --4 | Pedro          | 2021-04-01     | mi foto de onstigem   | aqui agregue mi foto     | post pedro1
  --5 | Pedro          | 2021-04-01     | mi perfil de onstigem | aqui agregue mi perfil   | post pedro2
  --6 | Carlos         | 2021-04-01     | mi foto de onstigem   | aqui agregue mi foto     | nuevo post
  --7 | Margarita      | 2021-04-05     | mi foto de piterste   | aqui agregue foto perfil | post margarita1

------comentarios a post margarita-------
INSERT INTO comentarios (id,fecha,hora,contenido) VALUES ('7','2021-03-30','21:01:00','Aqui escrio algo'),('7','2021-05-30','13:01:00','Aqui escrio algo mas'),('7','2021-03-30','21:40:00','comentario extra'),('7','2021-03-22','21:01:00','Aqui escrio algo parecido'),('7','2021-03-30','21:10:00','Aqui escrio algo repetido');

 --id |   fecha    |   hora   |         contenido         
------+------------+----------+---------------------------
  --1 | 2021-03-30 | 12:01:00 | Aqui escrio algo
  --1 | 2021-03-30 | 12:01:00 | Aqui escrio algo
  --6 | 2021-03-30 | 19:01:00 | Aqui escrio algo
  --6 | 2021-03-30 | 16:01:00 | Aqui escrio algo
  --6 | 2021-05-30 | 16:01:00 | Aqui escrio algo
  --6 | 2021-04-30 | 16:01:00 | Aqui escrio algo
  --7 | 2021-03-30 | 21:01:00 | Aqui escrio algo
  --7 | 2021-05-30 | 13:01:00 | Aqui escrio algo mas
  --7 | 2021-03-30 | 21:40:00 | comentario extra
  --7 | 2021-03-22 | 21:01:00 | Aqui escrio algo parecido
  --7 | 2021-03-30 | 21:10:00 | Aqui escrio algo repetido
