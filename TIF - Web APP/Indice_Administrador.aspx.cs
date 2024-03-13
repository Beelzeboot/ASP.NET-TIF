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
    public partial class Indice_Administrador : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["Admin"]!= null) { 
                    adm = (Admins)Session["Admin"];
                    lbl_Bienvenida.Text = "Bienvenido " + adm.Nombre1;
                }
            }

        }
    }
}