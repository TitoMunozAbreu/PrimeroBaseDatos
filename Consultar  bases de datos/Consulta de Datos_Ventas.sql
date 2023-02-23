<-- https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#tienda-de-inform%C3%A1tica -- >
<-- SEQUEL DATABASE VENTAS -->

<!-- Consultas sobre una tabla -->

1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar 
ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

SELECT * 
FROM pedido p
ORDER BY p.fecha DESC;

2.Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * 
FROM pedido p
ORDER BY p.total DESC
LIMIT 2;

3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

SELECT p.id_cliente as "Idetificadores_cliente" 
FROM pedido p
WHERE p.id_cliente IS NOT NULL
GROUP BY p.id_cliente;

4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, 
cuya cantidad total sea superior a 500€.

SELECT *
FROM pedido p
WHERE YEAR(p.fecha) = 2017
AND p.total > 500; 

5.Devuelve un listado con el nombre y los apellidos de los comerciales que tienen 
una comisión entre 0.05 y 0.11.

SELECT * 
FROM comercial c
WHERE comisión BETWEEN 0.05 and 0.11;

6.Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT * 
FROM comercial c
ORDER BY c.comisión DESC
LIMIT 1;

7.Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo 
apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

SELECT c.id as "ID",
c.nombre as "Nombre",
c.apellido1 as "Primer Apellido"
FROM cliente c
WHERE c.apellido2 IS NOT NULL
ORDER BY c.nombre ASC, apellido1 ASC;

8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n 
y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

SELECT * 
FROM cliente c
WHERE c.nombre LIKE "A%n"
OR c.nombre LIKE "P%"
ORDER BY c.nombre ASC;

9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado 
deberá estar ordenado alfabéticamente.

SELECT *
FROM cliente c
WHERE c.nombre NOT LIKE "A%"
ORDER BY c.nombre ASC;

10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. 
Tenga en cuenta que se deberán eliminar los nombres repetidos.

SELECT DISTINCT c.nombre as "Nombre"
FROM comercial c
WHERE c.nombre LIKE "%el"
OR c.nombre LIKE "%o";

<!-- Consultas multitabla (Composición interna) -->

1. Devuelve un listado con el identificador, nombre y los apellidos de todos los 
clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente
y se deben eliminar los elementos repetidos.

SELECT c.id as "ID",
c.nombre as "nombre",
c.apellido1 as "P.Apellido",
c.apellido2 as "S.Apellido"
FROM cliente c
WHERE c.id = ANY (SELECT p.id_cliente
		FROM pedido p)
GROUP BY c.nombre
ORDER BY c.nombre ASC;

2.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
El resultado debe mostrar todos los datos de los pedidos y del cliente. 
El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT *
FROM cliente c, pedido p
WHERE c.id = p.id_cliente
ORDER BY c.nombre;

3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial.
El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

SELECT *
FROM comercial c, pedido p
WHERE c.id = p.id_cliente
ORDER BY c.nombre;

4.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y 
con los datos de los comerciales asociados a cada pedido.


SELECT cl.nombre as "Nombre_cliente",
p.total as "EUR pedido",
co.nombre as "Nombre_comercial"
FROM cliente cl, pedido p, comercial co
WHERE cl.id = p.id_cliente
AND p.id_comercial = co.id
ORDER BY p.id;

5.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017,
cuya cantidad esté entre 300 € y 1000 €.

SELECT *
FROM cliente cl
WHERE cl.id = ANY(SELECT p.id_cliente
			FROM pedido p
			WHERE YEAR(fecha) = 2017
			AND p.total BETWEEN 300 AND 1000);

6.Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún
pedido realizado por María Santana Moreno.

SELECT co.nombre as "nombre_cormercial",
co.apellido1 as "apellido_comercial"
FROM comercial co
WHERE co.id = ANY (SELECT p.id_comercial
			FROM pedido p
			WHERE p.id_cliente = ANY (SELECT cl.id
							FROM cliente cl
							WHERE cl.nombre = "María"
							AND cl.apellido1 = "Santana"
							AND cl.apellido2 = "Moreno"));

SELECT co.nombre as "nombre_cormercial",
co.apellido1 as "apellido_comercial"
FROM comercial co
WHERE co.id = (SELECT p.id_comercial
			FROM pedido p
			WHERE p.id_cliente = (SELECT cl.id
							FROM cliente cl
							WHERE cl.nombre = "María"
							AND cl.apellido1 = "Santana"
							AND cl.apellido2 = "Moreno")
			GROUP BY p.id_comercial);

7.Devuelve el nombre de todos los clientes que han realizado algún pedido con 
el comercial Daniel Sáez Vega.

