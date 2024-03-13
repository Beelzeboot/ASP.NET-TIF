Use master
go
CREATE DATABASE Empresa_Cliente
go
use Empresa_Cliente
Go

-- Creación de la tabla "Clientes"
CREATE TABLE Clientes (
    Legajo_Cliente INT IDENTITY (1,1),
    Nombre VARCHAR(255),
	Contraseña varchar(10),
    Dirección VARCHAR(255),
    Teléfono VARCHAR(15),
    Correo VARCHAR(255),
    Fecha_nacimiento DATE,
	Estado bit default 0,
	CONSTRAINT PK_Clientes PRIMARY KEY (Legajo_Cliente)
);

-- Creación de la tabla "Admins"
CREATE TABLE Admins (
	Legajo_Admin int IDENTITY(1,1),
	Nombre VARCHAR(255),
	Contraseña varchar(10),
	CONSTRAINT PK_Admins PRIMARY KEY (Legajo_Admin)
);

-- Creación de la tabla "Producto"
CREATE TABLE Producto (
    Legajo_Producto INT IDENTITY (1,1),
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    Descripción TEXT,
	Estado bit default 0,
	CONSTRAINT PK_Producto PRIMARY KEY (Legajo_Producto)
);

-- Creación de la tabla "Compra"
CREATE TABLE Compra (
    Legajo_Compra INT IDENTITY (1,1),
    Fecha DATE,
    Cantidad INT,
    Legajo_Producto INT,
	CONSTRAINT PK_Compra PRIMARY KEY (Legajo_Compra),
    FOREIGN KEY (Legajo_Producto) REFERENCES Producto(Legajo_Producto)
);

-- Creación de la tabla "CompraXCliente"
CREATE TABLE CompraXCliente (
    Legajo_Compra INT,
    Legajo_Cliente INT,
    CONSTRAINT PK_CompraXCliente PRIMARY KEY (Legajo_Compra, Legajo_Cliente),
    FOREIGN KEY (Legajo_Compra) REFERENCES Compra(Legajo_Compra),
    FOREIGN KEY (Legajo_Cliente) REFERENCES Clientes(Legajo_Cliente)
);

-- Creación de la tabla "Preferencias"
CREATE TABLE Preferencias (
    Legajo_Preferencia INT IDENTITY (1,1),
    Producto_Preferido VARCHAR(255),
    Interes_Categoria VARCHAR(255),
    Interes_Actividad VARCHAR(255),
    Interes_Comida VARCHAR(25),
    Estado_Cliente bit default 0,
    Legajo_Cliente INT,
	CONSTRAINT PK_Preferencias PRIMARY KEY (Legajo_Preferencia),
    FOREIGN KEY (Legajo_Cliente) REFERENCES Clientes(Legajo_Cliente)
);

-- Creación de la tabla "Interaccion"
CREATE TABLE Interaccion (
    Legajo_Interaccion INT IDENTITY (1,1),
    Fecha DATE,
    Tipo VARCHAR(255),
    Motivo VARCHAR(255),
    Descripción TEXT,
    Legajo_Cliente INT,
	CONSTRAINT PK_Interaccion PRIMARY KEY (Legajo_Interaccion),
    FOREIGN KEY (Legajo_Cliente) REFERENCES Clientes(Legajo_Cliente)
);

-- Creación de la tabla "Seguimiento_Marketing"
CREATE TABLE Seguimiento_Marketing (
    Legajo_Seguimiento INT IDENTITY (1,1),
    Campaña VARCHAR(255),
    Tipo VARCHAR(255),
    Fecha DATE,
    Legajo_Cliente INT,
	CONSTRAINT PK_Seguimiento_Marketing PRIMARY KEY (Legajo_Seguimiento),
    FOREIGN KEY (Legajo_Cliente) REFERENCES Clientes(Legajo_Cliente)
);

-- Creación de la tabla "Comentario"
CREATE TABLE Comentario (
    Legajo_Nota INT IDENTITY (1,1),
    Fecha DATE,
    Comentario TEXT,
    Legajo_Cliente INT,
	CONSTRAINT PK_Comentario PRIMARY KEY (Legajo_Nota),
    FOREIGN KEY (Legajo_Cliente) REFERENCES Clientes(Legajo_Cliente)
);

/*----------------REGISTROS--------------------*/
-- Registros para la tabla "Clientes"
INSERT INTO Clientes (Nombre, Contraseña, Dirección, Teléfono, Correo, Fecha_nacimiento, Estado)
VALUES ('Jose Pérez', 'Juan123', 'Calle Principal 123', '12346789', 'juan@example.com', '1990-05-15', 1),
       ('Juan González', 'Maria456', 'Avenida Central 456', '98764321', 'maria@example.com', '1988-12-01', 0),
	   ('Maria Martinez', 'Jose325', 'Avenida Central 753', '87654321', 'jose@example.com', '2000-12-14', 0);
	
