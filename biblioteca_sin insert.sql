
CREATE TABLE ficha_usuario (
  codigo_usuario INTEGER AUTO_INCREMENT NOT NULL,
  nombre_usuario VARCHAR(20) NOT NULL,
  direccion_usuario VARCHAR(20) NOT NULL,
  telefono_usuario INTEGER NOT NULL,
  PRIMARY KEY (codigo_usuario)
);



CREATE TABLE usuarios (
  codigo_usuario INTEGER NOT NULL,
  PRIMARY KEY (codigo_usuario)
);

ALTER TABLE `usuarios` ADD FOREIGN KEY (codigo_usuario) REFERENCES `ficha_usuario` (`codigo_usuario`);

CREATE TABLE Biblioteca (
  nit INTEGER AUTO_INCREMENT NOT NULL,
  codigo_usuario INTEGER NOT NULL,
  PRIMARY KEY (nit)
);

ALTER TABLE Biblioteca ADD FOREIGN KEY (codigo_usuario) REFERENCES usuarios (codigo_usuario);

CREATE TABLE libros (
  codigo_libro INTEGER AUTO_INCREMENT NOT NULL,
  titulo_libro VARCHAR(20) NOT NULL,
  ISBN INTEGER NOT NULL,
  editorial VARCHAR(10) NOT NULL,
  numero_paginas INTEGER NOT NULL,
  nit_biblioteca INTEGER NOT NULL,
  PRIMARY KEY (codigo_libro)
);

ALTER TABLE `libros` ADD FOREIGN KEY (nit_biblioteca) REFERENCES `Biblioteca` (`nit`);


CREATE TABLE ficha_autores (
  codigo_autor INTEGER AUTO_INCREMENT NOT NULL,
  nombre_autor INTEGER NOT NULL,
  nit_biblioteca INTEGER NOT NULL,
  PRIMARY KEY (codigo_autor)
);

ALTER TABLE `ficha_autores` ADD FOREIGN KEY (nit_biblioteca) REFERENCES `Biblioteca` (`nit`);


CREATE TABLE ejemplares (
  codigo_ejemplar INTEGER AUTO_INCREMENT NOT NULL,
  localizacion INTEGER NOT NULL,
  PRIMARY KEY (codigo_ejemplar)
);

CREATE TABLE libro_ejemplar (
  codigo_ejemplar INTEGER NOT NULL,
  codigo_libro INTEGER NOT NULL,
  PRIMARY KEY (codigo_ejemplar)
);

ALTER TABLE `libro_ejemplar` ADD FOREIGN KEY (codigo_ejemplar) REFERENCES `ejemplares` (`codigo_ejemplar`);
ALTER TABLE `libro_ejemplar` ADD FOREIGN KEY (codigo_libro) REFERENCES `libros` (`codigo_libro`);

CREATE TABLE autor_libro (
  codigo_autor INTEGER NOT NULL,
  codigo_libro INTEGER NOT NULL,
  PRIMARY KEY (codigo_autor)
);

ALTER TABLE `autor_libro` ADD FOREIGN KEY (codigo_autor) REFERENCES `ficha_autores` (`codigo_autor`);
ALTER TABLE `autor_libro` ADD FOREIGN KEY (codigo_libro) REFERENCES `libros` (`codigo_libro`);

CREATE TABLE prestamo (
  codigo_libro INTEGER NOT NULL,
  fecha_devolucion DATETIME NOT NULL,
  fecha_prestamo DATETIME NOT NULL,
  titulo_libro VARCHAR(20) NOT NULL,
  codigo_usuario INTEGER NOT NULL,
  PRIMARY KEY (codigo_libro)
);

ALTER TABLE `prestamo` ADD FOREIGN KEY (codigo_libro) REFERENCES `ejemplares` (`codigo_ejemplar`);
ALTER TABLE `prestamo` ADD FOREIGN KEY (codigo_usuario) REFERENCES `usuarios` (`codigo_usuario`);
ALTER TABLE `prestamo` ADD FOREIGN KEY (titulo_libro) REFERENCES `libros` (`titulo_libro`);

