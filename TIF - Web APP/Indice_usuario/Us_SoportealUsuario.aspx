<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Us_SoportealUsuario.aspx.cs" Inherits="TIF_Grupo_12.Indice_usuario.Us_SoportealUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <script language="javascript">
function validarLength(sender, args)
{
if (args.Value.length <= 60)
args.IsValid = true;
else
args.IsValid = false;
}
        </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 171px;
        }
        .auto-style5 {
            width: 171px;
            height: 42px;
        }
        .auto-style9 {
            width: 171px;
            height: 20px;
        }
        .auto-style19 {
            height: 42px;
        }
        .auto-style20 {
            width: 137px;
        }
        .auto-style21 {
            width: 336px;
        }
        .auto-style24 {
            width: 171px;
            height: 29px;
        }
        .auto-style26 {
            width: 336px;
            height: 29px;
        }
        .auto-style28 {
            width: 25px;
            height: 29px;
        }
        .auto-style30 {
            width: 25px;
            height: 20px;
        }
        .auto-style31 {
            width: 25px;
            height: 42px;
        }
        .auto-style32 {
            width: 25px;
        }
        .auto-style33 {
            width: 171px;
            height: 65px;
        }
        .auto-style34 {
            height: 65px;
        }
        .auto-style35 {
            width: 336px;
            height: 65px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style33"></td>
                <td colspan="2" class="auto-style34">
                    <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Soporte al usuario"></asp:Label>
                </td>
                <td class="auto-style35">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style31">
                    <br />
                </td>
                <td class="auto-style19" colspan="2">FECHA:<asp:Label ID="lbl_Fecha" runat="server" Text="[actualizar a fecha hoy]"></asp:Label>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style24"></td>
                <td class="auto-style28">Comentario:</td>
                <td rowspan="3" class="auto-style20">
                    <asp:TextBox ID="txt_Comentario" runat="server" Height="66px" TextMode="MultiLine" Width="333px"></asp:TextBox>
                </td>
                <td class="auto-style26">
                    <asp:RequiredFieldValidator ID="rfv_Comentario" runat="server" ControlToValidate="txt_Comentario" ForeColor="Red">*Comentario vacio</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style21" rowspan="2">
                    <asp:CustomValidator ID="cv_Comentario" runat="server" ControlToValidate="txt_Comentario" OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validateLength" ForeColor="Red">*Debe contener 60 o menos caracteres</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style30"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style20">
                    <br />
                </td>
                <td class="auto-style21">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style20">
                    <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" />
                </td>
                <td class="auto-style21">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style21">
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Usuario.aspx">Ir al indice</asp:HyperLink>
                    </td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
