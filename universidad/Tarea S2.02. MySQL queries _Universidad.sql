-- Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1,apellido2, nombre;

-- Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = "alumno" AND telefono IS NULL;

-- Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona WHERE tipo = "alumno" AND EXTRACT(YEAR FROM fecha_nacimiento) = 1999;

-- Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%K";

-- Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT apellido1, apellido2, p.nombre, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON d.id = pr.id_departamento ORDER BY apellido1, apellido2, p.nombre;

-- Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre, anyo_inicio, anyo_fin FROM asignatura a JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar JOIN persona p ON p.id = asma.id_alumno  WHERE p.nif = '26902806M';

-- Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT d.nombre FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id = 4; 

-- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN asignatura a ON a.id = asma.id_asignatura JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE ce.id = 5; 

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.


-- Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también debe mostrar a aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT apellido1, apellido2, p.nombre, d.nombre AS departamento_nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento ORDER BY d.nombre, apellido1, apellido2, p.nombre;

-- Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT apellido1, apellido2, p.nombre, d.nombre AS departamento_nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento  WHERE d.nombre IS NULL;

-- Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT apellido1, apellido2, p.nombre, d.nombre AS departamento_nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN departamento d ON d.id = pr.id_departamento  WHERE p.nombre IS NULL;

-- Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT apellido1, apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE p.tipo = "profesor" AND a.nombre IS NULL;

-- Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT a.* FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor LEFT JOIN persona p ON p.id = pr.id_profesor WHERE pr.id_profesor IS NULL;

-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT DISTINCT d.* FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- Consultas resumen:


-- Devuelve el número total de alumnos existentes.
SELECT COUNT(id) AS numero_total_alumnos FROM persona WHERE tipo = "alumno";

-- Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(id) AS alumnos_1999 FROM persona WHERE tipo = "alumno" AND EXTRACT(YEAR FROM fecha_nacimiento) = 1999;

-- Calcula cuántos profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a menor por el número de profesores/as.
SELECT COUNT(p.id) AS profesores_por_departamento, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.id, d.nombre ORDER BY profesores_por_departamento DESC;

-- Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también deben aparecer en el listado.
SELECT COUNT(p.id) AS profesores_por_departamento, d.nombre AS departamento FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor RIGHT JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.id, d.nombre;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT COUNT(a.id) AS numero_de_asignaturas, g.nombre FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id, g.nombre ORDER BY numero_de_asignaturas DESC;

-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT COUNT(a.id) AS numero_de_asignaturas, g.nombre FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id, g.nombre HAVING COUNT(a.id) > 40;

-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT SUM(a.creditos) AS numero_total_de_creditos, g.nombre, a.tipo FROM grado g  JOIN asignatura a ON a.id_grado = g.id GROUP BY g.id, g.nombre, a.tipo; 

-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT COUNT(p.id) AS numero_total_de_alumnos, ce.anyo_inicio FROM persona p JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = p.id JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id JOIN asignatura a ON a.id = asma.id_asignatura GROUP BY ce.id, ce.anyo_inicio;

-- Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT COUNT(a.id) AS numero_de_asignaturas_por_profesor, p.id, p.nombre, p.apellido1, p.apellido2 FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor LEFT JOIN persona p ON p.id = pr.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY numero_de_asignaturas_por_profesor DESC;

-- Devuelve todos los datos del alumno/a más joven.
SELECT * FROM persona WHERE tipo = "alumno" AND fecha_nacimiento = (SELECT MAX(fecha_nacimiento)FROM persona WHERE tipo = "alumno");

-- Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT CONCAT (p.nombre," ",apellido1," ", apellido2) AS profesor, d.nombre AS departamento, a.nombre AS asignatura FROM persona p JOIN profesor pr ON  p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor;












