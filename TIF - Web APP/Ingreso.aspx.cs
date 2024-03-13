using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace TIF_Grupo_12
{
    public partial class Ingreso : System.Web.UI.Page
    {
        private PedidoLogico pl = new PedidoLogico();
        private Clientes cli = new Clientes();
        private Admins adm = new Admins();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Session["Admin"] = null;
                Session["Cliente"] = null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid) { 
            bool estadoAD = false;
            bool estadoCL = false;
            adm.Nombre1 = txt_Usuario.Text;
            adm.Contraseña1 = txt_Contraseña.Text;
            cli.Nombre1 = txt_Usuario.Text;
            cli.Contraseña1 = txt_Contraseña.Text;
            if (pl.esAdmin(adm)) { estadoAD = true; }
            if (pl.esCliente(cli)) { estadoCL = true; }
            if(!estadoAD && !estadoCL) { lbl_Mensaje.Text = "Usuario no encontrado, vuelva a ingresar sus datos"; }
            if(!estadoAD && estadoCL) { lbl_Mensaje.Text = "Bienvenido Cliente "+ cli.Nombre1;
                    Session["Cliente"] = (Clientes)cli;
                    Response.Redirect("Indice_Usuario.aspx");
                
                }
            if(!estadoCL && estadoAD) { lbl_Mensaje.Text = "Bienvenido Admin "+ adm.Nombre1;
                    Session["Admin"] = (Admins)adm;
                    Response.Redirect("Indice_Administrador.aspx");
                }
            }

        }
    }
}