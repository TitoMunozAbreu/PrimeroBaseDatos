Consultas multitabla (Composición interna). Resuelva todas las consultas 
utilizando combinaciones internas (INNER JOIN) y/o consultas de agrupados
(GROUP BY) y/o SUBCONSULTAS:

1.(CONSULTA MULTITABLA) Obtener un Listado con el nombre y apellidos 
del cliente, nombre de la población, código postal y nombre de la 
provincia de los clientes que habitan en Viveiro. Ordénalo por Nombre 
del Cliente

SELECT c.nombre as "Nombre",
c.apellido as "Apellido 1",
c.apellido2 as "Apellido 2 ",
po.Poblacion as "Nombre",
ca.CodPostal as "CP",
pro.Provincia as "Provincia"
FROM clientes c
INNER JOIN callespoblaciones ca
ON c.Calle = ca.idCalle
INNER JOIN poblaciones po
ON po.CodigoPoblacion = ca.CodPoblacion
INNER JOIN provincias pro
ON pro.CodigoProvincia = po.CodigoProvincia
WHERE po.Poblacion = "Viveiro"
ORDER BY c.nombre ASC;

2.(MULTITABLA Y AGREGACIÓN) ¿Cuál es el piso más grande (en metros)? 
Obtén la primera población y provincia donde se encuentra.

SELECT po.poblacion as "Poblacion",
pro.provincia as "Provincia",
MAX(c.metros) as "Metros"
FROM clientes c
INNER JOIN callespoblaciones ca
ON c.Calle = ca.idCalle
INNER JOIN poblaciones po
ON po.CodigoPoblacion = ca.CodPoblacion
INNER JOIN provincias pro
ON pro.CodigoProvincia = po.CodigoProvincia
ORDER BY MAX(c.metros) DESC
LIMIT 1;

3.(SUBCONSULTA) ¿Cuántos pisos están por encima de la media?
(en metros cuadrados)

SELECT AVG(c.metros) as "Media m2",
COUNT(c.Piso) as "Nº Pisos"
FROM clientes c
WHERE c.metros > (SELECT AVG(c.metros)
			             FROM clientes c);

4.(MULTITABLA Y AGRUPACIÓN) ¿Cuántos habitantes tienen cada provincia? 
Lista la provincia y la suma de habitantes que tiene.

SELECT pro.provincia as "Provincia",
po.habitantes as "Habitantes"
FROM provincias pro
INNER JOIN poblaciones po
ON po.CodigoProvincia = pro.CodigoProvincia
GROUP BY pro.provincia
ORDER BY pro.provincia;

5.(AGRUPACIÓN) Cuáles son los TRES primeros apellidos  
(sólo primer apellido) predominantes entre los Cliente?
Cuando hablamos de predominantes nos refererimos a los que más se 
repiten.

Puede haber más de los que aparecen en la imagen.


SELECT c.apellido as "Apellido",
COUNT(c.codigo) as "Numero"
FROM clientes c
GROUP BY c.apellido
HAVING COUNT(c.codigo) = 5
ORDER BY COUNT(c.codigo)
LIMIT 3;

