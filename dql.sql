-- 1. Procedimiento para insertar miembros

DELIMITER ;

CALL INSERTAR_MIEMBROS("ADRIAN", "ORTIZ", "DXNIEL732@GMAIL.COM", "3173109599", "2023-10-15", 1);

SELECT * FROM MIEMBROS;

-- 2. CREAR UN PROCEDIMIENTO PARA ACTUALIZAR EL PRECIO DE UN PRODUCTO

DELIMITER //

CREATE PROCEDURE ACTUALIZAR_PRECIO(IN ID_PRODUCTO INT, IN NUEVO_PRECIO DECIMAL(10,2))
BEGIN
	UPDATE
		PRODUCTOS_DEPORTIVOS
	SET
		PRODUCTOS_DEPORTIVOS.PRECIO = NUEVO_PRECIO
	WHERE
		PRODUCTOS_DEPORTIVOS.ID_PRODUCTO_DEPORTIVO = ID_PRODUCTO;

END //

DELIMITER ;

SELECT * FROM PRODUCTOS_DEPORTIVOS WHERE PRODUCTOS_DEPORTIVOS.ID_PRODUCTO_DEPORTIVO = 2;

CALL ACTUALIZAR_PRECIO(2, 50.26);

-- 3. CREAR UN PROCEDIMIENTO PARA ELIMINAR UN MIEMBRO

DELIMITER //
CREATE PROCEDURE ELIMINAR_MIEMBRO(IN ID_MIEMBRO INT)
BEGIN
	DELETE FROM
		MIEMBROS
	WHERE
		MIEMBROS.ID_MIEMBRO = ID_MIEMBRO;
END //
DELIMITER ;

SELECT * FROM MIEMBROS;

CALL ELIMINAR_MIEMBRO(11);

-- 4. CREAR UN PROCEDIMIENTO PARA CONSULTAR TODAS LAS CLASES GRUPALES DE UN ENTRENADOR

DELIMITER //

CREATE PROCEDURE TODAS_CLASES_ENTRENADOR(IN ID_ENTRENADOR INT)
BEGIN
	SELECT * FROM CLASES_GRUPALES WHERE CLASES_GRUPALES.ID_ENTRENADOR = ID_ENTRENADOR;
END //

DELIMITER ;

CALL TODAS_CLASES_ENTRENADOR(1);

-- 5. CREAR UN PROCEDIMIENTO PARA CONSULTAR VENTAS POR FECHA
DELIMITER //
CREATE PROCEDURE VENTAS_POR_FECHA(IN FECHA_VENTA DATE)
BEGIN
	SELECT
		VENTAS.ID_VENTA,
        DETALLES_VENTAS.ID_PRODUCTO,
        PRODUCTOS_DEPORTIVOS.NOMBRE,
        DETALLES_VENTAS.CANTIDAD,
        VENTAS.FECHA_VENTA
	FROM 
		DETALLES_VENTAS
	JOIN
		VENTAS ON VENTAS.ID_VENTA = DETALLES_VENTAS.ID_VENTA
	JOIN
		PRODUCTOS_DEPORTIVOS ON PRODUCTOS_DEPORTIVOS.ID_PRODUCTO_DEPORTIVO = DETALLES_VENTAS.ID_PRODUCTO
	WHERE
		VENTAS.FECHA_VENTA = FECHA_VENTA;
		
END //
DELIMITER ;

CALL VENTAS_POR_FECHA("2024-10-15");

-- 6. CALCULAR EL TOTAL DE VENTAS EN UNA FECHA ESPECÍFICA
DELIMITER //
CREATE PROCEDURE TOTAL_VENTAS_POR_FECHA(IN FECHA DATE, OUT TOTAL INT)
BEGIN
	SELECT COUNT(*) INTO TOTAL 
    FROM 
		VENTAS 
	WHERE 
		VENTAS.FECHA_VENTA = FECHA;
END //
DELIMITER ;

SET @TOTAL_VENTAS = 0;
CALL TOTAL_VENTAS_POR_FECHA("2024-10-15", @TOTAL_VENTAS);
SELECT @TOTAL_VENTAS AS TOTAL_VENTAS;

-- 7. MOSTRAR TODOS LOS MIEMBROS QUE TIENEN UNA SUSCRIPCIÓN ANUAL

DELIMITER //

CREATE PROCEDURE MIEMBROS_ANUALES()
BEGIN
	SELECT
		MIEMBROS.NOMBRES,
        MIEMBROS.APELLIDOS,
        SUSCRIPCIONES.DURACION
	FROM
		MIEMBROS
	JOIN
		SUSCRIPCIONES ON SUSCRIPCIONES.ID_SUSCRIPCION = MIEMBROS.ID_SUSCRIPCION
	WHERE
		SUSCRIPCIONES.DURACION = "ANUAL";
END//

DELIMITER ;

CALL MIEMBROS_ANUALES();

-- 8. PROCEDIMIENTO PARA LISTAR PRODUCTOS DE UNA CATEGORÍA ESPECÍFICA:

DELIMITER //

CREATE PROCEDURE LISTAR_POR_CATEGORIA(IN CATEGORIA VARCHAR(100))
BEGIN
	SELECT 
		PRODUCTOS_DEPORTIVOS.NOMBRE,
        PRODUCTOS_DEPORTIVOS.CATEGORIA,
        PRODUCTOS_DEPORTIVOS.PRECIO
	FROM
		PRODUCTOS_DEPORTIVOS
	WHERE
		PRODUCTOS_DEPORTIVOS.CATEGORIA = CATEGORIA;
END //

DELIMITER ;

CALL LISTAR_POR_CATEGORIA("SUPLEMENTOS");

-- 9. PROCEDIMIENTO PARA CONTAR EL TOTAL DE CLASES GRUPALES DE UN TIPO ESPECÍFICO

DELIMITER //

CREATE PROCEDURE TOTAL_CLASES(IN ID_CLASE INT, OUT TOTAL INT)
BEGIN
	SELECT
		COUNT(*) INTO TOTAL FROM CLASES_GRUPALES
	JOIN
		TIPO_CLASES ON TIPO_CLASES.ID_TIPO_CLASE = CLASES_GRUPALES.ID_TIPO_CLASE
	WHERE
		CLASES_GRUPALES.ID_TIPO_CLASE = ID_CLASE;
		
END //

DELIMITER ;
SET @TOTAL_CLASES_GRUPALES = 0;
CALL TOTAL_CLASES(3, @TOTAL_CLASES_GRUPALES);
SELECT @TOTAL_CLASES_GRUPALES AS TOTAL;

-- 10. PROCEDIMIENTO PARA CALCULAR EL TOTAL DE STOCK DE PRODUCTOS DE UNA CATEGORÍA:

DELIMITER //

CREATE PROCEDURE TOTAL_STOCK_CATEGORIA(IN CATEGORIA VARCHAR(100), OUT TOTAL_STOCK INT)
BEGIN
	SELECT
		SUM(STOCK_DISPONIBLE) INTO TOTAL_STOCK
        FROM PRODUCTOS_DEPORTIVOS
        WHERE PRODUCTOS_DEPORTIVOS.CATEGORIA = CATEGORIA;
	
END //

DELIMITER ;

SET @TOTAL_STOCK = 0;
CALL TOTAL_STOCK_CATEGORIA("ROPA", @TOTAL_STOCK);
SELECT @TOTAL_STOCK AS SUMA_TOTAL;