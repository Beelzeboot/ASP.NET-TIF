using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace TIF_Grupo_12.Indice_administrador
{
    public partial class adm_Listarcompras : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        private PedidoLogico pl = new PedidoLogico();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                adm = (Admins)Session["Admin"];
                lbl_nombreusuario.Text = adm.Nombre1;
            }
            if (!IsPostBack)
            {
                cargargridview();
            }

        }
        public void cargargridview()
        {
            gv_ListarCompras.DataSource = pl.abrirTabla_Compras();
            gv_ListarCompras.DataBind();
        }
        protected void gv_ListarCompras_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string legajo_compra = ((Label)gv_ListarCompras.Rows[e.NewSelectedIndex].FindControl("lbl_LegajoCompra")).Text.ToString();
            string legajo_producto = ((Label)gv_ListarCompras.Rows[e.NewSelectedIndex].FindControl("lbl_LegajoProducto")).Text.ToString();
            string legajo_cliente = pl.legajodeCompra_a_legajoCliente(legajo_compra);
            if(legajo_cliente != "vacio") { 
            gv_DetalleCliente.DataSource= pl.ObtenerdatatableCliente(legajo_cliente);
            gv_DetalleCliente.DataBind();

            }
            else
            {
                gv_DetalleCliente.DataSource = null;
                gv_DetalleCliente.DataBind();
               

            }
            gv_DetalleProducto.DataSource = pl.obtenerTabla_de_ProductoEspecifico(legajo_producto);
            gv_DetalleProducto.DataBind();

        }

        protected void gv_ListarCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_ListarCompras.PageIndex = e.NewPageIndex;
            gv_ListarCompras.EditIndex = -1;
            
        }

        protected void gv_ListarCompras_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btn_Filtro_Click(object sender, EventArgs e)
        {
            string filtro = txt_BusquedaxFecha.Text.Trim().ToString();
            gv_ListarCompras.EditIndex = -1;
            if (filtro != "")
            {
                gv_ListarCompras.DataSource=pl.abrirTabla_Compras_FiltradaxFECHA(filtro);
                gv_ListarCompras.DataBind();
                gv_DetalleProducto.DataSource = null;
                gv_DetalleProducto.DataBind();
                gv_DetalleCliente.DataSource = null;
                gv_DetalleCliente.DataBind();
            }
            else
            {
                cargargridview();
                gv_DetalleProducto.DataSource = null;
                gv_DetalleProducto.DataBind();
                gv_DetalleCliente.DataSource = null;
                gv_DetalleCliente.DataBind();
            }
        }
    }
}