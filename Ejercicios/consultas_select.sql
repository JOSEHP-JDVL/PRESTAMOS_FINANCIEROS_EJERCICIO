USE prestamos_financieros_ejercicio;
GO

--IGUALDAD SIMPLE "SELECCIONAR EL DNI, NOMBRE COMPLETO, Y EMAIL DE TODAS LAS PERSONAS NATURALES QUE SE LLAMEN CAMILA"
SELECT*FROM personas_naturales;

SELECT 

	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre completo',
	email

FROM personas_naturales
WHERE nombres='Camila';

-- ENCONTRAR FILAS QUE CONTIENEN UN VALOR COMO PARTE DE UNA CADENA.
-- SELECCIONAR TODOS LAS PERSONAS NATURALES CUYO APELLIDO PATERNO CONTENGAN LA CADENA DE "ez"


SELECT 

	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre completo',
	email

FROM personas_naturales
WHERE apellido_paterno LIKE ('%ez%');

-- LOS APELLIDOS PATERNOS QUE EMPIECEN CON "R"
SELECT 

	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre completo',
	email

FROM personas_naturales
WHERE apellido_paterno LIKE ('R%');

-- LOS APELLIDOS PATERNOS QUE TERMINEN CON "S"

SELECT 

	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre completo',
	email

FROM personas_naturales
WHERE apellido_paterno LIKE ('%S');

-- ENCONTRAR FILAS MEDIANTE UN OPERADOR DE COMPARACION
-- LISTA LOS CLIENTES CUYO ID SEA MAYOR A 50
SELECT*FROM clientes
WHERE id > 50;
-- MAYOR IGUAL A 50
SELECT*FROM clientes
WHERE id >= 50;

-- LISTA LOS CLIENTES CUYO ID SEA MENOR A 50
SELECT*FROM clientes
WHERE id < 50;
-- MENOR IGUAL A 50
SELECT*FROM clientes
WHERE id <= 50;

-- LISTAR LOS CLIENTES CUYO ID ESTE ENTRE 50 Y 70
SELECT*FROM clientes
WHERE id >= 50 AND id <= 70;

-- DE OTRA MANERA PARA ESCOGER RANGOS
SELECT*FROM clientes
WHERE id BETWEEN 50 AND 70;

-- SELECCIONAR TODOS LOS ID DIFERENTES DE 50
SELECT*FROM clientes
WHERE id !=50;

-- SELECCIONAR TODOS LOS TIPOS DE PERSONA DIFERENTES DE PERSONA NATURAL
SELECT*FROM clientes
WHERE tipo_persona != 'Persona_Natural';

-- ENCONTRAR FILAS QUE CUMPLAN CON CUALQUIERA DE LAS 3 CONDICIONES
-- SU ID SEA 1
-- SU TELEFONO SEA 987650002
-- SU DIRECCION SE UNA AVENIDA

SELECT*FROM personas_juridicas
WHERE id = 1 OR telefono ='987650002' OR direccion LIKE 'Av.%';

-- ENCONTRAR FILAS QUE CUMPLAN VARIAS FUNCIONES
-- QUE SU CODIGO SEA MAYOR A SUC006
-- QUE SU NO,BRE CONTENGA LA PALABRA SUCURSAL
-- QUE SU DIRECCION NO SEA UNA AVENIDA

SELECT*FROM sucursales
WHERE
	CAST(SUBSTRING(codigo, 4, LEN(codigo) - 3) AS INT) > 6 AND -- Extrae el n�mero del c�digo
	nombres LIKE 'SUCURSAL%' AND 
	direccion NOT LIKE 'AV%';

--ENCONTRAR FILAS QUE ESTEN EN UNA LISTA DE VALORES
SELECT*FROM personas_naturales
WHERE numero_documento IN ('12345678', '78901234','14151617','70334562345','70990128901');


--ENCONTRAR FILAS QUE NO ESTEN EN UNA LISTA DE VALORES
SELECT*FROM personas_naturales
WHERE numero_documento NOT IN ('12345678', '78901234','14151617','70334562345','70990128901');
