INSERT INTO suscripciones (duracion, precio, fecha_vencimiento) VALUES
('mensual', 30.00, '2024-11-14'),
('trimestral', 80.00, '2025-02-14'),
('anual', 300.00, '2025-10-14');

INSERT INTO miembros (nombres, apellidos, correo, telefono, fecha_inscripcion, id_suscripcion) VALUES
('Sofía', 'Rodríguez', 'sofia.rodriguez@email.com', '555-2345', '2024-10-12', 2),
('Carlos', 'Fernández', 'carlos.fernandez@email.com', '555-9876', '2024-10-14', 1),
('Lucía', 'Hernández', 'lucia.hernandez@email.com', '555-3456', '2024-10-16', 3),
('Pedro', 'García', 'pedro.garcia@email.com', '555-6543', '2024-10-18', 2),
('Laura', 'Ruiz', 'laura.ruiz@email.com', '555-7654', '2024-10-20', 1),
('Diego', 'Ortega', 'diego.ortega@email.com', '555-4321', '2024-10-22', 3),
('Elena', 'Navarro', 'elena.navarro@email.com', '555-5677', '2024-10-24', 2),
('Pablo', 'Vega', 'pablo.vega@email.com', '555-8769', '2024-10-26', 1),
('Valeria', 'Cortés', 'valeria.cortes@email.com', '555-7890', '2024-10-28', 2),
('Andrés', 'Morales', 'andres.morales@email.com', '555-6547', '2024-10-30', 3);

INSERT INTO empleados (nombres, apellidos, fecha_contratacion, salario, rol) VALUES
('Patricia', 'Mendoza', '2024-04-15', 1800.00, 'entrenador'),
('Jorge', 'Iglesias', '2024-05-10', 1600.00, 'recepcionista'),
('Sandra', 'Núñez', '2024-06-20', 2800.00, 'gerente'),
('Raúl', 'Pérez', '2024-07-15', 2200.00, 'entrenador'),
('Claudia', 'Gutiérrez', '2024-08-01', 1400.00, 'recepcionista'),
('David', 'Ramírez', '2024-09-05', 2700.00, 'gerente'),
('Julia', 'Moreno', '2024-10-03', 1900.00, 'entrenador'),
('Fernando', 'Suárez', '2024-10-08', 1700.00, 'recepcionista'),
('Isabel', 'Paredes', '2024-10-11', 2600.00, 'gerente'),
('Álvaro', 'Santos', '2024-10-15', 2000.00, 'entrenador');

INSERT INTO entrenadores (id_empleado) VALUES
(1),
(4),
(7),
(10);

INSERT INTO recepcionistas (id_empleado) VALUES
(2),
(5),
(8);

INSERT INTO gerentes (id_empleado) VALUES
(3),
(6),
(9);

INSERT INTO tipo_clases (nombre) VALUES
('Yoga'),
('Spinning'),
('CrossFit');

INSERT INTO clases_grupales (nombre, dia, horario, id_tipo_clase, id_entrenador, max_miembros) VALUES
('Clase de Yoga', 'lunes', '09:00:00', 1, 1, 15),
('Clase de Spinning', 'martes', '18:00:00', 2, 1, 20),
('Clase de CrossFit', 'miércoles', '07:00:00', 3, 1, 10);

INSERT INTO proveedores (nombre_contacto, nombre_empresa, telefono, direccion) VALUES
('Laura Rojas', 'Deportes S.A.', '555-2345', 'Av. de los Deportes 123'),
('Andrés Romero', 'Fitness Supplies', '555-6789', 'Calle del Fitness 456'),
('Elena Gómez', 'NutriShop', '555-9876', 'Plaza de Suplementos 789');

INSERT INTO productos_deportivos (nombre, descripcion, categoria, precio, stock_disponible, marca, id_proveedor) VALUES
('Cuerda para Saltar', 'Cuerda de velocidad ajustable para entrenamiento cardiovascular', 'equipo', 10.00, 200, 'JumpFit', 1),
('Guantes de Boxeo', 'Guantes de alta calidad para entrenamiento y combate', 'ropa', 35.00, 75, 'BoxingPro', 2),
('Colchoneta de Yoga', 'Colchoneta de espuma de alta densidad', 'accesorios', 20.00, 60, 'YogaComfort', 1),
('Pesas Rusas 10kg', 'Pesa rusa para entrenamiento de fuerza', 'equipo', 50.00, 40, 'StrongFit', 2),
('Batido de Proteínas', 'Batido proteico listo para tomar', 'suplementos', 30.00, 120, 'NutriShake', 3),
('Camiseta Running', 'Camiseta ligera y transpirable para correr', 'ropa', 20.00, 80, 'RunGear', 1),
('Banda Elástica', 'Banda de resistencia para ejercicios de fuerza', 'accesorios', 15.00, 150, 'FlexBand', 2),
('Bicicleta de Montaña', 'Bicicleta para terrenos difíciles', 'equipo', 300.00, 20, 'MountainPro', 1),
('Vitaminas Deportivas', 'Vitaminas para mejorar el rendimiento deportivo', 'suplementos', 25.00, 90, 'SportVita', 3),
('Zapatillas de Running', 'Zapatillas ligeras para carrera de larga distancia', 'ropa', 60.00, 55, 'SpeedRun', 2);

INSERT INTO ordenes_compra (id_proveedor, fecha_orden, estado) VALUES
(1, '2024-10-05', 'pendiente'),
(2, '2024-10-10', 'recibido'),
(3, '2024-10-12', 'recibido'),
(1, '2024-10-15', 'pendiente'),
(2, '2024-10-18', 'recibido'),
(3, '2024-10-20', 'recibido');

INSERT INTO detalles_ordenes_compra (id_producto, id_orden_compra, cantidad) VALUES
(1, 1, 20),
(2, 2, 10),
(3, 3, 15),
(4, 1, 25),
(5, 2, 30),
(6, 3, 40),
(7, 4, 50),  
(8, 5, 20),
(9, 6, 15),
(10, 4, 35);

INSERT INTO ventas (fecha_venta, id_cliente, id_recepcionista, tipo_venta) VALUES
('2024-10-15', 1, 2, 'presencial'), 
('2024-10-16', 2, 2, 'en linea'),
('2024-10-17', 3, 2, 'presencial'),
('2024-10-18', 4, 1, 'en linea'),
('2024-10-19', 5, 1, 'presencial'),
('2024-10-20', 6, 3, 'en linea');

INSERT INTO detalles_ventas (id_venta, id_producto, cantidad) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 2, 3),
(4, 4, 2),
(5, 5, 1),
(6, 6, 4),
(1, 7, 1),
(2, 8, 2),
(3, 9, 3), 
(4, 10, 1);
