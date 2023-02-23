
1. Mostrar los empleados (código, apellido y nombre del departamento) 
de la empresa que tienen el cargo de director y ordenados por el apellido.
Como verás, la información que debe aparecer está en dos Tablas: EMPLEADO y 
DEPARTAMENTO, las cuales deben combinarse (usando INNER) adecuadamente.

SELECT e.emp_no as "Codigo_Empleado",
e.nombre as "Nombre_Empleado",
d.dnom as "Departamento"
FROM empleado e
INNER JOIN departamento d
ON e.dept_no = d.dept_no
WHERE e.cargo = "DIRECTOR"
ORDER BY "Nombre_Empleado" ASC;

2.Mostrar el importe total que cada Departamento paga mensualmente en 
concepto de salario de los empleados (Total Nómina) y ordenado descendentemente 
por el importe total de la nómina.
La información que debe aparecer está en dos tablas, EMPLEADO y DEPARTAMENTO.
Para esta Consulta,  deberás agrupar y sumar  convenientemente (GROUP BY). 
El resultado deberá parecerse a la imágen.


SELECT d.dept_no as "Dept.",
d.dnom as "Nombre",
SUM(e.salario) as "T.Nomina"
FROM departamento d
LEFT JOIN empleado e
ON e.dept_no = d.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_no DESC, SUM(e.salario) DESC;

3.Mostrar un listado con los Códigos del Cliente, su Nombre, Fecha del Pedido y 
el Total del Pedido ordenado ascendentemente por Código de Cliente y fecha del Pedido
La información que debe aparecer está en dos tablas, PEDIDO y CLIENTE, las cuales se 
deben combinar adecuadamente.
Los primeros registros debieran ser aproximadamente....

SELECT c.cliente_codigo as "Cliente",
c.nombre as "Nombre",
p.pedido_fecha as "F.Pedido",
p.total as "Importe"
FROM cliente c
INNER JOIN pedido p
ON c.cliente_codigo = p.cliente_codigo
ORDER BY c.cliente_codigo ASC, c.nombre ASC, p.pedido_fecha ASC;

4.Del Pedido 601 necesitamos obtener un listado con: 
Número del Pedido (PEDIDO_NUMERO), Número de Linea de detalle 
(DETALLE_NUMERO) , Nombre del Producto (DESCRIPCION) , Precio de Venta (PRECIO_VENTA), 
Cantidad (CANTIDAD) e Importe (IMPORTE).

Nota: Entre paréntesis los nombre se las columnas que aparerán en pantalla.

Los primeros registros debieran ser 
aproximadamente....

SELECT pe.pedido_numero as "Pedido",
d.detalle_numero as "Linea",
pro.descripcion as "Producto",
d.precio_venta as "Precio",
d.cantidad as "Cantidad",
d.importe as "Importe"
FROM pedido pe
INNER JOIN detalle d
ON d.pedido_numero = pe.pedido_numero
INNER JOIN producto pro
ON d.producto_numero = pro.producto_numero
WHERE pe.pedido_numero = 601;

5.Obtiene una lista con el nombre, cargo y salario de todos los empleados cuyo 
salario es MAYOR que la media del salario de todos los empleados.
Los primeros registros debieran ser 
aproximadamente....

SELECT e.nombre as "Nombre",
e.cargo as "Cargo",
e.salario as "Salario"
FROM empleado e
WHERE e.salario > (SELECT AVG(e.salario)
  				FROM empleado e);

6.¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? 
Justifique su respuesta.

