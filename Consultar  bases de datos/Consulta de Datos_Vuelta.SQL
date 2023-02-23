<!-- SEQUEL DATABASE VUELTA -->

1.Obtener el nombre y el equipo de los ciclistas menores de 30 años que hayan ganado 
alguna etapa.

SELECT c.nombre as "Nombre",
c.nomeq as "Equipo"
FROM ciclista c
INNER JOIN etapa et 
ON et.dorsal = c.dorsal
WHERE c.edad < 30
GROUP BY c.nombre; 

2.Obtener el nombre y el equipo de los ciclistas mayores de 32 años que hayan 
ganado algun puerto.

SELECT c.nombre as "Nombre Ciclista",
c.nomeq as "Equipo"
FROM ciclista c
INNER JOIN etapa e
ON c.dorsal = e.dorsal
WHERE edad > 32
GROUP BY c.nombre;

3.Obtener los datos de las etapas que pasan por algun puerto de montaña y que 
tienen salida y llegada en la misma poblacion.

SELECT *
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE e.salida = e.llegada;SELECT e.llegada as "Poblaciones meta"
FROM etapa e
WHERE e.salida != e.llegada;

4.Obtener las poblaciones que tienen la meta de alguna etapa, pero desde 
las que no se realiza ninguna salida.

SELECT e.llegada as "Poblaciones meta"
FROM etapa e
WHERE e.salida NOT IN (e.llegada)
GROUP BY e.llegada;


5.Obtener el nombre y el equipo de los ciclistas que han ganado alguna 
etapa llevando el maillot amarillo, mostrando tambien el numero de etapa.

SELECT c.nombre  as "Ciclista",
c.nomeq as "Equipo",
e.netapa as "Etapa nº",
m.color as "Maillot"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN maillot m
ON m.codigo = l.codigo
WHERE l.netapa = e.netapa 
AND m.color = "amarillo"; 

6.Obtener las poblaciones de salida y de llegada de las etapas donde se encuentran 
puertos con altura superior a 1300 metros

SELECT e.salida as "poblacion_salida",
e.llegada as "poblacion_llegada", 
p.nompuerto as "nombre_puerto",
p.altura as "altura_puerto"
FROM etapa e
INNER JOIN puerto p
ON e.netapa = p.netapa
WHERE p.altura > 1300;

7.Obtener el numero de las etapas que tienen algun puerto de montaña, 
indicando cuantos tiene cada una de ellas.

SELECT e.netapa as "Etapa nº",
COUNT(p.nompuerto) as "Puerto montaña"
FROM etapa e 
INNER JOIN puerto p
ON p.netapa = e.netapa
GROUP BY e.netapa
ORDER BY e.netapa ASC;

8.Obtener el nombre y la edad de los ciclistas que han llevado dos o 
mas maillots en una misma etapa.

SELECT c.nombre as "Ciclista",
c.edad as "edad",
COUNT(l.codigo) as "Maillot Nº" 
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
GROUP BY c.nombre
HAVING COUNT(l.netapa) >= 2
ORDER BY COUNT(l.codigo);

9.Obtener el nombre y el equipo de los ciclistas que han llevado algun maillot 
o que han ganado algun puerto.

SELECT c.dorsal as "dorsal",
c.nombre as "Ciclista",
c.nomeq as "Equipo"
FROM ciclista c
WHERE c.dorsal IN (SELECT l.dorsal
				FROM lleva l)
OR c.dorsal IN (SELECT p.dorsal
				FROM puerto p);

10.Obtener los numeros de las etapas que no tienen puertos de montaña.

SELECT count(*)
FROM etapa e
LEFT JOIN puerto p
ON p.netapa = e.netapa
WHERE p.netapa IS NULL;

11.Obtener la edad media de los ciclistas que han ganado alguna etapa.

SELECT AVG(c.edad) as "Edad media"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal;

12.Obtener el nombre de los puertos de montaña que tienen una altura 
superior a la altura media de todos los puertos.

SELECT p.nompuerto as "nombre puerto"
FROM puerto p
WHERE p.altura > (SELECT AVG(p.altura)
				FROM puerto p);

13.Obtener las poblaciones de salida y de llegada de las etapas 
donde se encuentran los puertos con mayor pendiente.


