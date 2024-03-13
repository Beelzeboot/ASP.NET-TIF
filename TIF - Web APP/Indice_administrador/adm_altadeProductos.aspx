<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adm_altadeProductos.aspx.cs" Inherits="TIF_Grupo_12.adm_altadeProductos" %>

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
            width: 136px;
        }
        .auto-style3 {
            width: 58px;
        }
        .auto-style4 {
            width: 133px;
        }
        .auto-style5 {
            width: 136px;
            height: 23px;
        }
        .auto-style6 {
            width: 58px;
            height: 23px;
        }
        .auto-style7 {
            width: 133px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
            width: 396px;
        }
        .auto-style9 {
            width: 396px;
        }
        .auto-style10 {
            width: 136px;
            height: 24px;
        }
        .auto-style11 {
            height: 24px;
        }
        .auto-style12 {
            width: 396px;
            height: 24px;
        }
        .auto-style13 {
            width: 136px;
            height: 26px;
        }
        .auto-style14 {
            width: 58px;
            height: 26px;
        }
        .auto-style15 {
            width: 133px;
            height: 26px;
        }
        .auto-style16 {
            width: 396px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style10">
                    <asp:Label ID="lbl_nombreusuario" runat="server" Font-Names="Arial" Font-Size="Large" ForeColor="Maroon"></asp:Label>
                </td>
                <td class="auto-style11" colspan="2">
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Alta Productos"></asp:Label>
                    <br />
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style12">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
            </tr>
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style14">Nombre:</td>
                <td class="auto-style15">
                    <asp:TextBox ID="txt_Nombre" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="txt_Nombre" ForeColor="Red">Complete el nombre</asp:RequiredFieldValidator>
                    <br />
                </td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Descripción:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txt_Descripcion" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ControlToValidate="txt_Descripcion" ForeColor="Red">Complete la descripción</asp:RequiredFieldValidator>
                    <br />
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">Precio:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txt_Precio" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv_Precio" runat="server" ControlToValidate="txt_Precio" ForeColor="Red">Complete el precio</asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="cv_Precio" runat="server" ControlToValidate="txt_Precio" Operator="GreaterThan" Type="Double" ValueToCompare="0" ForeColor="Red">Numero invalido</asp:CompareValidator>
                </td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="lbl_Mensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" />
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style9">
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Administrador.aspx">Ir al indice</asp:HyperLink>
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>
