using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;
using System.Web;
namespace DAO
{
    public class DAOProductos
    {
        AccesoDatos ad = new AccesoDatos();

        public DAOProductos()
        {

        }

        public Producto obtenerProducto(Producto prod)
        {
            DataTable dt = new DataTable();
            dt = ad.abrirTabla("Prodcutos", "Select * From Producto WHERE Legajo_Producto = " + prod.Legajo_Producto1 );
            prod.Legajo_Producto1 = (Convert.ToInt32(dt.Rows[0][0].ToString()));
            prod.Nombre1 = dt.Rows[0][1].ToString();
            prod.Precio1 =Convert.ToDecimal( dt.Rows[0][2].ToString());
            prod.Descripcion1 = dt.Rows[0][3].ToString();
            prod.Estado1 = Convert.ToBoolean(dt.Rows[0][4]);

            return prod;

        }
        private void armarParametrosEliminar(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Producto", SqlDbType.Int);
            parametros.Value = prod.Legajo_Producto1;


        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Legajo_Producto", SqlDbType.Int);
            parametros.Value = prod.Legajo_Producto1;
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = prod.Nombre1;
            parametros = cmd.Parameters.Add("@Precio", SqlDbType.Decimal);
            parametros.Value = prod.Precio1;
            parametros = cmd.Parameters.Add("@Descripción", SqlDbType.Text);
            parametros.Value = prod.Descripcion1;
            parametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            parametros.Value = prod.Estado1;

        }

        private void armarParametrosNuevoProducto(ref SqlCommand cmd, Producto prod)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 255);
            parametros.Value = prod.Nombre1;
            parametros = cmd.Parameters.Add("@Precio", SqlDbType.Decimal);
            parametros.Value = prod.Precio1;
            parametros = cmd.Parameters.Add("@Descripción", SqlDbType.Text);
            parametros.Value = prod.Descripcion1;

        }
        public int eliminarProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosEliminar(ref cmd, prod);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spEliminarProducto");


        }
        public int bajaLogicaProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosEliminar(ref cmd, prod);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spBajaLogicaProducto");


        }
        public int actualizarProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosActualizar(ref cmd, prod);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spActualizarProducto");


        }
        public int nuevoProducto(Producto prod)
        {
            SqlCommand cmd = new SqlCommand();

            AccesoDatos ad = new AccesoDatos();
            armarParametrosNuevoProducto(ref cmd, prod);
            return ad.ejecutarProcedimientoAlmacenado(cmd, "spAgregarProducto");


        }
        public bool existeProducto(Producto prod)
        {
            string consulta = "Select * From Producto WHERE Nombre = '" + prod.Nombre1 + "' AND Precio = '" + prod.Precio1.ToString().Replace(',', '.') + "' AND Descripción LIKE '" + prod.Descripcion1 + "'";
            return ad.existe(consulta);
        }

        public DataTable obtenerTabla()
        {
            DataTable tabla = ad.abrirTabla("Productos", "Select * From Producto");
            return tabla;
        }
        public DataTable obtenerTabla_de_Legajo(string legajo_prod)
        {
            DataTable tabla = ad.abrirTabla("Productos", "Select Legajo_Producto as [Legajo Producto], Nombre,Precio,Descripción From Producto Where Legajo_Producto ='"+ legajo_prod+"'");
            return tabla;
        }

    }
}