<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Us_MisCompras.aspx.cs" Inherits="TIF_Grupo_12.Indice_usuario.Us_MisCompras" %>

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
            width: 172px;
        }
        .auto-style3 {
            width: 357px;
        }
        .auto-style4 {
            width: 135px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Mis compras"></asp:Label>
                </td>
                <td class="auto-style3">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">Busqueda por fecha:</td>
                <td>
                        <asp:TextBox ID="txt_BusquedaxFecha" runat="server" Width="136px"></asp:TextBox>
                    &nbsp;
                        <asp:Button ID="btn_Filtro" runat="server" Text="Buscar" Width="55px" />
                    </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style3">
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Usuario.aspx">Ir al indice</asp:HyperLink>
                    </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
