<-- https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#tienda-de-inform%C3%A1tica -- >
<-- SEQUEL DATABASE TIENDA -->

<!-- CONSULTAS SOBRE UNA TABLA -->

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.

SELECT p.nombre 
FROM producto p;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT p.nombre, p.precio
FROM producto p;

-- 3. Lista todas las columnas de la tabla producto.

SELECT * FROM PRODUCTO;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT p.nombre, p.precio as "precio_EUR", cast(p.precio * 1.07 as decimal(5,2)) as "precio_USD"
FROM producto p;

--5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
--   Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT p.nombre as "nombre de producto", 
	p.precio as "precio euros", 
	cast(p.precio * 1.07 as decimal(5,2)) as "precio dolares"
FROM producto p;

--6.Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT  UPPER(p.nombre) as"nombre de producto",
	UPPER(p.precio) as "precio EUR"
FROM producto p;

--7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT  LOWER(p.nombre) as"nombre de producto",
	LOWER(p.precio) as "precio EUR"
FROM producto p;

--8. Lista el nombre de todos los fabricantes en una columna, 
--  y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT f.nombre as "Nombre Fabricante",
	SUBSTRING(UPPER(f.nombre),1,2) as "Abreviacion"
FROM fabricante f;

--9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT p.nombre as "Nombre del Producto",
	ROUND(p.precio) as "precio EUR"
FROM producto p;

--10. Lista los nombres y los precios de todos los productos de la tabla producto, 
-- truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

--11. Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT p.id_fabricante as "Indetidicador del fabricante"
FROM producto p;

--12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, 
	eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT(p.id_fabricante) as "Identificador del fabricante"
FROM producto p;

--13.Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT f.nombre as "Nombre fabricante"
FROM fabricante f
ORDER BY nombre;

--14. Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT f.nombre as "Nombre fabricante"
FROM fabricante f
ORDER BY nombre desc;

--15. Lista los nombres de los productos ordenados en 
	primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT p.nombre as "Nombre del producto", 
	P.precio as "Precio EUR"
FROM producto p
ORDER BY p.nombre;


SELECT p.nombre as "Nombre del producto", 
	P.precio as "Precio EUR"
FROM producto p
ORDER BY p.precio;

--16. Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT * 
FROM fabricante
LIMIT 5;

--17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
La cuarta fila también se debe incluir en la respuesta.

SELECT * 
FROM fabricante
LIMIT 3,2;

--18.Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT p.nombre as "Nombre producto",
	p.precio as "Precio EUR"
FROM producto p
ORDER BY p.precio
LIMIT 1;

-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT p.nombre as "Nombre producto",
	p.precio as "Precio EUR"
FROM producto p
ORDER BY p.precio DESC
LIMIT 1;

-- 20.Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

SELECT p.nombre as "nombre del producto",
	p.id_fabricante as "id fabricante"
FROM producto p
WHERE p.id_fabricante = 2;
 
-- 21.Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio <= 120;

-- 22.Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio >= 400;

23.Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio < 400;

24.Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio >= 80 AND p.precio <= 300;

25.Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio BETWEEN 60 AND 200;

26.Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.

SELECT p.nombre as "Nombre del producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio > 200
AND p.id_fabricante = 6;

27.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

SELECT p.nombre as "Nombre del producto",
	p.id_fabricante as "ID Fabricante"
FROM producto p
WHERE p.id_fabricante = 1 
OR p.id_fabricante = 3 
OR p.id_fabricante = 5;

28.Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

SELECT p.nombre as "Nombre del producto",
	p.id_fabricante as "ID Fabricante"
FROM producto p
WHERE p.id_fabricante IN (1,3,5);

29.Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
-- Cree un alias para la columna que contiene el precio que se llame céntimos.

SELECT p.nombre as "Nombre del Producto",
	p.precio*100 as "Centimos"
FROM producto p;

30.Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

SELECT f.nombre 
FROM fabricante f
WHERE f.nombre like "S%";

31.Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

SELECT f.nombre 
FROM fabricante f
WHERE f.nombre like "%e";

32.Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

SELECT f.nombre 
FROM fabricante f
WHERE f.nombre like "%w%";

