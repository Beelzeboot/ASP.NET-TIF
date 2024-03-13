using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace TIF_Grupo_12
{
    public partial class adm_Listar_mod_productos : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        private PedidoLogico pl = new PedidoLogico();
        private Producto prod = new Producto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                adm = (Admins)Session["Admin"];
                lbl_nombreusuario.Text = adm.Nombre1;
            }

            if (!IsPostBack)
            {
                cargargridview(0);
                lbl_Mensaje.Text = "";
            }
        }

        private void cargargridview(int num)
        {
            if(num == 0) { 
            Session["tabla"]= (DataTable)pl.abrirtabla_Productos();
            gv_Listarproductos.DataSource= pl.abrirtabla_Productos();
            gv_Listarproductos.DataBind();
            }
            else
            {
                gv_Listarproductos.DataSource = (DataTable)Session["tabla"];
                gv_Listarproductos.DataBind();
            }
        }
        
        protected void gv_Listarproductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_Listarproductos.PageIndex = e.NewPageIndex;
            
            cargargridview(1);
        }

        protected void gv_Listarproductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lbl_Mensaje.Text = "";
            gv_Listarproductos.EditIndex = e.NewEditIndex;
            
            cargargridview(1);
        }

        protected void gv_Listarproductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lbl_Mensaje.Text = "";
            gv_Listarproductos.EditIndex = -1;
            cargargridview(1);
        }

        //verifica si es un numero que se puede convertir a decimal y si es positivo
        private bool esnumero(string numero)
        {
            decimal valor = 0;

        if( decimal.TryParse(numero, out valor))
            {
               if (valor > 0) return true;
               else  return false; 
            }
            else return false;
         
        }

        protected void gv_Listarproductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            string legajo = ((Label)gv_Listarproductos.Rows[e.RowIndex].FindControl("lbl_LegajoProd")).Text;
            string nombre = ((TextBox)gv_Listarproductos.Rows[e.RowIndex].FindControl("txt_Nombre")).Text;
            string precio = ((TextBox)gv_Listarproductos.Rows[e.RowIndex].FindControl("txt_Precio")).Text;
            string descripcion = ((TextBox)gv_Listarproductos.Rows[e.RowIndex].FindControl("txt_Descripcion")).Text;
            bool estado = ((CheckBox)gv_Listarproductos.Rows[e.RowIndex].FindControl("cb_Estado")).Checked;

            bool esnumeroo = esnumero(precio);
            bool estadoVacio=chequeo_campos_Vacios(nombre, precio, descripcion);
            //validación de precio de textbox
            if (esnumeroo && !estadoVacio) { 

            prod.Legajo_Producto1 = Convert.ToInt32(legajo);
            prod.Nombre1 = nombre;
            prod.Precio1 = Convert.ToDecimal(precio);
            prod.Descripcion1 = descripcion;
            prod.Estado1 = estado;

            //Validación que no exista el mismo producto con mismo nombre,descripción y precio
            if (!pl.existeProducto(prod))
            {
                pl.actualizarProducto(prod);

                gv_Listarproductos.EditIndex = -1;
                cargargridview(0);
                lbl_Mensaje.Text = "Producto actualizado con éxito";
            }
            else
            {
                gv_Listarproductos.EditIndex = -1;
                cargargridview(0);
                lbl_Mensaje.Text = "El producto ya se encuentra agregado";
            }

            }

            else
            {
                gv_Listarproductos.EditIndex = -1;
                cargargridview(0);
                lbl_Mensaje.Text = "Ingrese un precio válido";

            }
        }
        private bool chequeo_campos_Vacios(string nombre,string precio, string descripcion)
        {
            if(string.IsNullOrWhiteSpace(nombre) || string.IsNullOrWhiteSpace(precio) || string.IsNullOrWhiteSpace(descripcion))
            {
                return true;
            }
            else return false; 
        }

        protected void gv_Listarproductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Session["legajo_prod"] = null;
            string legajo = ((Label)gv_Listarproductos.Rows[e.RowIndex].FindControl("lbl_LegajoProd")).Text;
            string nombre = ((Label)gv_Listarproductos.Rows[e.RowIndex].FindControl("lbl_Nomb")).Text;

            lbl_Eliminar.Text = "Seguro que desea eliminar? <br> Producto: " + nombre + "<br> Legajo: " + legajo;
            lbl_Eliminar.Visible = true;
            btn_Eliminar_NO.Visible = true;
            btn_Eliminar_SI.Visible = true;
            Session["legajo_prod"] = (int)Convert.ToInt32(legajo);
            
           



        }

        protected void btn_Eliminar_SI_Click(object sender, EventArgs e)
        {
            lbl_Mensaje.Text = "";
            int filascambiadas=0;
            prod.Legajo_Producto1 = Convert.ToInt32(Session["legajo_prod"]);
            prod = pl.obtenerproducto(prod);
            filascambiadas =pl.eliminarProducto(prod);
            if (filascambiadas == 1) {
                lbl_Mensaje.Text = "Producto eliminado con éxito, Producto: " + prod.Nombre1; 
                Session["legajo_prod"] = null;
                Botones_Eliminar_Invisible();
                cargargridview(0);
            }
            else
            {

                lbl_Mensaje.Text = "No se pudo eliminar el producto seleccionado";
                Session["legajo_prod"] = null;
                Botones_Eliminar_Invisible();
                cargargridview(0);
            }

        }

        protected void btn_Eliminar_NO_Click(object sender, EventArgs e)
        {
            Session["legajo_prod"] = null;
            lbl_Mensaje.Text = "";
            Botones_Eliminar_Invisible();
            cargargridview(0);
        }

        protected void btn_Filtro_Click(object sender, EventArgs e)
        {
            gv_Listarproductos.EditIndex = -1;
            Botones_Eliminar_Invisible();
            string desc = txt_BusquedaxDesc.Text.Trim();
            txt_BusquedaxDesc.Text = "";
            if (desc != "")
            {
                prod.Descripcion1 = desc;
                Session["tabla"] =(DataTable) pl.FiltrarProducto_x_Descripcion(prod);
                cargargridview(1);

            }
            else
            {
                cargargridview(0);
            }
        }

        private void Botones_Eliminar_Invisible()
        {
            lbl_Eliminar.Visible = false;
            btn_Eliminar_NO.Visible = false;
            btn_Eliminar_SI.Visible = false;
        }
    }
}