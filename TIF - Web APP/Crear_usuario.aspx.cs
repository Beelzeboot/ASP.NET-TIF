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
    public partial class Crear_usuario : System.Web.UI.Page
    {
        private PedidoLogico pl = new PedidoLogico();
        private Clientes cli = new Clientes();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cv_Contraseña_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string data = args.Value;
            args.IsValid = false;
            bool uc = false;
            bool longitud = true;
            if(data.Length < 6 || data.Length > 10) { longitud = false;  }
            //Mayuscula o uppercase
            foreach (char c in data)

                if (c >= 'A' && c <= 'Z')
                {
                    uc = true; break;
                }
            if (!uc) return;
            //numero
            bool num = false;
            foreach (char c in data)
            {
                if (c >= '0' && c <= '9')
                {
                    num = true; break;
                }
            }
            if (!num) return;
            if (uc && num && longitud) { args.IsValid = true; }



        }

        protected void lbl_CrearUsuario_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (Page.IsValid) { 
            cli.Nombre1 = txt_Nombre.Text;
            cli.Contraseña1 = txt_Contraseña1.Text;
            cli.Correo1 = txt_Correo.Text;
            cli.Dirección1 = txt_Direccion.Text;
            cli.Teléfono1 = txt_Telefono.Text;
            cli.Fecha_nacimiento1 = Convert.ToDateTime(txt_Fechanac.Text);
            pl.nuevoCliente(cli);
            }
        }
    }
}