SELECT cl.nombre as "Nombre_cliente",
cl.apellido1 as "Apellido1_cliente",
cl.apellido2 as "Apellido2_cliente"
FROM cliente cl
WHERE cl.id = ANY(SELECT p.id_cliente
			FROM pedido p
			WHERE p.id_comercial = ANY(SELECT co.id
								FROM comercial co
								WHERE co.nombre = "Daniel"
								AND co.apellido1 = "Saéz"
								AND co.apellido2 = "Vega"));



<!-- Consultas multitabla (Composición externa) -->

1.Devuelve un listado con todos los clientes junto con los datos de los pedidos 
que han realizado. Este listado también debe incluir los clientes que no han realizado
ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, 
segundo apellido y nombre de los clientes.

SELECT *
FROM cliente cl
LEFT JOIN pedido p
ON p.id_cliente = cl.id
ORDER BY cl.apellido1 ASC,cl.apellido2 ASC,cl.nombre ASC;


2.Devuelve un listado con todos los comerciales junto con los datos de los pedidos que 
han realizado. Este listado también debe incluir los comerciales que no han realizado 
ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, 
segundo apellido y nombre de los comerciales.


SELECT *
FROM comercial co
LEFT JOIN pedido p
ON p.id_comercial = co.id
ORDER BY co.apellido1 ASC,co.apellido2 ASC,co.nombre ASC;

3.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.

SELECT *
FROM cliente cl
LEFT JOIN pedido p
ON p.id_cliente = cl.id
WHERE p.id_cliente IS NULL;

4.Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.

SELECT *
FROM comercial co
LEFT JOIN pedido p 
ON  p.id_comercial = co.id
WHERE p.id_comercial IS NULL;


<!-- Consultas Resumen -->

1.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

SELECT CAST(SUM(p.total) as DECIMAL (7,2)) as "Cant_total"
FROM pedido p;

2.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.


SELECT CAST(AVG(p.total) as decimal (6, 2)) as "Media_pedidos"
FROM pedido p;

3.Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

SELECT DISTINCT COUNT(p.id_comercial) as "Total_comerciales"
FROM pedido p;

4.Calcula el número total de clientes que aparecen en la tabla cliente.

SELECT COUNT(c.id) AS "Total_clientes"
FROM cliente c;

5.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

SELECT MAX(p.total) as "Mayor_cantidad"
FROM pedido p;

6.Calcula cuál es la menor cantidad que aparece en la tabla pedido.

SELECT MIN(p.total) as "Menor_cantidad"
FROM  pedido p;

7.Calcula cuál es el valor máximo de categoría para cada una de las ciudades
que aparece en la tabla cliente.

SELECT MAX(c.categoría) as "Maxima_categoria",
c.ciudad as "ciudad"
FROM cliente c
GROUP BY c.ciudad;

8.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo 
día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado 
varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es 
el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado 
un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor 
de la cantidad.

SELECT c.id as "ID",
c.nombre as "Nombre_cliente",
c.apellido1 as "Apellido1_cliente",
c.apellido2 as "Apellido2_cliente",
p.fecha as "Fecha_pedido",
CAST(MAX(p.total) as decimal (6,2)) as "Max_compra"
FROM cliente c
INNER JOIN pedido p
ON p.id_cliente = c.id
GROUP BY p.fecha
ORDER BY p.fecha;

9.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para 
cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos 
que superen la cantidad de 2000 €.

SELECT c.id as "ID",
c.nombre as "Nombre_cliente",
c.apellido1 as "Apellido1_cliente",
c.apellido2 as "Apellido2_cliente",
p.fecha as "Fecha_pedido",
CAST(MAX(p.total) as decimal (6,2)) as "Max_compra"
FROM cliente c
INNER JOIN pedido p
ON p.id_cliente = c.id
WHERE p.total > 2000
GROUP BY p.fecha
ORDER BY p.fecha;

10.Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales
durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos 
y total.

SELECT co.id as "ID_comercial",
co.nombre as "Nombre_comercial",
co.apellido1 as "Apellido1_comercial",
co.apellido2 as "Apellido2_comercial",
CAST(MAX(p.total) as decimal (6,2)) as "Max_pedido"
FROM comercial co
INNER JOIN pedido p
ON p.id_comercial = co.id
WHERE p.fecha = "2016-08-17"
GROUP BY co.id
ORDER BY co.id; 

11.Devuelve un listado con el identificador de cliente, nombre y apellidos y el número 
total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden 
existir clientes que no han realizado ningún pedido. Estos clientes también deben 
aparecer en el listado indicando que el número de pedidos realizados es 0.


