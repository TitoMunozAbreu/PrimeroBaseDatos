<!-- Consultas sobre una tabla -->

1.Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT o.codigo_oficina as "cod_oficina",
o.ciudad as "ciudad_oficina"
FROM oficina o;

2.Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

SELECT o.ciudad as "Ciudad_oficina",
o.telefono as "Telefono_ofcina"
FROM oficina o
WHERE o.pais = "España";

3.Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un 
código de jefe igual a 7.

SELECT e.nombre as "Nombre.empleado",
CONCAT_WS(" ", e.apellido1, e.apellido2) as "Apellidos.empleado",
e.email as "email.empleado"
FROM empleado e
WHERE e.codigo_jefe = 7; 

4.Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT e.nombre as "Nombre",
CONCAT_WS(" ", e.apellido1, e.apellido2) as "Apellidos",
e.email as "Email"
FROM empleado e
WHERE e.codigo_jefe IS NULL;

5.Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean 
representantes de ventas.

SELECT e.nombre as "Nombre.empleado",
CONCAT_WS(" ", e.apellido1, e.apellido2) as "Apellidos.empleado",
e.puesto as "puesto"
FROM empleado e
WHERE e.puesto != "Representante Ventas";

6.Devuelve un listado con el nombre de los todos los clientes españoles.

SELECT c.nombre_cliente as "Nombre",
c.pais as "Pais"
FROM cliente c
WHERE c.pais = "Spain";

7.Devuelve un listado con los distintos estados por los que puede pasar un pedido.

SELECT DISTINCT p.estado as "Estado"
FROM pedido p;

8.Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún 
pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan 
repetidos. Resuelva la consulta:
	
	-Utilizando la función YEAR de MySQL.
	-Utilizando la función DATE_FORMAT de MySQL.
	-Sin utilizar ninguna de las funciones anteriores.

SELECT DISTINCT p.codigo_cliente as "cod_cliente"
FROM pago p
WHERE  = 2008;

SELECT DISTINCT p.codigo_cliente as "cod_cliente"
FROM pago p
WHERE DATE_FORMAT(p.fecha_pago,"%Y") = 2008;

9.Devuelve un listado con el código de pedido, código de cliente, fecha esperada y 
fecha de entrega de los pedidos que no han sido entregados a tiempo.

SELECT p.codigo_pedido as "cod_pedido",
p.codigo_cliente as "cod_cliente",
p.fecha_esperada as "fecha_esperada",
p.fecha_entrega as "fecha_entrega" 
FROM pedido p
WHERE p.fecha_entrega > p.fecha_esperada;

10.Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega 
de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

	-Utilizando la función DATEADD de MySQL.
	-Utilizando la función DATEDIFF de MySQL.

SELECT p.codigo_pedido as "cod_pedido",
p.codigo_cliente as "cod_cliente",
p.fecha_esperada as "fecha_esperada",
p.fecha_entrega as "fecha_entrega" 
FROM pedido p
WHERE DATEDIFF(p.fecha_esperada,p.fecha_entrega) = 2;

11.Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

SELECT * 
FROM pedido p
WHERE p.estado = "Rechazado"
AND YEAR(p.fecha_pedido) = 2009;

12.Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

SELECT *
FROM pedido p 
WHERE p.estado = "Entregado"
AND MONTH(p.fecha_entrega) = 01;

13.Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. 
Ordene el resultado de mayor a menor.

SELECT *
FROM pago p
WHERE YEAR(p.fecha_pago) = 2008
AND p.forma_pago = "PayPal"
ORDER BY p.total ASC;

14.Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. 
Tenga en cuenta que no deben aparecer formas de pago repetidas.


SELECT DISTINCT p.forma_pago as "forma pago"
FROM pago p;

15.Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 
unidades en stock.El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los 
de mayor precio.

SELECT * 
FROM producto p
WHERE p.gama = "Ornamentales"
AND p.cantidad_en_stock > 100
ORDER BY p.precio_venta DESC;


16.Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante 
de ventas tenga el código de empleado 11 o 30.

SELECT *
FROM cliente c
WHERE c.codigo_empleado_rep_ventas = 11
OR c.codigo_empleado_rep_ventas = 30
AND c.ciudad = "Madrid";


<!-- Consultas multitabla (Composición interna) -->

1.Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

SELECT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_rep_ventas",
CONCAT_WS(e.apellido1, e.apellido2) as "Apellidos_rep_ventas"
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

2.Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus
representantes de ventas.

SELECT DISTINCT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_rep_ventas"
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN pago p
ON p.codigo_cliente = c.codigo_cliente
WHERE p.total > 0;

SELECT DISTINCT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_rep_ventas"
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN pago p
ON p.codigo_cliente = c.codigo_cliente
WHERE p.codigo_cliente IS NOT NULL;

3.Muestra el nombre de los clientes que no hayan realizado pagos junto 
con el nombre de sus representantes de ventas.

SELECT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_rep_ventas"
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN pago p
ON p.codigo_cliente = c.codigo_cliente
WHERE p.codigo_cliente IS NULL;

4.Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes 
junto con la ciudad de la oficina a la que pertenece el representante.


SELECT DISTINCT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_representante",
o.ciudad as "ciudad_oficina"
FROM cliente c
LEFT JOIN pago p
ON p.codigo_cliente = c.codigo_cliente
INNER JOIN empleado e
ON e.codigo_empleado = c.codigo_empleado_rep_ventas
INNER JOIN oficina o
ON o.codigo_oficina = e.codigo_oficina
WHERE p.codigo_cliente IS NOT NULL;

5.Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus 
representantes junto con la ciudad de la oficina a la que pertenece el representante.

SELECT DISTINCT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_representante",
o.ciudad as "ciudad_oficina"
FROM cliente c
LEFT JOIN pago p
ON p.codigo_cliente = c.codigo_cliente
INNER JOIN empleado e
ON e.codigo_empleado = c.codigo_empleado_rep_ventas
INNER JOIN oficina o
ON o.codigo_oficina = e.codigo_oficina
WHERE p.codigo_cliente IS NULL;

6.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT o.linea_direccion1 as "direccion_oficina"
FROM oficina o
INNER JOIN empleado e
ON e.codigo_oficina = o.codigo_oficina
INNER JOIN cliente c
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE c.ciudad = "Fuenlabrada";  

7.Devuelve el nombre de los clientes y el nombre de sus representantes junto con la 
ciudad de la oficina a la que pertenece el representante.

SELECT c.nombre_cliente as "nombre_cliente",
e.nombre as "nombre_rep",
o.ciudad as "oficina_rep"
FROM cliente c
INNER JOIN empleado e
ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN oficina o
ON o.codigo_oficina = e.codigo_oficina;

8.Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT e.nombre as "nombre_empleado",
j.nombre as "nombre_jefe"
FROM empleado j
INNER JOIN empleado e 
ON e.codigo_empleado = j.codigo_jefe;

9.



















