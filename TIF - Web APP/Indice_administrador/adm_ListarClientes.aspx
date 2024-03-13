<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adm_ListarClientes.aspx.cs" Inherits="TIF_Grupo_12.Indice_administrador.adm_ListarClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 107px;
        }
        .auto-style3 {
            width: 660px;
        }
        .auto-style5 {
            width: 107px;
            height: 43px;
        }
        .auto-style8 {
            height: 43px;
        }
        .auto-style10 {
            width: 164px;
        }
        .auto-style11 {
            width: 107px;
            height: 137px;
        }
        .auto-style12 {
            height: 137px;
        }
        .auto-style13 {
            width: 107px;
            height: 23px;
        }
        .auto-style14 {
            width: 164px;
            height: 23px;
        }
        .auto-style15 {
            width: 660px;
            height: 23px;
        }
        .auto-style16 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lbl_nombreusuario" runat="server" Font-Names="Arial" Font-Size="Large" ForeColor="Maroon"></asp:Label>
                    </td>
                    <td class="auto-style8" colspan="2">
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Listar clientes"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style8">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style10">Busqueda por nombre:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txt_BusquedaxNombre" runat="server"></asp:TextBox>
                    &nbsp;
                        <asp:Button ID="btn_Filtro" runat="server" Text="Buscar" Width="55px" OnClick="btn_Filtro_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style11">
                        &nbsp;</td>
                    <td class="auto-style12" colspan="2">
                        <asp:ListView ID="lv_ListarClientes" runat="server" DataKeyNames="Legajo_Cliente" GroupItemCount="3" OnItemCanceling="lv_ListarClientes_ItemCanceling" OnItemCommand="lv_ListarClientes_ItemCommand" OnItemUpdated="lv_ListarClientes_ItemUpdated">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FFFFFF;color: #284775;">Legajo:
                                    <asp:Label ID="lbl_LegajoCliente" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
                                    <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                    <br />Contraseña:
                                    <asp:Label ID="lbl_Contraseña" runat="server" Text='<%# Eval("Contraseña") %>' />
                                    <br />Dirección:
                                    <asp:Label ID="lbl_Direccion" runat="server" Text='<%# Eval("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:Label ID="lbl_Telefono" runat="server" Text='<%# Eval("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:Label ID="lbl_Correo" runat="server" Text='<%# Eval("Correo") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="lbl_FechaNac" runat="server" Text='<%# Eval("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="chb_Estado" runat="server" Checked='<%# Eval("Estado") %>' Enabled="False" Text="Estado" />
                                    <br />
                                    <asp:Button ID="btn_Modificar" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="evento-modificar" OnCommand="btn_Modificar_Command1" Text="Modificar" />
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #999999;">Legajo:
                                    <asp:Label ID="lbl_LegajoCliente" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
                                    <asp:TextBox ID="txt_Nombre" runat="server" Text='<%# Bind("Nombre") %>' />
                                    <br />Contraseña:
                                    <asp:TextBox ID="txt_Contraseña" runat="server" Text='<%# Bind("Contraseña") %>' />
                                    <br />Dirección:
                                    <asp:TextBox ID="txt_Direccion" runat="server" Text='<%# Bind("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:TextBox ID="txt_Telefono" runat="server" Text='<%# Bind("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:TextBox ID="txt_Correo" runat="server" Text='<%# Bind("Correo") %>' />
                                    <br />Fecha:
                                    <asp:TextBox ID="txt_Fecha" runat="server" Text='<%# Eval("Fecha_nacimiento", "{0}") %>' />
                                    <br />
                                    <asp:CheckBox ID="chb_Estado" runat="server" Checked='<%# Bind("Estado") %>' Text="Estado" />
                                    <br />
                                    <asp:Button ID="btn_Actualizar" runat="server" CommandName="ActualizarCliente" Text="Actualizar" CommandArgument='<%# Bind("Legajo_Cliente", "{0}") %>' OnCommand="btn_Actualizar_Command" />
                                    <asp:Button ID="btn_Cancelar" runat="server" CommandName="Cancel" Text="Cancelar" OnCommand="btn_Cancelar_Command" />
                                    <br />
                                    <br /></td>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han devuelto datos.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
<td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>
                            <InsertItemTemplate>
                                <td runat="server" style="">Nombre:
                                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                                    <br />Contraseña:
                                    <asp:TextBox ID="ContraseñaTextBox" runat="server" Text='<%# Bind("Contraseña") %>' />
                                    <br />Dirección:
                                    <asp:TextBox ID="DirecciónTextBox" runat="server" Text='<%# Bind("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:TextBox ID="TeléfonoTextBox" runat="server" Text='<%# Bind("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:TextBox ID="CorreoTextBox" runat="server" Text='<%# Bind("Correo") %>' />
                                    <br />Fecha_nacimiento:
                                    <asp:TextBox ID="Fecha_nacimientoTextBox" runat="server" Text='<%# Bind("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' Text="Estado" />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                    <br /></td>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <td runat="server" style="background-color: #E0FFFF;color: #333333;">Legajo:
                                    <asp:Label ID="lbl_LegajoCliente" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
                                    <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                    <br />Contraseña:
                                    <asp:Label ID="lbl_Contraseña" runat="server" Text='<%# Eval("Contraseña") %>' />
                                    <br />Dirección:
                                    <asp:Label ID="lbl_Direccion" runat="server" Text='<%# Eval("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:Label ID="lbl_Telefono" runat="server" Text='<%# Eval("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:Label ID="lbl_Correo" runat="server" Text='<%# Eval("Correo") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="lbl_FechaNac" runat="server" Text='<%# Eval("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="chb_Estado" runat="server" Checked='<%# Eval("Estado") %>' Enabled="False" Text="Estado" />
                                    <br />
                                    <asp:Button ID="btn_Modificar" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="evento-modificar" OnCommand="btn_Modificar_Command" Text="Modificar" />
                                    <br /></td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Legajo:
                                    <asp:Label ID="Legajo_ClienteLabel" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
                                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                                    <br />Contraseña:
                                    <asp:Label ID="ContraseñaLabel" runat="server" Text='<%# Eval("Contraseña") %>' />
                                    <br />Dirección:
                                    <asp:Label ID="DirecciónLabel" runat="server" Text='<%# Eval("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:Label ID="TeléfonoLabel" runat="server" Text='<%# Eval("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:Label ID="CorreoLabel" runat="server" Text='<%# Eval("Correo") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="Fecha_nacimientoLabel" runat="server" Text='<%# Eval("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Eval("Estado") %>' Enabled="false" Text="Estado" />
                                    <br /></td>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style14">
                        &nbsp;</td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Administrador.aspx">Ir al indice</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
