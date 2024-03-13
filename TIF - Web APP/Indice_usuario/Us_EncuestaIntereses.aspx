<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Us_EncuestaIntereses.aspx.cs" Inherits="TIF_Grupo_12.Indice_usuario.Us_EncuestaIntereses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script language="javascript">
function validarLength(sender, args)
{
if (args.Value.length <= 25)
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
        .auto-style2 {
            width: 112px;
        }
        .auto-style3 {
            width: 354px;
        }
        .auto-style4 {
            width: 360px;
        }
        .auto-style5 {
            width: 112px;
            height: 23px;
        }
        .auto-style6 {
            width: 354px;
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 342px;
        }
        .auto-style8 {
            width: 360px;
            height: 23px;
        }
        .auto-style9 {
            width: 112px;
            height: 30px;
        }
        .auto-style10 {
            width: 354px;
            height: 30px;
        }
        .auto-style11 {
            height: 30px;
            width: 342px;
        }
        .auto-style12 {
            width: 360px;
            height: 30px;
        }
        .auto-style13 {
            width: 342px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lbl_Titulo" runat="server" Font-Bold="True" Font-Size="Large" Text="Encuenta de Intereses"></asp:Label>
                        <br />
                        <br />
                    </td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hl_CerrarSesión" runat="server" NavigateUrl="~/Ingreso.aspx">Cerrar Sesión</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">Escoger un Producto:</td>
                    <td class="auto-style7">
                        <asp:DropDownList ID="ddl_Producto" runat="server">
                            <asp:ListItem>--Elija un producto--</asp:ListItem>
                        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfv_Producto" runat="server" ControlToValidate="ddl_Producto" ErrorMessage="RequiredFieldValidator" InitialValue="--Elija un producto--" ForeColor="Red">*Ingrese un producto</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Escoger una CATEGORIA :</td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="ddl_Categoria" runat="server">
                            <asp:ListItem>--Elija una categoria--</asp:ListItem>
                        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfv_Categoria" runat="server" ControlToValidate="ddl_Categoria" ErrorMessage="RequiredFieldValidator" InitialValue="--Elija una categoria--" ForeColor="Red">*Ingrese una categoria</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Escoger una ACTIVIDAD :</td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="ddl_Actividad" runat="server">
                            <asp:ListItem>--Elija una actividad--</asp:ListItem>
                        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfv_Actividad" runat="server" ControlToValidate="ddl_Actividad" ErrorMessage="RequiredFieldValidator" InitialValue="--Elija una actividad--" ForeColor="Red">*Ingrese una actividad</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9"></td>
                    <td class="auto-style10">Describanos sus alimentos o platos favoritos&nbsp; :<br />
                        (25 caracteres max)</td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txt_DescripAlimentos" runat="server" Height="57px" Width="317px" TextMode="MultiLine"></asp:TextBox>
                        &nbsp;<br />
                    </td>
                    <td class="auto-style12">
                        <asp:CustomValidator ID="cv_DescAlimentos" runat="server" ControlToValidate="txt_DescripAlimentos" ClientValidationFunction="validarLength" ForeColor="Red">*Texto de mayor tamaño al permitido, 25 caracteres.</asp:CustomValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="rev_DescAlimentos" runat="server" ControlToValidate="txt_DescripAlimentos" ValidationExpression="^[^0-9]+$" ForeColor="Red">* No ingrese números, solo caracteres</asp:RegularExpressionValidator>
                        <br />
                        <asp:RequiredFieldValidator ID="rfv_DescAlimentos" runat="server" ControlToValidate="txt_DescripAlimentos" ForeColor="Red">*Ingrese una descripción</asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">Como supor de nosotros:</td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="ddl_tipoMarketing" runat="server">
                            <asp:ListItem>--Elija una opcion--</asp:ListItem>
                            <asp:ListItem Value="1">Redes sociales</asp:ListItem>
                            <asp:ListItem Value="2">Correo electrónico</asp:ListItem>
                            <asp:ListItem Value="3">Otros</asp:ListItem>
                        </asp:DropDownList>
&nbsp;<asp:RequiredFieldValidator ID="rfv_Marketing" runat="server" ControlToValidate="ddl_tipoMarketing" ErrorMessage="RequiredFieldValidator" InitialValue="--Elija una opcion--" ForeColor="Red">*Ingrese una opción</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style13">
                        <br />
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" />
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="hl_Indice" runat="server" NavigateUrl="~/Indice_Usuario.aspx">Ir al indice</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
