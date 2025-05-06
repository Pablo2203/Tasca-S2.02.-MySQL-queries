-- Lista el nombre de todos los productos que hay en la mesa producto.
SELECT nombre FROM tienda.producto;

-- Lista los nombres y los precios de todos los productos de la mesa producto.
SELECT nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio*1.13 FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS nombre_de_producto, precio AS euros, precio*1.13 AS dolares FROM producto;

-- Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS nombres_en_mayusculas, precio FROM producto;

-- Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS nombres_en_minusculas, precio FROM producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) AS iniciales_mayusculas FROM fabricante;

-- Lista los nombres y los precios de todos los productos de la mesa producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM producto;

-- Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio,0) AS precio_truncado FROM producto;

-- Lista el código de los fabricantes que tienen productos en la mesa producto.
SELECT codigo_fabricante FROM producto;

-- Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

-- Devuelve una lista con las 5 primeras filas de la mesa fabricante.
SELECT * FROM fabricante LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3; 

-- Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT * FROM producto WHERE codigo_fabricante = 2;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
 
-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre; 

-- Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, precio, fabricante.nombre  FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio ASC LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, precio, fabricante.nombre  FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo"; 

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Crucial" AND precio > 200; 

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR "Hewlett-Packard" OR "Seagate" ; 


-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN  ("Asus","Hewlett-Packard","Seagate"); 

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT producto.nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%e";

-- Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%w%";

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar, por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180  ORDER BY p.precio DESC, p.nombre ASC;

-- Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo, f.nombre  FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre, p.nombre FROM producto p  RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo; 

-- Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre, p.nombre FROM producto p  RIGHT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.nombre IS NULL; 


-- Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto P JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo";

-- Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT p.*  FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND p.precio = (SELECT MAX(p2.precio)FROM producto p2, fabricante f2 WHERE p2.codigo_fabricante = f2.codigo AND f2.nombre = "Lenovo");

-- Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre ="Lenovo" ORDER BY p.precio DESC LIMIT 1;

-- Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre ="Hewlett-Packard" ORDER BY p.precio ASC LIMIT 1;

-- Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT p.*  FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND p.precio >= (SELECT MAX(p2.precio)FROM producto p2, fabricante f2 WHERE p2.codigo_fabricante = f2.codigo AND f2.nombre = "Lenovo");

-- Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT p.*  FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND p.precio > (SELECT MAX(p2.precio)FROM producto p2, fabricante f2 WHERE p2.codigo_fabricante = f2.codigo AND f2.nombre = "Asus");


















