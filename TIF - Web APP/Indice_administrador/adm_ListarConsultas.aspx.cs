using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace TIF_Grupo_12.Indice_administrador
{
    public partial class adm_ListarConsultas : System.Web.UI.Page
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
        private void cargargridview()
        {
            gv_ListarConsultas.DataSource= pl.abrir_tabla_Consultas();
            gv_ListarConsultas.DataBind();
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            gv_ListarConsultas.SelectedIndex = -1;
            dl_cliente.Visible = false;
            dl_Preferencias.Visible = false;
            string legajo = txt_BusquedaxLegajo.Text.Trim();
           if(esnumero(legajo))
            {
                gv_ListarConsultas.DataSource= pl.abri_tabla_Consultas_FiltroxLegajo(legajo);
                gv_ListarConsultas.DataBind();
            }
            else
            {
                
                cargargridview();
            }
        }
        private bool esnumero(string numero)
        {
            int valor = 0;

            if (int.TryParse(numero, out valor))
            {
                if (valor > 0) return true;
                else return false;
            }
            else return false;

        }

        protected void gv_ListarConsultas_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string legajo_cliente = ((Label)gv_ListarConsultas.Rows[e.NewSelectedIndex].FindControl("lbl_LegajoCliente")).Text;

            dl_cliente.DataSource = pl.ObtenerdatatableCliente(legajo_cliente);
            dl_cliente.DataBind();
            dl_cliente.Visible = true;
            dl_Preferencias.Visible = false;

        }

        protected void gv_ListarConsultas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dl_cliente.Visible = false;
            dl_Preferencias.Visible = false;
            gv_ListarConsultas.PageIndex = e.NewPageIndex;
            gv_ListarConsultas.SelectedIndex = -1;
            cargargridview();
        }

        protected void dl_cliente_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "Evento-Preferencias")
            {
                int legajo_cliente =Convert.ToInt32(e.CommandArgument);
                dl_Preferencias.Visible = true;

                dl_Preferencias.DataSource= pl.abrir_tabla_preferencia_x_legajo(legajo_cliente);
                dl_Preferencias.DataBind();
            }
            
            if (e.CommandName == "Evento-OcultarPreferencias")
            {
                int legajo_cliente = Convert.ToInt32(e.CommandArgument);
                dl_Preferencias.Visible = false;

               
            }
        }
    }
}