SELECT e.salida as "poblacion_salida",
e.llegada as "poblacion_llegada"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE p.pendiente = (SELECT MAX(p.pendiente)
					FROM puerto p);

14.Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos de mayor altura.

SELECT c.dorsal as "Dorsal",
c.nombre as "nombre"
FROM ciclista c
INNER JOIN puerto p
ON p.dorsal = c.dorsal
WHERE p.altura = (SELECT MAX(p.altura)
					FROM puerto p);

15.Obtener los datos de las etapas cuyos puertos (todos) superan los 1300 metros de altura.

SELECT  * 
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE p.altura > 1300;

16.Obtener la edad del ciclista mas joven, la del mas veterano y la edad media 
de los ciclistas que han participado en la vuelta.

SELECT MIN(c.edad) as "Edad min",
MAX(c.edad) as "Edad max",
CAST(AVG(c.edad) AS DECIMAL(4,2)) as "Edad media"
FROM ciclista c
ORDER BY c.edad;

17.Obtener el nombre del equipo y el director del ciclista que gano la etapa mas larga.

SELECT eq.nomeq as "Equipo",
eq.director as "Director"
FROM equipo eq
INNER JOIN ciclista c
ON c.nomeq = eq.nomeq
WHERE c.dorsal = (SELECT e.dorsal
			FROM etapa e
			WHERE e.km IN (SELECT MAX(e1.km)
						FROM etapa e1));

SELECT eq.nomeq as "Equipo",
eq.director as "Director"
FROM equipo eq
INNER JOIN ciclista c
ON c.nomeq = eq.nomeq
INNER JOIN etapa e
ON e.dorsal = c.dorsal
WHERE e.km = (SELECT MAX(e1.km)
			FROM etapa e1);

18.Obtener el dorsal y el nombre de los ciclistas que hayan ganado alguna etapa, 
mostrando el numero de etapas que han ganado.

SELECT c.dorsal as "Dorsal",
c.nombre as "Nombre",
COUNT(c.dorsal) as "Nº Etapas ganadas"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
GROUP BY c.nombre
ORDER BY COUNT(c.dorsal) DESC;

19.Obtener el nombre de los ciclistas que pertenecen a un equipo de mas de cinco 
ciclistas y que han ganado alguna etapa, indicando tambien cuantas etapas han ganado.


---- https://sites.google.com/site/bddvs1daw/ut-04-realizacion-de-consultas/practica-vuelta-ciclista ------

1.Obtener el nombre y la altura de todos los puertos de 1ª categoría.

SELECT p.nompuerto as "nombre:puerto",
p.altura as "altura"
FROM puerto p
WHERE p.categoria = 1;


2.Obtener las poblaciones que tienen la meta de alguna etapa, pero desde las que no se realiza ninguna salida.



----------------- https://docplayer.es/49478727-Ejercicios-sql-vuelta-ciclista.html -------------------

1.Obtener el nombre y el equipo de los ciclistas menores de 30 años que hayan ganado alguna etapa.

SELECT c.nombre as "ciclista",
c.nomeq as "equipo"
FROM ciclista c
INNER JOIN etapa e
ON c.dorsal = e.dorsal
WHERE c.edad < 30
GROUP BY c.nombre
ORDER BY c.nombre ASC;


2.Obtener el nombre y el equipo de los ciclistas mayores de 32 años que hayan ganado algún puerto.


SELECT c.nombre as "ciclista",
c.nomeq as "equipo"
FROM ciclista c
INNER JOIN etapa e
ON c.dorsal = e.dorsal
WHERE c.edad > 32
GROUP BY c.nombre
ORDER BY c.nombre ASC;

3.Obtener los datos de las etapas que pasan por algún puerto de montaña y que tienen salida y
 llegada en la misma población

SELECT e.netapa as "etapa nº",
e.salida as "salida",
e.llegada as "llegada"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE e.salida = e.llegada
GROUP BY e.netapa
ORDER BY e.netapa;

4.Obtener las poblaciones que tienen la meta de alguna etapa, pero desde las que no se realiza ninguna salida

SELECT DISTINCT e.llegada as "poblacion meta"
FROM etapa e
WHERE e.llegada NOT IN (SELECT e.salida
				FROM etapa e)