SELECT cl.nombre as "Nombre_cliente",
CONCAT_WS(" ",cl.apellido1, cl.apellido2) as "Apellidos_cliente",
COUNT(p.id) as "Numero_pedido"
FROM cliente cl
LEFT JOIN pedido p
ON p.id_cliente = cl.id
GROUP BY cl.id
ORDER BY cl.id ASC;

12.Devuelve un listado con el identificador de cliente, nombre y apellidos y
el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

SELECT cl.nombre as "Nombre_cliente",
CONCAT_WS(" ",cl.apellido1, cl.apellido2) as "Apellidos_cliente",
COUNT(p.id) as "Numero_pedido"
FROM cliente cl
LEFT JOIN pedido p
ON p.id_cliente = cl.id
WHERE YEAR(p.fecha) = 2017
GROUP BY cl.id
ORDER BY cl.id ASC;

13.Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y 
el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. 
El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando 
que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.

SELECT cl.nombre as "Nombre_cliente",
cl.apellido1 as "PrimerApellido_cliente",
IFNULL(MAX(p.total),0) as "ValorMaximo_pedido"
FROM cliente cl
LEFT JOIN pedido p
ON p.id_cliente = cl.id
GROUP BY cl.id
ORDER BY cl.id ASC;

14.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

SELECT MAX(p.total) as "Max_valor",
YEAR(p.fecha) as "Año"
FROM pedido p
GROUP BY YEAR(p.fecha)
ORDER BY p.fecha ASC;

15.Devuelve el número total de pedidos que se han realizado cada año.

SELECT COUNT(*) as "Nºpedidos",
YEAR(p.fecha) as "Año"
FROM pedido p
GROUP BY YEAR(p.fecha)
ORDER BY YEAR(p.fecha) ASC;

<!-- Subconsultas -->

1.Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. 
(Sin utilizar INNER JOIN).

SELECT * 
FROM pedido p
WHERE p.id_cliente = (SELECT cl.id
				FROM cliente cl
				WHERE cl.nombre = "Adela"
				AND cl.apellido1 = "Salas"
				AND cl.apellido2 = "Díaz");

2.Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. 
(Sin utilizar INNER JOIN)

SELECT COUNT(*) as "Nºpedidos"
FROM pedido p
WHERE p.id_comercial = (SELECT c.id
				FROM comercial c
				WHERE c.nombre = "Daniel"
				AND c.apellido1 = "Saéz"
				AND c.apellido2 = "Vega");

3.Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. 
(Sin utilizar INNER JOIN)

SELECT *
FROM cliente cl
WHERE cl.id = (SELECT p.id_cliente
			FROM pedido p			
			WHERE p.total = (SELECT MAX(p.total)
						FROM pedido p
						WHERE YEAR(p.fecha) = 2017));

4.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente 
Pepe Ruiz Santana.

SELECT p.fecha as "Fecha_pedido",
MIN(p.total) as "Pedido_menorValor"
FROM pedido p
WHERE p.id_cliente = (SELECT cl.id
				FROM 	cliente cl
				WHERE cl.nombre = "Pepe"
				AND cl.apellido1 = "Ruiz"
				AND cl.apellido2 = "Santana");

5.Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes 
que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio 
de los pedidos realizados durante ese mismo año.

SELECT *
FROM cliente cl, pedido p
WHERE cl.id = p.id_cliente
AND YEAR(p.fecha) = 2017
AND p.total >= (SELECT AVG(p.total)
			FROM pedido p
			WHERE YEAR(p.fecha) = 2017);


<!-- Subconsultas con ALL y ANY -->

6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.

SELECT p.total as "Pedido_ mas Caro"
FROM pedido p
WHERE p.total >= ALL(SELECT p.total
			FROM pedido p);

7.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT *
FROM cliente cl
WHERE cl.id != All (SELECT p.id_cliente
				FROM pedido p);

8.Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).

SELECT * 
FROM comercial c
WHERE c.id != ALL(SELECT p.id_comercial
				FROM pedido p);

<!-- Subconsultas con IN y NOT IN -->
9.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT *
FROM cliente cl
WHERE cl.id NOT IN (SELECT p.id_cliente
				FROM pedido p);

10.Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT *
FROM comercial c
WHERE c.id NOT IN (SELECT p.id_comercial
				FROM pedido p);

<!-- Subconsultas con EXISTS y NOT EXISTS -->

11.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT *
FROM cliente c 
WHERE NOT EXISTS (SELECT p.id_cliente
			FROM pedido p
			WHERE p.id_cliente = c.id); 

12.Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

SELECT *
FROM comercial c
WHERE NOT EXISTS (SELECT p.id_comercial
			FROM pedido p
			WHERE p.id_comercial = c.id);





