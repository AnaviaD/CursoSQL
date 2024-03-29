-- =================================================================================================================
DROP DATABASE IF EXISTS tiendaexerc;
CREATE DATABASE tiendaexerc CHARACTER SET utf8mb4;
USE tiendaexerc;

CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
-- =================================================================================================================

--1.1.3 Consultas sobre una tabla
--Lista el nombre de todos los productos que hay en la tabla producto.

SELECT nombre FROM tiendaexerc.dbo.producto

--Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT nombre, precio FROM tiendaexerc.dbo.producto

--Lista todas las columnas de la tabla producto.

SELECT * FROM tiendaexerc.dbo.producto

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT nombre, 
	CONCAT((CONVERT(FLOAT, precio)* 19.14),'  USD'), 
	CONCAT((CONVERT(FLOAT, precio)* 20.54),'  EUR') 
		FROM tiendaexerc.dbo.producto

--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT nombre AS NombreDeProducto, 
	CONCAT((CONVERT(FLOAT, precio)* 19.14),'  USD') AS Dolares, 
	CONCAT((CONVERT(FLOAT, precio)* 20.54),'  EUR') AS Euros
		FROM tiendaexerc.dbo.producto

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(nombre) AS NombreDeProducto, 
	CONCAT((CONVERT(FLOAT, precio)* 19.14),'  USD') AS Dolares, 
	CONCAT((CONVERT(FLOAT, precio)* 20.54),'  EUR') AS Euros
		FROM tiendaexerc.dbo.producto

--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(nombre) AS NombreDeProducto, 
	CONCAT((CONVERT(FLOAT, precio)* 19.14),'  USD') AS Dolares, 
	CONCAT((CONVERT(FLOAT, precio)* 20.54),'  EUR') AS Euros
		FROM tiendaexerc.dbo.producto

--Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT nombre, LEFT(nombre, 2), SUBSTRING(nombre, 1, 2) 
	FROM tiendaexerc.dbo.fabricante

--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT nombre, ROUND(precio, 1) FROM tiendaexerc.dbo.producto

--Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre, ROUND(precio, 1) FROM tiendaexerc.dbo.producto

--Lista el identificador de los fabricantes que tienen productos en la tabla producto.

SELECT P.id, F.id, P.id_fabricante
	FROM tiendaexerc.dbo.producto AS P
	INNER JOIN tiendaexerc.dbo.fabricante AS F
	  ON P.id_fabricante = F.id

--Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.

SELECT DISTINCT(F.id)
	FROM tiendaexerc.dbo.producto AS P
	INNER JOIN tiendaexerc.dbo.fabricante AS F
		ON P.id_fabricante = F.id 

--Lista los nombres de los fabricantes ordenados de forma ascendente.

SELECT nombre FROM tiendaexerc.dbo.fabricante ORDER BY nombre ASC

--Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre FROM tiendaexerc.dbo.fabricante ORDER BY nombre DESC

--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre, precio FROM tiendaexerc.dbo.producto ORDER BY nombre, precio ASC

--Devuelve una lista con las 5 primeras filas de la tabla fabricante.

SELECT * FROM tiendaexerc.dbo.fabricante

--Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.



--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT nombre, precio FROM tiendaexerc.dbo.producto ORDER BY precio LIMIT 1 

--Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

SELECT TOP 1 nombre, precio FROM tiendaexerc.dbo.producto ORDER BY precio DESC

--Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.

SELECT nombre FROM tiendaexerc.dbo.producto WHERE id_fabricante = 2

--Lista el nombre de los productos que tienen un precio menor o igual a 120€.

SELECT nombre FROM tiendaexerc.dbo.producto WHERE precio < 120

--Lista el nombre de los productos que tienen un precio mayor o igual a 400€.

SELECT nombre FROM tiendaexerc.dbo.producto WHERE precio > 400

--Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.

SELECT nombre FROM tiendaexerc.dbo.producto WHERE precio < 400

--Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT * FROM tiendaexerc.dbo.producto WHERE precio BETWEEN 80 AND 300

--Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT * FROM tiendaexerc.dbo.producto WHERE precio BETWEEN 60 AND 200

--Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.

--Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.

--Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.

--Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.

--Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.

--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.

--Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.

--Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.

--Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.

--Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
