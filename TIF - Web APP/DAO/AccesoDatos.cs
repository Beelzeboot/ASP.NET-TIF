using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class AccesoDatos
    {
        String rutaBD = "Data Source=localhost\\sqlexpress; Initial Catalog=Empresa_Cliente; Integrated Security=True";

        public AccesoDatos()
        {

        }

        private SqlConnection AbrirConexion()
        {
            SqlConnection conexion = new SqlConnection(rutaBD);
            try
            {
                conexion.Open();
                return conexion;
            }
            catch
            {
                return null;
            }
        }
        public SqlDataAdapter obtenerAdaptador(string consulta)
        {
            SqlDataAdapter da;
            try
            {
                da = new SqlDataAdapter(consulta, AbrirConexion());
                return da;
            }
            catch (Exception ex)
            {
                return null;
            }


        }
        public DataTable abrirTabla(String Nombretabla, String consulta)
        {
            DataSet datosTabla = new DataSet();
            SqlConnection conexion = AbrirConexion();
            SqlDataAdapter AdaptarConexion = new SqlDataAdapter(consulta, conexion);
            AdaptarConexion.Fill(datosTabla, Nombretabla);
            conexion.Close();
            return datosTabla.Tables[Nombretabla];
        }

        public int EjecutarProcedimientos(string consulta)
        {
            int filasCambiadas;
            SqlConnection conexion = AbrirConexion();
            SqlCommand cmd = new SqlCommand(consulta, conexion);
            filasCambiadas = cmd.ExecuteNonQuery();
            conexion.Close();
            return filasCambiadas;
        }
        public int ejecutarProcedimientoAlmacenado(SqlCommand comando, string NombreProcedimientoAlmacenado)
        {
            int filascambiadas;
            SqlConnection conexion = AbrirConexion();
            SqlCommand cmd = comando;
            cmd.Connection = conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreProcedimientoAlmacenado;
            filascambiadas = cmd.ExecuteNonQuery();
            conexion.Close();
            return filascambiadas;


        }
        public bool existe(string consulta)
        {
            bool estado = false;
            SqlConnection cn = AbrirConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            SqlDataReader datareader = cmd.ExecuteReader();
            if (datareader.Read())
            {
                estado = true;

            }

            return estado;


        }
        public int obtenerMaximo(string consulta)
        {
            int maximo = 0;
            SqlConnection cn = AbrirConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                maximo = Convert.ToInt32(dreader[0].ToString());
            }
            return maximo;
        }

        public string obtenerLegajodeConsulta(string consulta)
        {
            string dato = "vacio";
            SqlConnection cn = AbrirConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            SqlDataReader dreader = cmd.ExecuteReader();
            if (dreader.Read())
            {
                dato = dreader[0].ToString();
            }
            
            return dato;
            
        }






    }

}


