<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indice_Usuario.aspx.cs" Inherits="TIF_Grupo_12.Indice_Usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 142px;
        }
        .auto-style8 {
            width: 284px;
        }
        .auto-style9 {
            width: 330px;
        }
        .auto-style4 {
            width: 139px;
        }
        .auto-style2 {
            width: 82px;
        }
        .auto-style5 {
            width: 277px;
        }
        .auto-style10 {
            width: 82px;
            height: 23px;
        }
        .auto-style11 {
            width: 277px;
            height: 23px;
        }
        .auto-style12 {
            height: 23px;
        }
        .auto-style7 {
            width: 170px;
        }
        .auto-style13 {
            width: 170px;
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style8">
                        <asp:Label ID="lbl_Indice_Administrador" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Text="Indice"></asp:Label>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="lbl_Bienvenida" runat="server" Font-Names="Arial" Font-Size="Large" Text="Bienvenido [Nombre]"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">
                    <asp:HyperLink ID="hl_Usuario_compraproductos" runat="server" NavigateUrl="~/Indice_usuario/Us_ComprarProductos.aspx">Comprar Productos</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Indice_usuario/Us_MisCompras.aspx">Mis compras</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Indice_usuario/Us_EncuestaIntereses.aspx">Encuesta de intereses</asp:HyperLink>
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Indice_usuario/Us_SoportealUsuario.aspx">Soporte al usuario (Consultas y reportes)</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style13"></td>
                    <td class="auto-style12"></td>
                    <td class="auto-style12"></td>
                </tr>
            </table>
        </div>
    </body>
</html>
