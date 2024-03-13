Use Empresa_Cliente
Go

Create procedure spAgregarCliente
(
@Nombre varchar (255),
@Contrase�a varchar(10),
@Direcci�n varchar(255),
@Tel�fono varchar(15),
@Correo varchar (255),
@Fecha_nacimiento DATE
)
AS
INSERT INTO Clientes
(
Nombre,
Contrase�a,
Direcci�n,
Tel�fono,
Correo,
Fecha_nacimiento
)
VALUES
(
@Nombre,
@Contrase�a,
@Direcci�n,
@Tel�fono,
@Correo,
@Fecha_nacimiento
)
RETURN
GO

Create procedure spAgregarProducto
(
@Nombre varchar (255),
@Precio decimal(10, 2),
@Descripci�n text
)
AS
INSERT INTO Producto
(
Nombre,
Precio,
Descripci�n
)
VALUES
(
@Nombre,
@Precio,
@Descripci�n
)
RETURN
GO

Create procedure spActualizarProducto
(
@Legajo_Producto int,
@Nombre varchar (255),
@Precio decimal(10, 2),
@Descripci�n text,
@Estado bit
)
AS
UPDATE Producto
Set Nombre=@Nombre,Precio=@Precio,Descripci�n=@Descripci�n,Estado=@Estado
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