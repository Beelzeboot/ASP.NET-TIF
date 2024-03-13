using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace TIF_Grupo_12.Indice_administrador
{
    public partial class adm_ListarClientes : System.Web.UI.Page
    {
        private Admins adm = new Admins();
        private Clientes cli = new Clientes();
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
              cargarlistview(0);

            }

        }
        public void cargarlistview(int i)
        {
            if (i == 0) {
                Session["tabla"] = (DataTable)pl.obtener_Cliente_sinFILTRO();
                lv_ListarClientes.DataSource = (DataTable)Session["tabla"];
                lv_ListarClientes.DataBind();
            }
            else
            {
                
                lv_ListarClientes.DataSource = (DataTable) Session["tabla"];
                lv_ListarClientes.DataBind();
            }
           


        }
        public void cargarlistview_conFILTRO(string filtro)
        {
            Session["tabla"] = (DataTable)pl.obtener_Cliente_conFILTRO(filtro);
            lv_ListarClientes.DataSource = (DataTable)Session["tabla"];
            lv_ListarClientes.DataBind();
        

        }

        protected void btn_Filtro_Click(object sender, EventArgs e)
        {

            string filtro = txt_BusquedaxNombre.Text.ToString().Trim();
            if (filtro != "") {
                cargarlistview_conFILTRO(filtro);
                txt_BusquedaxNombre.Text = "";
            } 
            else{
                cargarlistview(0);
                txt_BusquedaxNombre.Text = "";
            }

        }

       
        protected void btn_Modificar_Command(object sender, CommandEventArgs e)
        {
        }

        protected void btn_Modificar_Command1(object sender, CommandEventArgs e)
        {        
        }

        protected void btn_Actualizar_Command(object sender, CommandEventArgs e)
        {
       
        }
        protected void btn_Cancelar_Command(object sender, CommandEventArgs e)
        {

        }
        private void Actualizar_Cliente(Clientes cli)
        {
            Clientes aux = new Clientes();
            foreach(ListViewItem x in lv_ListarClientes.Items)
            {
                if(Convert.ToInt32(((Label)x.FindControl("lbl_LegajoCliente")).Text) ==  cli.Legajo_Cliente1)
                {
                    aux.Legajo_Cliente1 = cli.Legajo_Cliente1;
                    aux.Nombre1 = ((TextBox)x.FindControl("txt_Nombre")).Text;
                    aux.Contraseña1= ((TextBox)x.FindControl("txt_Contraseña")).Text;
                    aux.Dirección1= ((TextBox)x.FindControl("txt_Direccion")).Text;
                    aux.Correo1= ((TextBox)x.FindControl("txt_Correo")).Text;
                    aux.Teléfono1= ((TextBox)x.FindControl("txt_Telefono")).Text;
                    aux.Fecha_nacimiento1=Convert.ToDateTime(((TextBox)x.FindControl("txt_Fecha")).Text);
                    aux.Estado1= ((CheckBox)x.FindControl("chb_Estado")).Checked;
                    lv_ListarClientes.DataSource= pl.actualizar_cliente(aux);
                    lv_ListarClientes.DataBind();
                }
            }
        }
 

        protected void lv_ListarClientes_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lv_ListarClientes.EditIndex = -1;
            cargarlistview(0);
        }

    

        protected void lv_ListarClientes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
              if(e.CommandName == "ActualizarCliente")
            {
                Clientes aux = new Clientes();
                int legajo1 = Convert.ToInt32(((Label)lv_ListarClientes.EditItem.FindControl("lbl_LegajoCliente")).Text);

                string nombre = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Nombre")).Text;
                string contraseña = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Contraseña")).Text;
                string direccion = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Direccion")).Text;
                string correo = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Correo")).Text;
                string telefono = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Telefono")).Text;
                string fechanac = ((TextBox)lv_ListarClientes.EditItem.FindControl("txt_Fecha")).Text;

                if(!CamposVacios(nombre, contraseña, direccion, correo, telefono, fechanac) ){



                    aux.Legajo_Cliente1 = legajo1;
                    cli = pl.buscarCliente_SOLO_x_legajo(aux);
                    Actualizar_Cliente(cli);

                    lv_ListarClientes.EditIndex = -1;
                    cargarlistview(0);

                }else { lv_ListarClientes.EditIndex = -1; cargarlistview(0); }

              
                
            }

            if (e.CommandName == "evento-modificar")
            {
                int indice = Convert.ToInt32(e.CommandArgument);
                lv_ListarClientes.EditIndex = indice;
                cargarlistview(1);
               
            }
            
           

        }
        private bool CamposVacios(string nombre, string contraseña, string direccion, string correo, string telefono, string fechanac)
        {
            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(contraseña) || string.IsNullOrEmpty(direccion) || string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(fechanac))
            {
                return true;
            }
            else return false;
        }



        protected void lv_ListarClientes_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {

            //cargarlistview(0);
        }

      
    }
}