33.Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

SELECT f.nombre 
FROM fabricante f
WHERE LENGTH(f.nombre) = 4;

34.Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

SELECT p.nombre as "Nombre del Producto"
FROM producto p
WHERE p.nombre LIKE "%portatil%";

35.Devuelve una lista con el nombre de todos los productos que contienen 
-- la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

SELECT p.nombre as "Nombre del Producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.nombre LIKE "%monitor%"
AND p.precio < 215;

36.Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el 
-- resultado en primer lugar por el precio (en orden descendente) y en segundo lugar 
-- por el nombre (en orden ascendente).

SELECT p.nombre as "Nombre del Producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio >= 180
ORDER BY p.precio DESC;

SELECT p.nombre as "Nombre del Producto",
	p.precio as "Precio EUR"
FROM producto p
WHERE p.precio >= 180
ORDER BY p.nombre;

<!-- COMSULTAS MULTITABLAS (COMPOSICION INTERNA) -->

-- 1.Devuelve una lista con el nombre del producto, precio 
-- y nombre de fabricante de todos los productos de la base de datos.

SELECT p.nombre as "Nombre Producto",
p.precio as "Precio EUR",
f.nombre as "Nombre Fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante;

-- 2.Devuelve una lista con el nombre del producto, precio 
-- y nombre de fabricante de todos los productos de la base de datos.
-- Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT p.nombre as "Nombre Producto",
p.precio as "Precio EUR",
f.nombre as "Nombre Fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
ORDER BY f.nombre ASC;

-- 3.Devuelve una lista con el identificador del producto, 
-- nombre del producto, identificador del fabricante y nombre del
-- fabricante, de todos los productos de la base de datos.

SELECT p.id as "ID_producto",
p.nombre as "Nombre_producto",
f.id as "ID_Fabricante",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante;

-- 4.Devuelve el nombre del producto, su precio 
-- y el nombre de su fabricante, del producto más barato.

SELECT p.nombre as "Nombre_producto",
p.precio as "Precio_Producto",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
ORDER BY p.precio ASC
LIMIT 1;

-- 5.Devuelve el nombre del producto, 
-- su precio y el nombre de su fabricante, del producto más caro.

SELECT p.nombre as "Nombre_producto",
p.precio as "Precio_Producto",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
ORDER BY p.precio DESC
LIMIT 1;

-- 6.Devuelve una lista de todos los productos del fabricante Lenovo.

SELECT * FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Lenovo";

-- 7.Devuelve una lista de todos los productos del 
-- fabricante Crucial que tengan un precio mayor que 200€.

SELECT * FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Crucial"
AND p.precio > 200;

-- 8.Devuelve un listado con todos los productos de los fabricantes
-- Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

SELECT * FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus"
OR f.nombre = "Hewlett-Packard"
OR f.nombre = "Seagate";

-- 9.Devuelve un listado con todos los productos de los fabricantes
-- Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

SELECT * FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre IN ("Asus","Hewlett-Packard","Seagate");

-- 10.Devuelve un listado con el nombre y el precio de todos los 
-- productos de los fabricantes cuyo nombre termine por la vocal e.

SELECT p.nombre as "Nombre_producto",
p.precio as "Precio_Producto",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre LIKE "%E";

-- 11.Devuelve un listado con el nombre y el precio de todos los 
-- productos cuyo nombre de fabricante contenga el carácter w en su nombre.

SELECT p.nombre as "Nombre_producto",
p.precio as "Precio_Producto",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre LIKE "%W%";

-- 12.Devuelve un listado con el nombre de producto, precio y nombre de
-- fabricante, de todos los productos que tengan un precio mayor o igual
-- a 180€.Ordene el resultado en primer lugar por el precio 
(en orden descendente) y en segundo lugar por el nombre 
(en orden ascendente).

SELECT p.nombre as "Nombre_producto",
p.precio as "Precio_Producto",
f.nombre as "Nombre_fabricante"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE p.precio >= 180
ORDER BY p.precio DESC,
p.nombre ASC;

-- 13.Devuelve un listado con el identificador y el nombre de fabricante, 
-- solamente de aquellos fabricantes que tienen productos 
-- asociados en la base de datos.

