using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace TIF_Grupo_12
{
    public partial class adm_altadeProductos : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        private Producto prod = new Producto();
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
                
            }
        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                prod.Nombre1 = txt_Nombre.Text;
                prod.Descripcion1 = txt_Descripcion.Text;
                prod.Precio1 = Convert.ToDecimal( txt_Precio.Text);
                if (!pl.existeProducto(prod)) { 
                if (pl.agregarProducto(prod)==1) { lbl_Mensaje.Text = "Producto Agregado con éxito " + adm.Nombre1; }
                }
                else
                {
                    lbl_Mensaje.Text = "El producto ya se encuentra agregado";
                }
            }
        }
    }
}