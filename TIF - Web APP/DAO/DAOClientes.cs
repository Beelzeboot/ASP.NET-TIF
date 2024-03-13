using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;
namespace DAO
{
    public class DAOClientes
    {

        AccesoDatos ad = new AccesoDatos();

        public DAOClientes()
        {

        }
        
        public Clientes obtenerCliente(Clientes cli)
        {
            DataTable dt = new DataTable();
            dt = ad.abrirTabla("Clientes", "Select * From Clientes WHERE Contraseña = '" + cli.Contraseña1 + "' AND Nombre = '" + cli.Nombre1+"'");
            cli.Legajo_Cliente1 = (Convert.ToInt32(dt.Rows[0][0].ToString()));
            cli.Nombre1 = dt.Rows[0][1].ToString();
            cli.Contraseña1 = dt.Rows[0][2].ToString();
            cli.Dirección1 = dt.Rows[0][3].ToString();
            cli.Teléfono1 = dt.Rows[0][4].ToString();
            cli.Correo1 = dt.Rows[0][5].ToString();
            cli.Fecha_nacimiento1 = Convert.ToDateTime(dt.Rows[0][6]);
            cli.Estado1= Convert.ToBoolean(dt.Rows[0][7]);

            return cli;
           
        }
        public Clientes obtenerCliente_SOLO_x_legajo(Clientes cli)
        {
            DataTable dt = new DataTable();
            dt = ad.abrirTabla("Clientes", "Select * From Clientes WHERE Legajo_Cliente = '" + cli.Legajo_Cliente1+"'");
            cli.Legajo_Cliente1 = (Convert.ToInt32(dt.Rows[0][0].ToString()));
            cli.Nombre1 = dt.Rows[0][1].ToString();
            cli.Contraseña1 = dt.Rows[0][2].ToString();
            cli.Dirección1 = dt.Rows[0][3].ToString();
            cli.Teléfono1 = dt.Rows[0][4].ToString();
            cli.Correo1 = dt.Rows[0][5].ToString();
            cli.Fecha_nacimiento1 = Convert.ToDateTime(dt.Rows[0][6]);
            cli.Estado1 = Convert.ToBoolean(dt.Rows[0][7]);

            return cli;

        }

        private void armarParametrosEliminar(ref SqlCommand cmd, Clientes cli)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Cliente", SqlDbType.Int);
            parametros.Value = cli.Legajo_Cliente1;


        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Clientes cli)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = cli.Nombre1;
            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 10);
            parametros.Value = cli.Contraseña1;
            parametros = cmd.Parameters.Add("@Dirección", SqlDbType.VarChar, 255);
            parametros.Value = cli.Dirección1; 
            parametros = cmd.Parameters.Add("@Teléfono", SqlDbType.VarChar, 15);
            parametros.Value = cli.Teléfono1;
            parametros = cmd.Parameters.Add("@Correo", SqlDbType.VarChar, 255);
            parametros.Value = cli.Correo1;
            parametros = cmd.Parameters.Add("@Fecha_nacimiento", SqlDbType.Date);
            parametros.Value = cli.Fecha_nacimiento1;
            parametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            parametros.Value = cli.Estado1;

        }

        private void armarParametrosNuevoCliente(ref SqlCommand cmd, Clientes cli)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = cli.Nombre1;
            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 10);
            parametros.Value = cli.Contraseña1;
            parametros = cmd.Parameters.Add("@Dirección", SqlDbType.VarChar, 255);
            parametros.Value = cli.Dirección1;
            parametros = cmd.Parameters.Add("@Teléfono", SqlDbType.VarChar, 15);
            parametros.Value = cli.Teléfono1;
            parametros = cmd.Parameters.Add("@Correo", SqlDbType.VarChar, 255);
            parametros.Value = cli.Correo1;
            parametros = cmd.Parameters.Add("@Fecha_nacimiento", SqlDbType.Date);
            parametros.Value = cli.Fecha_nacimiento1;

        }
        public int eliminarCliente(Clientes cli)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosEliminar(ref cmd, cli);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spEliminarCliente");


        }
        public int actualizarCliente(Clientes cli)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosActualizar(ref cmd, cli);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spActualizarCliente");


        }
        public int nuevoCliente(Clientes cli)
        {
            SqlCommand cmd = new SqlCommand();

            AccesoDatos ad = new AccesoDatos();
            armarParametrosNuevoCliente(ref cmd, cli);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spAgregarCliente");


        }
        public bool existeCliente(Clientes cli)
        {
            string consulta = "Select * From Clientes WHERE Contraseña = '" + cli.Contraseña1 + "' AND Nombre = '" + cli.Nombre1+"'";
            return ad.existe(consulta);
        }

        public DataTable obtenerTabla()
        {
            DataTable tabla = ad.abrirTabla("Clientes", "Select * From Clientes");
            return tabla;
        }
    }
}