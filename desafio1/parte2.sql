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