SELECT f.id as "ID_fabricante",
f.nombre as "Nombre_fabricante"
FROM fabricante f
INNER JOIN producto p ON
p.id_fabricante = f.id;



<!-- CONSULTAS MULTITABLA (COMPOSICION EXTERNA) -->
--Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

-- 1.Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.

SELECT * 
FROM fabricante f
LEFT JOIN producto p ON
p.id_fabricante = f.id;

-- 2.Devuelve un listado donde sólo aparezcan aquellos fabricantes que 
-- no tienen ningún producto asociado.

SELECT * 
FROM fabricante f
LEFT JOIN producto p ON
p.id_fabricante = f.id
WHERE p.id_fabricante IS NULL;

-- 3.¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
/*No puede existir ya que la relacion en el modelo relacional es de 1 a muchos. Esto significa que 
un producto puede ser creado por un minimo de 1 fabricante*/

<!-- CONSULTA RESUMEN -->

-- 1.Calcula el número total de productos que hay en la tabla productos.

SELECT COUNT(p.id) as "Total Productos"
FROM producto p;

-- 2.Calcula el número total de fabricantes que hay en la tabla fabricante.

SELECT COUNT(f.id) as "Total Fabricante"
FROM fabricante f;

-- 3.Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.

SELECT  COUNT(DISTINCT p.id_fabricante) as "Total ID_Fabricante"
FROM producto p;

-- 4.Calcula la media del precio de todos los productos.

SELECT AVG(CAST(p.precio as decimal (16,2))) as "Media de Precio"
FROM producto p;

-- 5.Calcula el precio más barato de todos los productos.

SELECT p.precio as "Precio mas Barato"
FROM producto p
ORDER BY p.precio ASC
LIMIT 1;


SELECT MIN(p.precio) as "Precio mas Barato"
FROM producto p;

-- 6.Calcula el precio más caro de todos los productos.

SELECT MAX(p.precio) as "Precio mas Barato"
FROM producto p;

-- 7.Lista el nombre y el precio del producto más barato.

SELECT p.nombre,
MIN(p.precio) as "Precio mas Barato"
FROM producto p;

-- 8.Lista el nombre y el precio del producto más caro.

SELECT p.nombre,
MAX(p.precio) as "Precio mas Barato"
FROM producto p;

-- 9.Calcula la suma de los precios de todos los productos.

SELECT SUM(p.precio) as "Suma de Precios"
FROM producto p; 

-- 10.Calcula el número de productos que tiene el fabricante Asus.

SELECT COUNT(*) as "Cant Productos ASUS"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus";

-- 11.Calcula la media del precio de todos los productos del fabricante Asus.

SELECT AVG(p.precio) as "Precio AVG Asus"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus";

-- 12.Calcula el precio más barato de todos los productos del fabricante Asus.

SELECT MIN(p.precio) as "Precio min Asus"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus";

-- 13.Calcula el precio más caro de todos los productos del fabricante Asus.

SELECT MAX(p.precio) as "Precio MAX Asus"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus";

-- 14.Calcula la suma de todos los productos del fabricante Asus.

SELECT SUM(p.precio) as "Suma Precios Asus"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Asus";

-- 15.Muestra el precio máximo, precio mínimo, precio medio 
-- y el número total de productos que tiene el fabricante Crucial.

SELECT COUNT(*) as "Cant Crucial",
MAX(p.precio) as "Precio max",
MIN(p.precio) as "Precio min",
AVG(CAST(p.precio as decimal(5,2))) as "Precio medio"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
WHERE f.nombre = "Crucial";

-- 16.Muestra el número total de productos que tiene cada uno de los fabricantes.
-- El listado también debe incluir los fabricantes que no tienen ningún producto.
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
-- Ordene el resultado descendentemente por el número de productos.

SELECT f.nombre as "Nombre Fabricante",
COUNT(p.id_fabricante) as "Numero de productos"
FROM fabricante f
LEFT JOIN producto p
ORDER BY 2  DESC;

-- 17.Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno
-- de los fabricantes. El resultado mostrará el nombre del fabricante 
-- junto con los datos que se solicitan.

