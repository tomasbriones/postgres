------Crear tabla comentarios------
CREATE TABLE comentarios(id INT, fecha DATE, hora TIME, contenido VARCHAR(100));

------PRIMAY Y FOREIGN KEY-----
ALTER TABLE posts ADD PRIMAY KEY (id);
ALTER TABLE comentarios ADD FOREIGN KEY (id) REFERENCES posts (id);