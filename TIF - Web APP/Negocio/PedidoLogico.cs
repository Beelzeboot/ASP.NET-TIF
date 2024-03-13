using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAO;
using Entidades;


namespace Negocio
{
    public class PedidoLogico
    {
        private DAOClientes daoCliente = new DAOClientes();
        private DAOAdmins daoAdmin = new DAOAdmins();
        private DAOProductos daoProd = new DAOProductos();
        private AccesoDatos ad = new AccesoDatos();


        public DataTable obtenerClientes()
        {
            return daoCliente.obtenerTabla();

        }
        public DataTable obtenerAdmins()
        {
            return daoCliente.obtenerTabla();

        }
        public bool esCliente(Clientes cliente)
        {
            return daoCliente.existeCliente(cliente);
        }
        public bool esAdmin(Admins admin)
        {
            return daoAdmin.existeAdmin(admin);
        }
        public Clientes buscarCliente(Clientes cli)
        {
            return daoCliente.obtenerCliente(cli);
        }
        public Clientes buscarCliente_SOLO_x_legajo(Clientes cli)
        {
            return daoCliente.obtenerCliente_SOLO_x_legajo(cli);
        }
        public Admins buscarCliente(Admins adm)
        {
            return daoAdmin.obtenerAdmin(adm);
        }
        
        public int nuevoCliente(Clientes cli)
        {
           return daoCliente.nuevoCliente(cli);
        }

        public int agregarProducto(Producto prod)
        {
            return daoProd.nuevoProducto(prod);
        }

        public bool existeProducto(Producto prod)
        {
            return daoProd.existeProducto(prod);
        }
       public DataTable devolverdataset(string nombre_tabla,string consulta)
        {
            return ad.abrirTabla(nombre_tabla, consulta);

        }

        public DataTable ObtenerdatatableCliente(string legajo_cliente)
        {
            string consulta = "Select Legajo_Cliente as [Legajo Cliente],Nombre,Dirección,Teléfono,Correo from clientes where Legajo_Cliente = '" + legajo_cliente+"'";
            return ad.abrirTabla("ClientexCompra", consulta);
        }
        public string legajodeCompra_a_legajoCliente(string legajo_compra)
        {

            string consulta = "Select Legajo_Cliente from CompraXCliente Where Legajo_Compra = '"+legajo_compra+"'";
            return ad.obtenerLegajodeConsulta(consulta);
        }
        public DataTable obtenerTabla_de_ProductoEspecifico(string legajo_prod)
        {
            return daoProd.obtenerTabla_de_Legajo(legajo_prod);
        }

        public DataTable abrirTabla_Compras_FiltradaxFECHA(string fecha)
        {
            string consulta = "SELECT [Legajo_Compra] as [Legajo Compra], [Fecha], [Cantidad], [Legajo_Producto] as [Legajo Producto] FROM [Compra] Where [Fecha] LIKE " + "'%" + fecha + "%'";
            return ad.abrirTabla("listar_compra", consulta);

        }
        public DataTable abrirTabla_Compras()
        {
            string consulta = "SELECT [Legajo_Compra] as [Legajo Compra], [Fecha], [Cantidad], [Legajo_Producto] as [Legajo Producto] FROM [Compra]";
            return ad.abrirTabla("listar_compra", consulta);

        }
        public DataTable abrirtabla_Productos()
        {
            string consulta = "SELECT Legajo_Producto,Nombre,Precio,Descripción,Estado From Producto";
            return ad.abrirTabla("listar_producto", consulta);
        }
        public void actualizarProducto(Producto prod)
        {
            daoProd.actualizarProducto(prod);
          
        }
        public int eliminarProducto(Producto prod)
        {
            return daoProd.eliminarProducto(prod);

        }
        public Producto obtenerproducto(Producto prod)
        {
            return daoProd.obtenerProducto(prod);
        }
        public DataTable FiltrarProducto_x_Descripcion(Producto prod)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Producto,Nombre,Precio,Descripción,Estado FROM Producto Where Descripción LIKE '%"+ prod.Descripcion1 + "%'" ;
            return acceso_de_datos.abrirTabla("filtrar_producto_x_desc", consulta);
        }

