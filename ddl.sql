CREATE DATABASE IF NOT EXISTS global_gym;

USE global_gym;

CREATE TABLE IF NOT EXISTS tipo_clases (
    id_tipo_clase INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_contacto VARCHAR(100) NOT NULL,
    nombre_empresa VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    rol ENUM('entrenador', 'recepcionista', 'gerente') NOT NULL,
    turno ENUM('diurno', 'nocturno')
);

CREATE TABLE IF NOT EXISTS entrenadores (
    id_entrenador INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS recepcionistas (
    id_recepcionista INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS gerentes (
    id_gerente INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE IF NOT EXISTS suscripciones (
    id_suscripcion INT PRIMARY KEY AUTO_INCREMENT,
    duracion ENUM('mensual', 'trimestral', 'anual') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_vencimiento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS miembros (
    id_miembro INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(100) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    id_suscripcion INT,
    FOREIGN KEY (id_suscripcion) REFERENCES suscripciones(id_suscripcion)
);

CREATE TABLE IF NOT EXISTS clases_grupales (
    id_clases_grupales INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    dia ENUM('lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado') NOT NULL,
    horario TIME NOT NULL,
    id_tipo_clase INT,
    id_entrenador INT,
    max_miembros INT NOT NULL,
    FOREIGN KEY (id_entrenador) REFERENCES entrenadores(id_entrenador),
    FOREIGN KEY (id_tipo_clase) REFERENCES tipo_clases(id_tipo_clase)
);

CREATE TABLE IF NOT EXISTS asistencia_clases (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_miembro INT,
    id_clases_grupales INT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_miembro) REFERENCES miembros(id_miembro),
    FOREIGN KEY (id_clases_grupales) REFERENCES clases_grupales(id_clases_grupales)
);

CREATE TABLE IF NOT EXISTS productos_deportivos (
    id_producto_deportivo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    categoria ENUM('ropa', 'equipo', 'suplementos', 'accesorios') NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock_disponible INT NOT NULL,
    marca VARCHAR(100) NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS ropa (
    id_ropa INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    talla ENUM('xs', 's', 'm', 'l', 'xl') NOT NULL,
    color VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS equipo (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    material VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS suplementos (
    id_suplemento INT PRIMARY KEY AUTO_INCREMENT,
    fecha_vencimiento DATE NOT NULL,
    tamaño ENUM('grande', 'mediano', 'pequeño') NOT NULL
);

CREATE TABLE IF NOT EXISTS accesorios (
    id_accesorio INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(100),
    material VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ordenes_compra (
    id_orden_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT,
    fecha_orden DATE NOT NULL,
    estado ENUM('recibido', 'pendiente') NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

CREATE TABLE IF NOT EXISTS detalles_ordenes_compra (
    id_detalles_ordenes_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    id_orden_compra INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos_deportivos(id_producto_deportivo),
    FOREIGN KEY (id_orden_compra) REFERENCES ordenes_compra(id_orden_compra)
);

CREATE TABLE IF NOT EXISTS ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha_venta DATE NOT NULL,
    id_cliente INT,
    id_recepcionista INT,
    tipo_venta ENUM('en linea', 'presencial') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES miembros(id_miembro),
    FOREIGN KEY (id_recepcionista) REFERENCES recepcionistas(id_recepcionista)
);

CREATE TABLE IF NOT EXISTS detalles_ventas (
    id_detalles_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos_deportivos(id_producto_deportivo)
);