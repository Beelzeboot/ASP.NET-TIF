<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adm_ListarConsultas.aspx.cs" Inherits="TIF_Grupo_12.Indice_administrador.adm_ListarConsultas" %>

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
        .auto-style4 {
            width: 316px;
        }
        .auto-style6 {
            width: 202px;
        }
        .auto-style7 {
            height: 23px;
            width: 140px;
        }
        .auto-style8 {
            width: 140px;
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
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Listar consultas"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style6">Busqueda por legajo cliente:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txt_BusquedaxLegajo" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_Filtrar" runat="server" OnClick="btn_Filtrar_Click" Text="Buscar" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td colspan="2" rowspan="2">
                        <asp:GridView ID="gv_ListarConsultas" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4"  ForeColor="#333333" GridLines="None" OnPageIndexChanging="gv_ListarConsultas_PageIndexChanging" OnSelectedIndexChanging="gv_ListarConsultas_SelectedIndexChanging" PageSize="6">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Fecha" runat="server" Text='<%# Eval("Fecha") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Tipo" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Motivo">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Motivo" runat="server" Text='<%# Eval("Motivo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripción">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Eval("Descripción") %>'></asp:Label>
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
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:DataList ID="dl_cliente" runat="server" BorderColor="Blue" BorderWidth="2px" CellPadding="4" ForeColor="#333333" OnItemCommand="dl_cliente_ItemCommand" Visible="False">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                Nombre:
                                <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                <br />
                                Dirección:
                                <asp:Label ID="lbl_Direccion" runat="server" Text='<%# Eval("Dirección") %>'></asp:Label>
                                <br />
                                Teléfono:
                                <asp:Label ID="lbl_Telefono" runat="server" Text='<%# Eval("Teléfono") %>'></asp:Label>
                                <br />
                                Correo:
                                <asp:Label ID="lbl_Correo" runat="server" Text='<%# Eval("Correo") %>'></asp:Label>
                                <br />
                                <asp:Button ID="btn_PreferenciasCliente" runat="server" CommandArgument='<%# Eval("Legajo Cliente") %>' CommandName="Evento-Preferencias" Text="Mirar preferencias" />
                                &nbsp;
                                <asp:Button ID="btn_OcultarPreferencias" runat="server" CommandArgument='<%# Eval("Legajo Cliente") %>' CommandName="Evento-OcultarPreferencias" Text="Ocultar Preferencias" />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <asp:GridView ID="gv_PorcentajeInteraccion" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td>
                        <asp:DataList ID="dl_Preferencias" runat="server" BorderColor="Purple" BorderWidth="2px" CellPadding="4" ForeColor="#333333" Visible="False">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                Producto Preferido:
                                <asp:Label ID="lbl_ProductoPrefer" runat="server" Text='<%# Eval("Producto_Preferido") %>'></asp:Label>
                                <br />
                                Interes Categoría:
                                <asp:Label ID="lbl_IntCategoria" runat="server" Text='<%# Eval("Interes_Categoria") %>'></asp:Label>
                                <br />
                                Interes Actividad:
                                <asp:Label ID="lbl_IntActividad" runat="server" Text='<%# Eval("Interes_Actividad") %>'></asp:Label>
                                <br />
                                Interes Comida:
                                <asp:Label ID="lbl_IntComida" runat="server" Text='<%# Eval("Interes_Comida") %>'></asp:Label>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Administrador.aspx">Ir al indice</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
