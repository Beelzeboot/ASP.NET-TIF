<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adm_PreferenciasClientes.aspx.cs" Inherits="TIF_Grupo_12.Indice_administrador.adm_PreferenciasClientes" %>

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
            height: 23px;
        }
        .auto-style6 {
            width: 181px;
        }
        .auto-style7 {
            height: 23px;
            width: 145px;
        }
        .auto-style8 {
            width: 145px;
        }
        .auto-style9 {
            width: 483px;
        }
        .auto-style10 {
            width: 181px;
            height: 23px;
        }
        .auto-style11 {
            width: 483px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lbl_nombreusuario" runat="server" Font-Names="Arial" Font-Size="Large" ForeColor="Maroon"></asp:Label>
                    </td>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Preferencias Clientes"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style6">Busqueda por legajo cliente:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txt_BusquedaxLegajo" runat="server" Width="136px"></asp:TextBox>
                    &nbsp;&nbsp;
                        <asp:Button ID="btn_Filtro" runat="server" Text="Buscar" Width="55px" OnClick="btn_Filtro_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style2" colspan="2">
                        <asp:GridView ID="gv_PreferenciasClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="6" OnPageIndexChanging="gv_PreferenciasClientes_PageIndexChanging">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Legajo Preferencia">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_LegajoPreferencia" runat="server" Text='<%# Eval("Legajo_Preferencia") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Producto preferido">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_ProductoPreferido" runat="server" Text='<%# Eval("Producto_Preferido") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interes Categoría">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_InteresCategoría" runat="server" Text='<%# Eval("Interes_Categoria") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interes Actividad">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_InteresActividad" runat="server" Text='<%# Eval("Interes_Actividad") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interes Comida">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_InteresComida" runat="server" Text='<%# Eval("Interes_Comida") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Legajo Cliente">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_LegajoCliente" runat="server" Text='<%# Eval("Legajo_Cliente") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </td>
                    <td class="auto-style2">
                        <asp:ListView ID="lv_Clientes" runat="server" DataKeyNames="Legajo_Cliente" GroupItemCount="2">
                            
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #999999;">Legajo_Cliente:
                                    <asp:Label ID="Legajo_ClienteLabel1" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
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
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                    <br />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
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
                                <td runat="server" style="background-color: #E0FFFF;color: #333333;">Legajo Cliente:
                                    <asp:Label ID="lbl_LegajoCliente" runat="server" Text='<%# Eval("Legajo_Cliente") %>' />
                                    <br />Nombre:
                                    <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                    <br />Dirección:
                                    <asp:Label ID="lbl_Direccion" runat="server" Text='<%# Eval("Dirección") %>' />
                                    <br />Teléfono:
                                    <asp:Label ID="lbl_Telefono" runat="server" Text='<%# Eval("Teléfono") %>' />
                                    <br />Correo:
                                    <asp:Label ID="lbl_Correo" runat="server" Text='<%# Eval("Correo") %>' />
                                    <br />Fecha nacimiento:
                                    <asp:Label ID="lbl_Fecha" runat="server" Text='<%# Eval("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Eval("Estado") %>' Enabled="False" Text="Estado" />
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
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="2">
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
                                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Legajo_Cliente:
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
                                    <br />Fecha_nacimiento:
                                    <asp:Label ID="Fecha_nacimientoLabel" runat="server" Text='<%# Eval("Fecha_nacimiento") %>' />
                                    <br />
                                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Eval("Estado") %>' Enabled="false" Text="Estado" />
                                    <br /></td>
                            </SelectedItemTemplate>
                        </asp:ListView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style10"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Administrador.aspx">Ir al indice</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
