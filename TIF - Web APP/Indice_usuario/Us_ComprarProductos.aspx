<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Us_ComprarProductos.aspx.cs" Inherits="TIF_Grupo_12.Indice_usuario.Us_ComprarProdcutos" %>

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
        .auto-style5 {
            width: 178px;
        }
        .auto-style6 {
            height: 23px;
            width: 178px;
        }
        .auto-style7 {
            width: 178px;
            height: 24px;
        }
        .auto-style8 {
            height: 24px;
        }
        .auto-style9 {
            width: 158px;
        }
        .auto-style10 {
            height: 23px;
            width: 158px;
        }
        .auto-style11 {
            width: 457px;
        }
        .auto-style12 {
            height: 23px;
            width: 457px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style8" colspan="2">
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Comprar Productos"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style9">Busqueda por nombre:</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txt_BusquedaxNombre" runat="server" Width="136px"></asp:TextBox>
                    &nbsp;
                        <asp:Button ID="btn_Filtro" runat="server" Text="Buscar" Width="55px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style10">
                        <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style12"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Usuario.aspx">Ir al indice</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