ORDER BY e.llegada;

5.Obtener el nombre y el equipo de los ciclistas que han ganado alguna etapa llevando el maillot amarillo, 
mostrando también el número de etapa

SELECT c.nombre as "ciclista",
c.nomeq as "equipo",
e.netapa as "nº etapa"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN etapa e
ON e.dorsal = c.dorsal
WHERE l.netapa = e.netapa
AND l.codigo = (SELECT m.codigo
			FROM maillot m
			WHERE m.color = "amarillo");

6.Obtener las poblaciones de salida y de llegada de las etapas donde se encuentran puertos 
con altura superior a 1300 metros

SELECT e.netapa as "nº etapa",
e.salida as "p.salida",
e.llegada as "p.llegada"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE p.altura > 1300
GROUP BY e.salida,e.llegada
ORDER BY e.salida ASC, e.llegada ASC;

7.Obtener el número de las etapas que tienen algún puerto de montaña, 
indicando cuántos tiene cada una de ellas

SELECT e.netapa as "Etapa nº",
COUNT(p.netapa) as "nº puertos"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
GROUP BY e.netapa
ORDER BY e.netapa ASC;

8.Obtener el nombre y la edad de los ciclistas que han llevado dos o más maillots
en una misma etapa.


SELECT c.dorsal as "Dorsal",
c.nombre as "ciclista",
c.edad as "Edad"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
GROUP BY l.netapa,c.dorsal
HAVING COUNT(c.dorsal) >= 2; 

9.Obtener el nombre y el equipo de los ciclistas que han llevado algún maillot o que han ganado algún puerto.

SELECT c.nombre as "Ciclista",
c.nomeq as "Equipo"
FROM ciclista c
WHERE c.dorsal IN (SELECT l.dorsal
			FROM lleva l)
OR c.dorsal IN (SELECT p.dorsal
			FROM puerto p)
ORDER BY c.nombre;

10.Obtener los números de las etapas que no tienen puertos de montaña.

SELECT e.netapa as "nº etapa"
FROM etapa e
WHERE e.netapa NOT IN (SELECT p.netapa
				FROM puerto p)
ORDER BY e.netapa ASC;

11.Obtener la edad media de los ciclistas que han ganado alguna etapa..

SELECT CAST(AVG(c.edad) as DECIMAL (4,2)) as "Edad media"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal;

12.Obtener el nombrede los puertos de montaña que tienen una altura superior a la altura media 
de todos los puertos.

SELECT p.nompuerto as "nombre_puerto"
FROM puerto p
WHERE p.altura > (SELECT AVG(p1.altura)ç
			FROM puerto p1)
ORDER BY p.nompuerto ASC;

13.Obtener las poblaciones de saliday de llegada de las etapas donde se encuentran los 
puertos con mayor pendiente

SELECT e.salida as "e.salida",
e.llegada as "e.llegada"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa 
HAVING MAX(p.pendiente);

14.Obtener el dorsal y el nombre de los ciclistas que han ganado los puertos de mayor altura

SELECT c.dorsal as "Dorsal",
c.nombre as "Ciclista"
FROM ciclista c
INNER JOIN puerto p
ON p.dorsal = c.dorsal
WHERE p.altura = (SELECT MAX(p1.altura)
			FROM puerto p1);

15.Obtener los datos de las etapas cuyos puertos (todos) superan los 1300 metros de altura.

SELECT * 
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE p.altura > 1300
AND e.netapa NOT IN (SELECT p1.netapa 
			FROM puerto p1
			WHERE p1.altura <= 1300)
GROUP BY e.netapa
ORDER BY e.netapa ASC;

16.Obtener la edad del ciclista más joven, la del más veterano y la edad media de los ciclistas 
que han participado en la vuelta.

SELECT MIN(c.edad) as "mas Joven",
MAX(c.edad) as "mas Veterano",
AVG(c.edad) as "Media"
FROM ciclista c;

17.Obtener el nombre del equipo y el director del ciclista que ganó la etapa más larga

SELECT e.nomeq as "Equipo",
e.director as "Director"
FROM equipo e
INNER JOIN ciclista c
ON c.nomeq = e.nomeq
INNER JOIN etapa et
ON et.dorsal = c.dorsal 
WHERE et.km = (SELECT MAX(et1.km)
			FROM etapa et1);

