<-- Tarea de creacion de una base de datos -->
CREATE DATABASE IF NOT EXISTS tarea;

USE tarea;

CREATE TABLE IF NOT EXISTS empleado(
ID TINYINT (3) UNSIGNED NOT NULL ,
DNI VARCHAR (9) NOT NULL UNIQUE,
nombre VARCHAR (10) NOT NULL,
telefono INT (10),
salario INT UNSIGNED,
codigo_localidad TINYINT (3) UNSIGNED NOT NULL,
CONSTRAINT PK_EMPLEADO PRIMARY KEY (ID),
CONSTRAINT Fk_EMPLEADO FOREIGN KEY (codigo_localidad) 
	REFERENCES localidad (codigo_localidad)
);

CREATE TABLE IF NOT EXISTS region(
codigo_region TINYINT (3) UNSIGNED NOT NULL,
nombre_region VARCHAR (10),
CONSTRAINT PK_REGION PRIMARY KEY (codigo_region)
);

CREATE TABLE IF NOT EXISTS provincia(
codigo_provincia TINYINT (3) UNSIGNED NOT NULL,
nombre_provincia VARCHAR (10) NOT NULL,
codigo_region TINYINT (3) UNSIGNED NOT NULL,
CONSTRAINT PK_PROVINCIA PRIMARY KEY (codigo_provincia),
CONSTRAINT FK_PROVINCIA FOREIGN KEY (codigo_region) 
	REFERENCES region (codigo_region)
);

CREATE TABLE IF NOT EXISTS localidad(
codigo_localidad TINYINT (3) UNSIGNED NOT NULL,
nombre_loc VARCHAR (10) NOT NULL,
codigo_provincia TINYINT (3) UNSIGNED NOT NULL,
CONSTRAINT PK_LOCALIDAD PRIMARY KEY (codigo_localidad),
CONSTRAINT Fk_LOCALIDAD FOREIGN KEY (codigo_provincia)
		REFERENCES provincia (codigo_provincia)
);