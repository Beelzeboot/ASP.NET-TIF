<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ingreso.aspx.cs" Inherits="TIF_Grupo_12.Ingreso" %>

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
        .auto-style7 {
            width: 108px;
        }
        .auto-style8 {
            width: 59px;
        }
        .auto-style10 {
            width: 145px;
        }
        .auto-style11 {
            width: 242px;
        }
        .auto-style12 {
            width: 108px;
            height: 33px;
        }
        .auto-style13 {
            width: 59px;
            height: 33px;
        }
        .auto-style14 {
            width: 235px;
            height: 33px;
        }
        .auto-style15 {
            height: 33px;
        }
        .auto-style16 {
            width: 235px;
        }
        .auto-style17 {
            width: 108px;
            height: 30px;
        }
        .auto-style18 {
            width: 59px;
            height: 30px;
        }
        .auto-style19 {
            width: 235px;
            height: 30px;
        }
        .auto-style20 {
            height: 30px;
        }
        .auto-style21 {
            width: 108px;
            height: 26px;
        }
        .auto-style22 {
            width: 59px;
            height: 26px;
        }
        .auto-style23 {
            width: 235px;
            height: 26px;
        }
        .auto-style24 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;<table class="auto-style1">
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style11">
                        <asp:Label ID="lbl_Nombrepag" runat="server" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="Large" Text="Ingreso a la aplicacion"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13">Usuario:</td>
                <td class="auto-style14">
                    <asp:TextBox ID="txt_Usuario" runat="server" Width="215px"></asp:TextBox>
                &nbsp;
                    </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="rfv_Usuario" runat="server" ControlToValidate="txt_Usuario" ForeColor="Red">*Ingrese nombre de usuario</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22">Contraseña:</td>
                <td class="auto-style23">
                    <asp:TextBox ID="txt_Contraseña" runat="server" TextMode="Password" Width="215px"></asp:TextBox>
                </td>
                <td class="auto-style24">
                    <asp:RequiredFieldValidator ID="rfv_Contraseña" runat="server" ControlToValidate="txt_Contraseña" ForeColor="Red">*Ingrese contraseña</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18"></td>
                <td class="auto-style19">
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </td>
                <td class="auto-style20"></td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style16">
                    <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label>
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style16">
                    <asp:HyperLink ID="hl_UsuarioNuevo" runat="server" NavigateUrl="~/Crear_usuario.aspx">Crear Usuario</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
