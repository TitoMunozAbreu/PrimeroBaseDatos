CREATE DATABASE IF NOT EXISTS RESTAURANTE;
USE RESTAURANTE;

CREATE TABLE IF NOT EXISTS CATEGORIA(
nombre_categoria VARCHAR (30) NOT NULL,
descripccion VARCHAR (30),
encargado VARCHAR (20),
PRIMARY KEY (nombre_categoria)
);

CREATE TABLE IF NOT EXISTS PLATO (
nombre_plato VARCHAR(15) NOT NULL,
descripcion VARCHAR (30),
nivel TINYINT (1),
foto BLOB,
precio DECIMAL(3,2),
nombre_categoria VARCHAR (30),
PRIMARY KEY (nombre_plato),
FOREIGN KEY (nombre_categoria) REFERENCES CATEGORIA (nombre_categoria)
);

CREATE TABLE IF NOT EXISTS INGREDIENTE (
nombre_ing VARCHAR (30) NOT NULL,
unidades TINYINT (2),
almacen VARCHAR (1),
PRIMARY KEY (nombre_ing)
);

CREATE TABLE IF NOT EXISTS UTILIZA (
nombre_ing VARCHAR (30) NOT NULL,
nombre_plato VARCHAR(15),
cantidad TINYINT (2),
PRIMARY KEY (nombre_ing, nombre_plato),
FOREIGN KEY (nombre_ing) REFERENCES INGREDIENTE (nombre_ing),
FOREIGN KEY (nombre_plato) REFERENCES PLATO (nombre_plato)
);