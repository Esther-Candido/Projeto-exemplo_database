<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inserir_formando.aspx.cs" Inherits="exemplo_database.inserir_formando" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nome:
            <asp:TextBox ID="tb_nome" runat="server"></asp:TextBox>
            <br />
            <br />
            Curso:
            <asp:DropDownList ID="ddl_curso" runat="server">
                <asp:ListItem>Programacao</asp:ListItem>
                <asp:ListItem>Redes</asp:ListItem>
                <asp:ListItem>Mecatronica</asp:ListItem>
                <asp:ListItem>Design</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Email:
            <asp:TextBox ID="tb_email" runat="server" Width="336px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_adicionar" runat="server" OnClick="btn_adicionar_Click" Text="Adicionar" />
&nbsp;
            <asp:Button ID="btn_adicionarSP" runat="server" Height="26px" OnClick="btn_adicionarSP_Click" style="margin-left: 33px" Text="Adicionar SP" />
            <br />
        </div>
    </form>
</body>
</html>