SELECT MAX(p.precio) as "Precio MAX",
MIN(p.precio) as "Precio MIN",
AVG(CAST(p.precio as decimal(5,2))) as "Precio AVG",
f.nombre as "Nombre Fabricante"
FROM producto p
INNER JOIN fabricante f ON 
f.id = p.id_fabricante
GROUP BY f.nombre;

-- 18.Muestra el precio máximo, precio mínimo, precio medio y el número total 
-- de productos de los fabricantes que tienen un precio medio superior a 200€.
-- No es necesario mostrar el nombre del fabricante, con el identificador del 
-- fabricante es suficiente.

SELECT MAX(p.precio) as "Precio_MAX",
MIN(p.precio) as "Precio_MIN",
AVG(CAST(p.precio as decimal(5,2))) as "Precio_AVG",
COUNT(*) as "Numero_Total",
p.id_fabricante as "ID Fabricante"
FROM producto p
GROUP BY p.id_fabricante
HAVING Precio_AVG > 200;

-- 19.Muestra el nombre de cada fabricante, junto con el precio máximo,
-- precio mínimo, precio medio y el número total de productos de los fabricantes
-- que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.

SELECT f.nombre as "Nombre_Fabricante",
MAX(p.precio) as "Precio_MAX",
MIN(p.precio) as "Precio MIN",
AVG(CAST(p.precio as DECIMAL(5,2))) as "Precio_AVG",
COUNT(*) as "Total Productos"
FROM producto p
INNER JOIN fabricante f ON
f.id = p.id_fabricante
GROUP BY f.id
HAVING Precio_AVG > 200
ORDER BY f.nombre ASC;

- 20.Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(p.id) as "#Producto"
FROM producto p
WHERE p.precio >= 180;

-- 21.Calcula el número de productos que tiene cada fabricante 
-- con un precio mayor o igual a 180€.

SELECT f.nombre as "Fabricante_nombre",
COUNT(*) as "#Productos"
FROM producto p
INNER JOIN fabricante f
ON f.id = p.id_fabricante
WHERE p.precio >= 180
GROUP BY f.id
ORDER BY f.nombre;

-- 22.Lista el precio medio los productos de cada fabricante, 
-- mostrando solamente el identificador del fabricante.

SELECT p.id_fabricante as "ID_Fabricante",
AVG(CAST(p.precio as decimal(5,2))) as "Precio_AVG"
FROM producto p
GROUP BY ID_Fabricante;

-- 23.Lista el precio medio los productos de cada fabricante, 
-- mostrando solamente el nombre del fabricante.

SELECT f.nombre as "Nombre_Fabricante",
AVG(CAST(p.precio as decimal(5,2))) as "Precio_AVG"
FROM producto p
INNER JOIN fabricante f 
ON f.id = p.id_fabricante
GROUP BY Nombre_Fabricante;

-- 24.Lista los nombres de los fabricantes cuyos productos 
-- tienen un precio medio mayor o igual a 150€.

SELECT f.nombre as "Nombre_Fabricante",
AVG(CAST(p.precio as decimal(5,2))) as "Precio_AVG"
FROM fabricante f
INNER JOIN producto p
ON f.id = p.id_fabricante
GROUP BY Nombre_Fabricante
HAVING Precio_AVG >=150;

-- 25.Devuelve un listado con los nombres de los fabricantes 
-- que tienen 2 o más productos.

SELECT f.nombre as "Nombre Fabricante",
COUNT(p.id_fabricante) as "Cant_productos"
from fabricante f
INNER JOIN producto p
ON p.id_fabricante = f.id
GROUP BY f.id
HAVING Cant_productos >= 2
ORDER BY f.nombre; 

-- 26.Devuelve un listado con los nombres de los fabricantes y 
-- el número de productos que tiene cada uno con un precio superior 
-- o igual a 220 €. No es necesario mostrar el nombre de los fabricantes 
-- que no tienen productos que cumplan la condición.

