SELECT *
FROM empleado e
RIGHT JOIN departamento d ON
d.codigo = e.codigo_departamento;

SELECT * 
FROM empleado e
INNER JOIN departamento d ON 
d.codigo = e.codigo_departamento
ORDER BY d.nombre ASC,
e.apellido1 ASC,
e.apellido2 ASC,
e.nombre ASC;  

SELECT  d.codigo as "Codigo departamento",
d.nombre as "Nombre departamento"
FROM departamento d
INNER JOIN empleado e ON
d.codigo = e.codigo_departamento
GROUP BY d.codigo;

SELECT d.codigo as "codigo departamento",
d.nombre as "nombre departamento",
d.presupuesto-d.gastos as "presupuesto actual"
FROM departamento d
INNER JOIN empleado e ON
e.codigo_departamento = d.codigo
GROUP BY d.codigo;

SELECT d.nombre as "Nombre Departamento"
FROM departamento d
INNER JOIN empleado e ON
e.codigo_departamento = d.codigo
WHERE e.nif = "38382980M";

SELECT d.nombre as "Nombre Departamento"
FROM departamento d
INNER JOIN empleado e ON
e.codigo_departamento = d.codigo
WHERE e.nombre= "Pepe"
AND e.apellido1 = "Ruiz"
AND e.apellido2 = "Santana";

SELECT *
FROM empleado e
INNER JOIN departamento d ON
d.codigo = e.codigo_departamento
WHERE d.nombre = "I+D"
ORDER BY e.nombre ASC;

SELECT *
FROM empleado e
INNER JOIN departamento d ON
d.codigo = e.codigo_departamento
WHERE d.nombre = "I+D"
ORDER BY e.nombre ASC;

select * from departamento;

SELECT *
FROM empleado e
INNER JOIN departamento d ON
d.codigo = e.codigo_departamento
WHERE d.nombre = "I+D"
OR d.nombre = "Sistemas"
OR d.nombre = "Contabilidad"
ORDER BY e.nombre ASC;

SELECT e.nombre
FROM empleado e 
INNER JOIN departamento d ON
d.codigo = e.codigo_departamento
WHERE d.presupuesto BETWEEN 100000
AND 200000; 

SELECT DISTINCT d.nombre as "Nombre Departamento"
FROM departamento d
INNER JOIN empleado e ON
e.codigo_departamento = d.codigo
WHERE e.apellido2 IS NULL;

SELECT d.nombre as "departamento",
d.presupuesto as "presupuesto"
FROM departamento d
ORDER BY d.presupuesto ASC
LIMIT 3;

SELECT d.nombre as "departamento",
d.gastos as "gastos"
FROM departamento d
ORDER BY d.gastos DESC
LIMIT 2;

SELECT d.nombre as "departamento",
d.gastos as "gastos"
FROM departamento d
WHERE d.gastos < 5000;

SELECT d.nombre as "departamento",
d.presupuesto as "presupuesto"
FROM departamento d
WHERE d.presupuesto BETWEEN 100000
AND 200000;

SELECT *
FROM empleado e
WHERE e.apellido2 = "Diaz" 
OR e.apellido2 = "Moreno";
