<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crear_usuario.aspx.cs" Inherits="TIF_Grupo_12.Crear_usuario" %>

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
            width: 145px;
        }
        .auto-style4 {
            width: 598px;
        }
        .auto-style7 {
            width: 127px;
        }
        .auto-style11 {
            height: 26px;
        }
        .auto-style12 {
            width: 82px;
            height: 23px;
        }
        .auto-style13 {
            width: 127px;
            height: 23px;
        }
        .auto-style14 {
            height: 23px;
        }
        .auto-style15 {
            width: 82px;
        }
        .auto-style16 {
            width: 78px;
        }
        .auto-style21 {
            width: 82px;
            height: 26px;
        }
        .auto-style22 {
            width: 78px;
            height: 26px;
        }
        .auto-style25 {
            width: 64px;
        }
        .auto-style28 {
            width: 136px;
            height: 23px;
        }
        .auto-style30 {
            width: 130px;
        }
        .auto-style31 {
            width: 64px;
            height: 26px;
        }
        .auto-style33 {
            width: 145px;
            height: 26px;
        }
        .auto-style34 {
            width: 138px;
        }
        .auto-style35 {
            width: 137px;
            height: 26px;
        }
        .auto-style36 {
            width: 136px;
        }
        .auto-style37 {
            width: 137px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lbl_Nombrepag" runat="server" Font-Names="Arial" Font-Size="Large" Text="Creacion de usuarios"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22">Nombre:</td>
                <td class="auto-style33">
                    <asp:TextBox ID="txt_Nombre" runat="server" ValidationGroup="vs_Creacionusuario"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="rfv_Nombre" runat="server" ControlToValidate="txt_Nombre" ErrorMessage="Ingrese nombre" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style16">Contraseña:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txt_Contraseña1" runat="server" ValidationGroup="vs_Creacionusuario" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Contraseña1" runat="server" ControlToValidate="txt_Contraseña1" ErrorMessage="Ingrese la primer contraseña" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cv_Contraseña" runat="server" ControlToValidate="txt_Contraseña1" ErrorMessage="*Contraseña debe contener 1 letra mayuscula y tener entre 6-10 caracteres" ForeColor="Red" OnServerValidate="cv_Contraseña_ServerValidate" ValidationGroup="vs_Creacionusuario" ValidateEmptyText="True">*</asp:CustomValidator>
                    <br />
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style30">Repetir Contraseña:</td>
                <td class="auto-style34">
                    <asp:TextBox ID="txt_Contraseña2" runat="server" ValidationGroup="vs_Creacionusuario" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="comparev_Contraseñas" runat="server" ControlToCompare="txt_Contraseña1" ControlToValidate="txt_Contraseña2" ErrorMessage="Las contraseñas no son iguales" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfv_Contraseña2" runat="server" ControlToValidate="txt_Contraseña2" ErrorMessage="Ingrese la segunda contraseña" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style31">Dirreción:</td>
                <td class="auto-style35">
                    <asp:TextBox ID="txt_Direccion" runat="server" ValidationGroup="vs_Creacionusuario"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="rfv_Direccion" runat="server" ControlToValidate="txt_Direccion" ErrorMessage="Ingrese dirección" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style25">Teléfono:</td>
                <td class="auto-style37">
                    <asp:TextBox ID="txt_Telefono" runat="server" ValidationGroup="vs_Creacionusuario"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Telefono" runat="server" ControlToValidate="txt_Telefono" ErrorMessage="Ingrese telefono" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style25">Correo:</td>
                <td class="auto-style37">
                    <asp:TextBox ID="txt_Correo" runat="server" TextMode="Email" ValidationGroup="vs_Creacionusuario"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Correo" runat="server" ControlToValidate="txt_Correo" ErrorMessage="Ingrese Correo" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style7">Fecha de nacimiento:</td>
                <td class="auto-style36">
                    <asp:TextBox ID="txt_Fechanac" runat="server" TextMode="Date" ValidationGroup="vs_Creacionusuario"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Fechanac" runat="server" ControlToValidate="txt_Fechanac" ErrorMessage="Ingrese fecha de nacimiento" ValidationGroup="vs_Creacionusuario" ForeColor="Red" EnableClientScript="False">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td colspan="2">
                    <asp:ValidationSummary ID="vs_Errores" runat="server" ValidationGroup="vs_Creacionusuario" ForeColor="Red" />
                </td>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
                <td class="auto-style28">
                    <asp:Button ID="lbl_CrearUsuario" runat="server" Text="Crear Usuario" ValidationGroup="vs_Creacionusuario" OnClick="lbl_CrearUsuario_Click" />
                    <br />
                </td>
                <td class="auto-style14">
                    <asp:HyperLink ID="hl_Volver_a_Ingreso" runat="server" NavigateUrl="~/Ingreso.aspx">--&gt; Volver al Ingreso</asp:HyperLink>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