SELECT f.nombre as "Nombre Fabricante",
COUNT(p.id_fabricante) as "Cant_productos"
FROM fabricante f
INNER JOIN producto p
ON p.id_fabricante = f.id
WHERE p.precio >= 220
GROUP BY f.id
ORDER BY f.nombre; 

-- 27.Devuelve un listado con los nombres de los fabricantes y el número
-- de productos que tiene cada uno con un precio superior o igual a 220€..
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si
-- hay algún fabricante que no tiene productos con un precio superior 
-- o igual a 220€ deberá aparecer en el listado con un valor igual 
-- a 0 en el número de productos.

SELECT f.nombre as "Nombre_Frabicante",
COUNT(p.id_fabricante) as "Numero_productos"
FROM fabricante f
INNER JOIN producto p
ON p.id_fabricante = f.id
WHERE p.precio >= 220
GROUP BY f.id


UNION

SELECT f.nombre as "Nombre_Frabicante",
0
FROM fabricante f 
WHERE f.id NOT IN 
(SELECT f.id 
FROM fabricante f 
LEFT JOIN producto p
ON f.id = p.id_fabricante
WHERE p.precio >=220
GROUP BY f.id)
ORDER BY 2 DESC;


SELECT f.nombre as "Nombre_fabricante",
COUNT(CASE WHEN p.precio >=220 
	THEN f.nombre 
	ELSE NULL END)
as "Numero_productos"
FROM fabricante f
LEFT JOIN producto p
ON p.id_fabricante = f.id
GROUP BY f.nombre
ORDER BY 2 DESC;


-- 28.Devuelve un listado con los nombres de los fabricantes donde la suma 
-- del precio de todos sus productos es superior a 1000 €.

SELECT f.nombre as "Nombre_fabricante",
SUM(p.precio) as "Suma_precios"
FROM fabricante f
INNER JOIN producto p
ON p.id_fabricante = f.id
GROUP BY p.id_fabricante
HAVING Suma_precios > 1000;


-- 29.Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. 
-- El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre 
-- del fabricante.

SELECT p.nombre as "Nombre del producto",
p.precio as "Precio",
f.nombre as "Nombre fabricante"
FROM producto p
INNER JOIN fabricante f
ON p.id_fabricante = f.id

<!-- SUBCONSULTAS (WHERE CLAUSE) Con operadores básicos de comparación -->

-- 1.Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT p.id as "ID_producto",
p.nombre as "Nombre_producto",
p.precio as "Precio_producto"
FROM producto p
WHERE p.id_fabricante = (SELECT f.id FROM fabricante f WHERE f.nombre = "Lenovo");
 

SELECT p.nombre,
p.precio
FROM producto p 
WHERE p.precio >= (SELECT AVG(p.precio) 
			FROM producto p)
ORDER BY 2 DESC
LIMIT 1;

-- 2.Devuelve todos los datos de los productos que tienen el mismo precio 
-- que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

SELECT *
FROM producto p
WHERE p.precio = (SELECT MAX(p.precio)
			FROM producto p
			WHERE p.id_fabricante = (SELECT f.id
							FROM fabricante f
							WHERE f.nombre = "Lenovo"));

-- 3.Lista el nombre del producto más caro del fabricante Lenovo.

SELECT *
FROM producto p
WHERE p.id_fabricante = (SELECT f.id 
				FROM fabricante f 
				WHERE f.nombre = "Lenovo")
ORDER BY p.precio DESC
LIMIT 1;


-- 4.Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT *
FROM producto p 
WHERE p.precio = (SELECT MIN(p.precio)
			FROM producto p
			WHERE p.id_fabricante = (SELECT f.id
							FROM fabricante f
							WHERE f.nombre = "Hewlett-Packard"));

-- 5.Devuelve todos los productos de la base de datos que tienen un 
-- precio mayor o igual al producto más caro del fabricante Lenovo.

SELECT *
FROM producto p
WHERE p.precio >= (SELECT MAX(p.precio)
			FROM producto p, fabricante f
			WHERE p.id_fabricante NOT IN (SELECT f.id
							FROM fabricante f 
							WHERE f.nombre = "Lenovo"));

-- 6.Lista todos los productos del fabricante Asus que 
-- tienen un precio superior al precio medio de todos sus productos.

