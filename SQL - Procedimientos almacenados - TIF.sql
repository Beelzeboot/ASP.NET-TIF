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