18.Obtener el dorsal y el nombre de los ciclistas que hayan ganado alguna etapa, 
mostrando el número de etapas que han ganado

SELECT c.dorsal as "Dorsal",
c.nombre as "Ciclista",
COUNT(e.dorsal) as "nº etapas_ganadas"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
GROUP BY c.dorsal
ORDER BY c.dorsal;

19.Obtener el nombre de los ciclistas que pertenecen a un equipo de más de cinco 
ciclistas y que han ganado alguna etapa, indicando también cuántas etapas han ganado

SELECT c.nombre as "Ciclista",
COUNT(e.dorsal) as "nº etapas_ganadas"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
WHERE c.nomeq IN (SELECT c1.nomeq
			FROM ciclista c1
			GROUP BY c1.nomeq
			HAVING COUNT(c1.nomeq) > 5)
GROUP BY c.dorsal, c.nombre
ORDER BY c.dorsal;


20.Nombre y equipo de los ciclistas que han llevado alguna vez el maillot amarillo, 
indicando durante cuántas etapas lo han llevado.

SELECT DISTINCT c.nombre as "ciclistas",
c.nomeq as "Equipo",
COUNT(*) as "nº estapas"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN maillot m
ON m.codigo = l.codigo
AND m.color = "amarillo"
GROUP BY c.nombre,c.nomeq
ORDER BY c.nombre;

21.Por cada equipo, color de los maillots que han llevado sus ciclistas.

SELECT c.nomeq as "Equipo",
m.color as "color"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN maillot m
ON m.codigo = l.codigo
GROUP BY c.nomeq,m.color
ORDER BY c.nomeq;

22.Nombre y equipo del ganador de la vuelta (es decir, el que ha lucido el maillot 
amarillo en la última etapa)

SELECT c.nombre as "Ciclista",
c.nomeq as "Equipo"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN maillot m
ON m.codigo = l.codigo
WHERE l.netapa =  (SELECT MAX(e1.netapa)
			FROM etapa e1)
AND m.color = "amarillo" ;

23.Nombre de los equipos que no han llevado el maillot amarillo.

SELECT eq.nomeq as "Equipo"
FROM equipo eq 
WHERE eq.nomeq NOT IN (SELECT c.nomeq
				FROM ciclista c
				INNER JOIN lleva l
				ON l.dorsal = c.dorsal 
				INNER JOIN maillot m
				ON m.codigo = l.codigo
				WHERE m.color = "amarillo");

24.Nombre y dorsal de los ciclistas mayores de 30 años quehan ganado algún puerto, junto con 
el número de puertos que han ganado.

SELECT c.dorsal as "dorsal",
c.nombre as "ciclista",
c.edad as "edad",
COUNT(p.dorsal) as "nº puertos_ganados"
FROM ciclista c
INNER JOIN puerto p
ON p.dorsal = c.dorsal
WHERE c.edad > 30
GROUP BY c.dorsal
ORDER BY c.dorsal;

25.Nombre y director de los equipos que, en alguna etapa, sus ciclistas han llevado tres o más maillots

SELECT e.nomeq as "Nombre",
e.director as "director"
FROM equipo e
WHERE e.nomeq = ANY (SELECT c.nomeq
				FROM ciclista c
				INNER JOIN lleva l
				ON l.dorsal = c.dorsal
				GROUP BY l.netapa,c.nomeq
				HAVING COUNT(l.dorsal) >= 3)
GROUP BY e.nomeq,e.director;

26.Nombre de los equipos que sólo tienen ciclistas menores de 28 años

SELECT e.nomeq as "Equipo"
FROM equipo e
WHERE e.nomeq IN (SELECT c1.nomeq
				FROM ciclista c1
				WHERE c1.edad < 28)
AND e.nomeq NOT IN (SELECT c1.nomeq
				FROM ciclista c1
				WHERE c1.edad >= 28)
GROUP BY e.nomeq;


27.Dorsal y nombre del ciclista que ha llevado el maillot amarillo durantemás etapas

