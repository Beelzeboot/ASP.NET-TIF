using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace TIF_Grupo_12.Indice_administrador
{
    public partial class adm_ListarConsultas : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        private PedidoLogico pl = new PedidoLogico();
        Clientes cli = new Clientes();
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
            gv_PorcentajeInteraccion.Visible = false;
            string legajo = txt_BusquedaxLegajo.Text.Trim();
            txt_BusquedaxLegajo.Text = "";
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
            Clientes aux = new Clientes();
            string legajo_cliente = ((Label)gv_ListarConsultas.Rows[e.NewSelectedIndex].FindControl("lbl_LegajoCliente")).Text;
            aux.Legajo_Cliente1 = Convert.ToInt32( legajo_cliente);

            dl_cliente.DataSource = pl.ObtenerdatatableCliente(legajo_cliente);
            dl_cliente.DataBind();
            cli = pl.buscarCliente_SOLO_x_legajo(aux);
            cargardatos_dl_PorcentajesInteraccion(cli);
            dl_cliente.Visible = true;
            dl_Preferencias.Visible = false;

        }

        protected void gv_ListarConsultas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dl_cliente.Visible = false;
            dl_Preferencias.Visible = false;
            gv_PorcentajeInteraccion.Visible = false;
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

        protected void cargardatos_dl_PorcentajesInteraccion(Clientes cli)
        {
            gv_PorcentajeInteraccion.Visible = true;
           
            
            
            int cant_inter_total=Convert.ToInt32( pl.cantidad_interacciones(cli));
            double Porc_Soporte = ((Convert.ToDouble(pl.cantidad_interacciones_MOTIVOsoporte(cli)))/ cant_inter_total) *100 ;
            double Porc_Consult = ((Convert.ToDouble(pl.cantidad_interacciones_MOTIVOconsulta(cli))) / cant_inter_total) * 100;

            DataTable dt = new DataTable();

            if (dt.Columns.Count == 0)
            {
                dt.Columns.Add("Cantidad Interacciones", typeof(string));
                dt.Columns.Add("Porcentaje Soporte Técnico", typeof(string));
                dt.Columns.Add("Porcentaje Consulta", typeof(string));
            }

            DataRow dr = dt.NewRow();
            dr[0] = Convert.ToString(cant_inter_total); 
            dr[1] = Convert.ToString(Porc_Soporte)+" %";
            dr[2]= Convert.ToString(Porc_Consult)+" %";
            dt.Rows.Add(dr);

            Session["Porcentajes"] = (DataTable)dt;
            gv_PorcentajeInteraccion.DataSource = (DataTable)dt;
            gv_PorcentajeInteraccion.DataBind();

        }
    }
}