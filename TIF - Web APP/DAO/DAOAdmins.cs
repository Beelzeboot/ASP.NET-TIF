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
    public class DAOAdmins
    {

        AccesoDatos ad = new AccesoDatos();

        public DAOAdmins()
        {

        }

        public Admins obtenerAdmin(Admins adm)
        {
            
           
            DataTable dt = new DataTable();
            dt = ad.abrirTabla("Admins", "Select * From Admins WHERE Contraseña = '" + adm.Contraseña1 + "' AND Nombre = '"+ adm.Nombre1+"'");
            adm.Legajo_Admin1 = (Convert.ToInt32(dt.Rows[0][0].ToString()));
            adm.Nombre1 = dt.Rows[0][1].ToString();
            adm.Contraseña1 = dt.Rows[0][2].ToString();

            return adm;
           
            

        }
        private void armarParametrosEliminar(ref SqlCommand cmd, Admins adm)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Admin", SqlDbType.Int);
            parametros.Value = adm.Legajo_Admin1;


        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Admins adm)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Admin", SqlDbType.Int);
            parametros.Value = adm.Legajo_Admin1;
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = adm.Nombre1;
            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 10);
            parametros.Value = adm.Contraseña1;

        }

        private void armarParametrosNuevoAdmin(ref SqlCommand cmd, Admins adm)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Admin", SqlDbType.Int);
            parametros.Value = adm.Legajo_Admin1;
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = adm.Nombre1;
            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 10);
            parametros.Value = adm.Contraseña1;

        }
        public int eliminarAdmin(Admins adm)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosEliminar(ref cmd, adm);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spEliminarAdmin");
     


        }
        public int actualizarAdmin(Admins adm)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosActualizar(ref cmd, adm);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spActualizarAdmin");


        }
        public int nuevoAdmin(Admins adm)
        {
            SqlCommand cmd = new SqlCommand();

            AccesoDatos ad = new AccesoDatos();
            int id_nuevo_admin = ad.obtenerMaximo("Select max(Legajo_Admin) from Admins") + 1;
            adm.Legajo_Admin1 = id_nuevo_admin;
            armarParametrosNuevoAdmin(ref cmd, adm);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spAgregarAdmin");


        }
        public bool existeAdmin(Admins adm)
        {
            string consulta = "Select * From Admins WHERE Contraseña = '" + adm.Contraseña1 +"' AND Nombre = '" + adm.Nombre1+"'";
            return ad.existe(consulta);
        }

        public DataTable obtenerTabla()
        {
            DataTable tabla = ad.abrirTabla("Admins", "Select * From Admins");
            return tabla;
        }
         
    }
}