-- Registros para la tabla "Admins"
INSERT INTO Admins (Nombre, Contraseña)
VALUES ('Admin1', 'Admin123'),
       ('Admin2', 'Admin456'),
	   ('Admin3', 'Admin673');
	
	-- Registros para la tabla "Producto"
INSERT INTO Producto (Nombre, Precio, Descripción, Estado)
VALUES ('Pasto orgánico', 29.99, 'Pasto artificial plástico ', 1),
       ('Serie', 19.99, 'Serie de ciencia ficción', 1),
	   ('Moto', 70.99, ' Chevrolet ultimo modelo', 0);
	   
	   --select*from Producto


-- Registros para la tabla "Compra"
INSERT INTO Compra (Fecha, Cantidad, Legajo_Producto)
VALUES ('2023-06-03', 2, 15),
       ('2023-06-03', 4, 16),
       ('2023-03-04', 1, 17),
	   ('2023-06-15', 2, 18),
       ('2023-06-15', 4, 19),
       ('2023-03-04', 1, 20);
	 

-- Registros para la tabla "CompraXCliente"
INSERT INTO CompraXCliente (Legajo_Compra, Legajo_Cliente)
VALUES (5, 9),
       (6, 9),
	   (7, 10),
       (8, 11),
	   (9, 1),
       (4, 1);


-- Registros para la tabla "Preferencias"
INSERT INTO Preferencias (Producto_Preferido, Interes_Categoria, Interes_Actividad, Interes_Comida, Estado_Cliente, Legajo_Cliente)
VALUES ('Peluca', 'Moda', 'Deporte', 'Churrasco y papas', 1, 9),
       ('Pelicula', 'Entretenimiento', 'Ocio', 'Sushi', 0, 10),
	   ('Moto', 'Automotriz', 'Mecanica', 'Fideos', 0, 11);

-- Registros para la tabla "Interaccion"
INSERT INTO Interaccion (Fecha, Tipo, Motivo, Descripción, Legajo_Cliente)
VALUES ('2023-06-12', 'Llamada', 'Consulta', 'Cliente realizó una consulta sobre el producto', 10),
       ('2023-06-9', 'Correo electrónico', 'Soporte técnico', 'Cliente solicita ayuda con un problema técnico', 11),
	   ('2023-06-26', 'Correo', 'Soporte técnico', 'Problemas para realizar la compra', 9);

-- Registros para la tabla "Seguimiento_Marketing"
INSERT INTO Seguimiento_Marketing (Campaña, Tipo, Fecha, Legajo_Cliente)
VALUES ('Oferta Verano', 'Correo electrónico', '2023-06-17', 11),
       ('Promoción Navidad', 'Publicidad en redes sociales', '2023-06-19', 9),
	   ('Promoción Navidad', 'folleto', '2023-06-22', 10);

-- Registros para la tabla "Comentario"
INSERT INTO Comentario (Fecha, Comentario, Legajo_Cliente)
VALUES ('2023-06-29', 'Excelente servicio al cliente', 9),
       ('2023-06-13', 'Producto de alta calidad', 10),
	   ('2023-06-9', 'Pesimo servicio', 11);


/*----------------PROCEDIMIENTOS ALMACENADOS--------------------*/
Use Empresa_Cliente
Go

Create procedure spAgregarCliente
(
@Nombre varchar (255),
@Contraseña varchar(10),
@Dirección varchar(255),
@Teléfono varchar(15),
@Correo varchar (255),
@Fecha_nacimiento DATE
)
AS
INSERT INTO Clientes
(
Nombre,
Contraseña,
Dirección,
Teléfono,
Correo,
Fecha_nacimiento
)
VALUES
(
@Nombre,
@Contraseña,
@Dirección,
@Teléfono,
@Correo,
@Fecha_nacimiento
)
RETURN
GO

Create procedure spAgregarProducto
(
@Nombre varchar (255),
@Precio decimal(10, 2),
@Descripción text
)
AS
INSERT INTO Producto
(
Nombre,
Precio,
Descripción
)
VALUES
(
@Nombre,
@Precio,
@Descripción
)
RETURN
GO

Create procedure spActualizarProducto
(
@Legajo_Producto int,
@Nombre varchar (255),
@Precio decimal(10, 2),
@Descripción text,
@Estado bit
)
AS
UPDATE Producto
Set Nombre=@Nombre,Precio=@Precio,Descripción=@Descripción,Estado=@Estado
where Legajo_Producto=@Legajo_Producto
RETURN
GO

Create procedure spEliminarProducto
(
@Legajo_Producto int
)
AS
DELETE from Producto
where Legajo_Producto=@Legajo_Producto
RETURN
GO