SELECT *
FROM producto p
WHERE p.precio > (SELECT AVG(p.precio)
			FROM producto p
			WHERE p.id_fabricante IN (SELECT f.id
							FROM fabricante f 
							WHERE f.nombre = "Asus"))
AND p.id_fabricante = (SELECT f.id
			FROM fabricante f
			WHERE f.nombre = "Asus");

<!-- SUBCONSULTAS (WHERE CLAUSE)  con ALL y ANY-->

-- 8.Devuelve el producto más caro que existe en la tabla producto 
-- sin hacer uso de MAX, ORDER BY ni LIMIT.

SELECT *
FROM producto p
WHERE p.precio >= ALL (SELECT p.precio
			FROM producto p);

-- 9.Devuelve el producto más barato que existe en la tabla producto 
-- sin hacer uso de MIN, ORDER BY ni LIMIT.

SELECT * 
FROM producto p
WHERE p.precio <= ALL(SELECT p.precio
			FROM producto p);

-- 10.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

SELECT f.nombre
FROM fabricante f
WHERE f.id = ANY (SELECT p.id_fabricante
		FROM producto p);

-- 11.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY)


SELECT f.nombre
FROM fabricante f
WHERE f.id != ALL (SELECT p.id_fabricante
		FROM producto p);


<!-- SUBCONSULTAS (WHERE CLAUSE)  con IN y NOT IN-->

-- 12.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).

SELECT f.nombre 
FROM fabricante f
WHERE f.id IN (SELECT p.id_fabricante
		FROM producto p);

-- 13.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).

SELECT f.nombre 
FROM fabricante f
WHERE f.id NOT IN (SELECT p.id_fabricante
		FROM producto p);

<!-- SUBCONSULTAS (WHERE CLAUSE)  con EXISTS y NOT EXISTS-->

-- 14.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT f.nombre
FROM fabricante f
WHERE EXISTS (SELECT p.id_fabricante
		FROM producto p
		WHERE f.id = p.id_fabricante);

-- 15.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).

SELECT f.nombre
FROM fabricante f
WHERE NOT EXISTS (SELECT p.id_fabricante
		FROM producto p
		WHERE f.id = p.id_fabricante);


<!-- SUBCONSULTAS CORRELACIONADAS -->

-- 16.Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.

SELECT f.nombre  as "nombre fabricante",
p.precio as "Precio mas caro"
FROM fabricante f
INNER JOIN producto p
ON p.id_fabricante = f.id
WHERE p.precio = (SELECT MAX(p.precio)
			FROM producto p
			WHERE p.id_fabricante = f.id)
GROUP BY f.nombre;


-- 17.Devuelve un listado de todos los productos que tienen un precio mayor
-- o igual a la media de todos los productos de su mismo fabricante.

SELECT *
FROM producto p
INNER JOIN fabricante f
ON p.id_fabricante = f.id
WHERE p.precio >= (SELECT AVG(p.precio)
			FROM producto p
			WHERE p.id_fabricante = f.id);

-- 18.Lista el nombre del producto más caro del fabricante Lenovo.

SELECT p.nombre as "Nombre Producto"
FROM producto p 
wHERE p.precio = (SELECT MAX(p.precio)
			FROM producto p
			WHERE p.id_fabricante = (SELECT f.id
							FROM fabricante f
							WHERE f.nombre = "Lenovo"));

<!-- SUBCONSULTAS (En la cláusula HAVING) -->

-- 7.Devuelve un listado con todos los nombres de los fabricantes que tienen 
el mismo número de productos que el fabricante Lenovo.

SELECT f.nombre as "Nombre_Fabricante",
COUNT(p.id_fabricante) as "Numero_productos"
FROM fabricante f
INNER JOIN producto p 
ON p.id_fabricante = f.id
GROUP BY f.nombre
HAVING COUNT(p.id_fabricante) = (SELECT COUNT(p.id_fabricante)
					FROM producto p
					INNER JOIN fabricante f
					ON f.id = p.id_fabricante
					WHERE f.nombre = "Lenovo");


WHERE f.id = ()