SELECT c.dorsal as "Dorsal",
c.nombre as "Ciclista"
FROM ciclista c
INNER JOIN lleva l
ON l.dorsal = c.dorsal
INNER JOIN maillot m
ON l.codigo = m.codigo
WHERE m.color = "amarillo"
AND l.netapa = (SELECT MAX(e.netapa)
			FROM etapa e)
GROUP BY c.dorsal,c.nombre;


---------------------- PREGUNTAS DEL EXAMEN --------------------------

1.Obten  el nombre de los Ciclistas y en nº de la Etapas que han ganado.

SELECT c.nombre as "Ciclista",
COUNT(e.dorsal) as "Nª Etapas"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
GROUP BY e.dorsal
ORDER BY COUNT(e.dorsal) DESC;

2.Obten  el nombre de aquellos ciclistas que tengan una edad entre 25 y 30 años
y que no pertenezcan a los equipos Kelme y Banesto.

SELECT c.nombre as "Ciclista",
c.edad as "edad",
c.nomeq as "Equipo"
FROM ciclista c
WHERE c.edad BETWEEN 25 AND 30
AND c.nomeq NOT IN (SELECT e.nomeq
				FROM equipo e
				WHERE nomeq = "kelme"
				OR nomeq = "Banesto");

3.Obtener el número de ciclistas de cada equipo

SELECT e.nomeq as "Equipo",
COUNT(c.nomeq) as "Nº ciclistas"
FROM equipo e
INNER JOIN ciclista c
ON c.nomeq = e.nomeq
GROUP BY e.nomeq;

4.Obtener las poblaciones de salida, la de llegada y la altura del puerto/s de las etapas
donde se encuentran puertos con altura superior a 1300 metros

SELECT e.netapa as "Nº etapa",
e.salida as "Poblacion_salida",
e.llegada as "Poblacion_llegada",
p.altura as "altura"
FROM etapa e
INNER JOIN puerto p
ON p.netapa = e.netapa
WHERE p.altura > 1300
GROUP BY e.salida,e.llegada;

5.Obten las etapas (netapa, km, salida y llegada) de aquellas que tienen
más de 200 km de recorrido

SELECT e.netapa as "Nº Etapa",
e.km as "KM",
e.salida as "Salida",
e.llegada as "Llegada"
FROM etapa e
WHERE e.km > 200;

6.Obtener el nombre de los ciclistas  que no hayan ganado ninguna etapa

SELECT c.nombre as "Ciclistas"
FROM ciclista c
LEFT JOIN etapa e
ON e.dorsal = c.dorsal
WHERE e.dorsal IS NULL;

7.Obtener el nombre del equipo y número de ciclistas tiene cada uno de ellos

SELECT e.nomeq as "Equipo",
COUNT(c.nomeq) as "Nº ciclistas"
FROM equipo e
INNER JOIN ciclista c
ON c.nomeq = e.nomeq
GROUP BY e.nomeq;

8.Selecciona el nombre de los puertos con una altura superior a la 
altura media de todos los puertos.

SELECT p.nompuerto as "Nombre_puerto",
p.altura
FROM puerto p
WHERE p.altura >= (SELECT AVG(p.altura)
			FROM puerto p);


9.Obtener el nº de etapa (atributo netapa) y la ciudad de salida de 
aquellas etapas que no tengan puertos de montaña.

SELECT e.netapa as "Nº etapa",
e.salida as "salida"
FROM etapa e
LEFT JOIN puerto p
ON p.netapa = e.netapa
WHERE p.netapa IS NULL;


10.Obtener los nombres de los ciclistas que pertenezcan al mismo equipo que Miguel Indurain

select c.nombre from ciclista c 
where c.nomeq=(select c.nomeq from ciclista c where c.nombre="Miguel Indurain");


11.¿Quien ganó la etapa más larga? Obten el nombre del ciclista y el lugar de salida y 
llegada de la etapa.

SELECT c.nombre as "Ciclista",
e.salida as "salida",
e.llegada as "llegada"
FROM ciclista c
INNER JOIN etapa e
ON e.dorsal = c.dorsal
WHERE e.km = (SELECT MAX(km)
			FROM etapa);

12.Obtener el nombre del puerto con una mayor altura. No puedes usar la clausula LIMIT.

SELECT p.nompuerto as "Puerto"
FROM puerto p
WHERE p.altura = (SELECT MAX(altura)
				FROM puerto);