        public bool AgregarSucursal(String nombre, String descripcion, String provincia, String direccion)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            String consulta = $"INSERT INTO Sucursal (NombreSucursal, DescripcionSucursal, Id_ProvinciaSucursal, DireccionSucursal) VALUES ('{nombre}', '{descripcion}', '{provincia}', '{direccion}')";
            int filasAfectadas = acceso_de_datos.EjecutarProcedimientos(consulta);
            return filasAfectadas > 0;

        }
        public DataTable abrirTabla_listarSucursales()
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [DescripcionProvincia], [DireccionSucursal] FROM[Sucursal] INNER JOIN[Provincia] ON[Sucursal].Id_ProvinciaSucursal = [Provincia].Id_Provincia";
            return acceso_de_datos.abrirTabla("listar_sucursales", consulta);

        }
        public DataTable abrirTabla_listarSucursales_FiltradaxIDSUCURSAL(/*Sucursal*/ Admins sucursal)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT [Id_Sucursal], [NombreSucursal], [DescripcionSucursal], [DescripcionProvincia], [DireccionSucursal] FROM[Sucursal] INNER JOIN[Provincia] ON[Sucursal].Id_ProvinciaSucursal = [Provincia].Id_Provincia WHERE [Sucursal].Id_Sucursal LIKE " + "'%" + sucursal.Legajo_Admin1 + "%'";
            return acceso_de_datos.abrirTabla("listar_sucursales", consulta);

        }
        public DataTable abrir_tabla_Consultas()
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Interaccion,Fecha,Tipo,Motivo,Descripción,Legajo_Cliente from Interaccion ";
            return acceso_de_datos.abrirTabla("listar_consultas", consulta);

        }
        public DataTable abri_tabla_Consultas_FiltroxLegajo(string legajo)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Interaccion,Fecha,Tipo,Motivo,Descripción,Legajo_Cliente from Interaccion Where Legajo_Cliente LIKE '%" + legajo+"%'";
            return acceso_de_datos.abrirTabla("listar_consultas_Filtrada", consulta);

        }
        public DataTable abrir_tabla_preferencia_x_legajo(int legajo)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Preferencia,Producto_Preferido,Interes_Categoria,Interes_Actividad,Interes_Comida,Legajo_Cliente FROM Preferencias Where Legajo_Cliente = " + legajo;
            return acceso_de_datos.abrirTabla("preferencia_cliente", consulta);
        }
        public DataTable abrir_tabla_preferencias()
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Preferencia,Producto_Preferido,Interes_Categoria,Interes_Actividad,Interes_Comida,Legajo_Cliente FROM Preferencias ";
            return acceso_de_datos.abrirTabla("preferencia_cliente", consulta);
        }
        public DataTable abrir_tabla_preferencia_LIKE_legajo(int legajo)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Preferencia,Producto_Preferido,Interes_Categoria,Interes_Actividad,Interes_Comida,Legajo_Cliente FROM Preferencias Where Legajo_Cliente LIKE '%" + legajo+"%'";
            return acceso_de_datos.abrirTabla("preferencia_cliente", consulta);
        }
        public DataTable obtener_Cliente_x_Legajo(int legajo)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT Legajo_Cliente,Nombre,Contraseña,Dirección,Teléfono,Correo,Fecha_nacimiento,Estado from Clientes Where Legajo_Cliente LIKE '%" + legajo + "%'";
            return acceso_de_datos.abrirTabla("preferencia_Cliente", consulta);
        }
        public DataTable obtener_Cliente_conFILTRO(string filtro)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT [Legajo_Cliente], [Nombre], [Contraseña], [Dirección], [Teléfono], [Correo], [Fecha_nacimiento] , [Estado] FROM [Clientes] WHERE [Nombre] LIKE '%" + filtro + "%'";
            return acceso_de_datos.abrirTabla("listar_Clientes", consulta);
        }
        public DataTable obtener_Cliente_sinFILTRO()
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "SELECT [Legajo_Cliente], [Nombre], [Contraseña], [Dirección], [Teléfono], [Correo], [Fecha_nacimiento] , [Estado] FROM [Clientes]";
            return acceso_de_datos.abrirTabla("listar_Clientes", consulta);
        }

        public DataTable actualizar_cliente(Clientes cli)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "Update Clientes set Nombre = '"+cli.Nombre1+ "', Contraseña= '"+cli.Contraseña1+ "', Dirección= '"+cli.Dirección1+ "', Teléfono= '"+cli.Teléfono1+ "', Correo= '"+cli.Correo1+ "',Fecha_nacimiento= '"+cli.Fecha_nacimiento1+ "',Estado= '"+cli.Estado1+ "' Where Legajo_Cliente = "+cli.Legajo_Cliente1;
            return acceso_de_datos.abrirTabla("actualizar_Clientes", consulta);

        }
        public string cantidad_interacciones(Clientes cli)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "select count(Legajo_Cliente)as cantidad from Interaccion where Legajo_Cliente = '" + cli.Legajo_Cliente1 +"'" ;
            return acceso_de_datos.obtener_String_Consulta(consulta);

        }
        public string cantidad_interacciones_MOTIVOsoporte(Clientes cli)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "select count(Legajo_Cliente) as cantidad from Interaccion where Motivo='Soporte técnico' AND Legajo_Cliente = '" + cli.Legajo_Cliente1 + "'";
            return acceso_de_datos.obtener_String_Consulta(consulta);

        }
        public string cantidad_interacciones_MOTIVOconsulta(Clientes cli)
        {
            AccesoDatos acceso_de_datos = new AccesoDatos();
            string consulta = "select count(Legajo_Cliente) as cantidad from Interaccion where Motivo='Consulta' AND Legajo_Cliente = '" + cli.Legajo_Cliente1 + "'";
            return acceso_de_datos.obtener_String_Consulta(consulta);

        }



        public bool EliminarSucursal(/*Sucursal*/ Admins suc)
        {
            /*    AccesoDatos acceso_de_datos = new AccesoDatos();
                DAOSucursales dao_sucursal = new DAOSucursales();
                bool estado = dao_sucursal.existeSucursal(suc);
                if (estado)
                {
                    String consulta = "DELETE FROM Sucursal WHERE Id_Sucursal = " + suc.Legajo_Admin1;
                    int filasAfectadas = acceso_de_datos.EjecutarProcedimientos(consulta);
                    return filasAfectadas > 0;
                }
                return estado;
            */
            return false;
        }
    }
}
