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
    public partial class Indice_Usuario : System.Web.UI.Page
    {
        private Clientes cli = new Clientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if ((Clientes)Session["Cliente"] != null)
                {
                    cli = (Clientes)Session["Cliente"];
                    lbl_Bienvenida.Text = "Bienvenido " + cli.Nombre1;
                }
            }
        }
    }
}