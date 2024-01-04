<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lista_produtos.aspx.cs" Inherits="exemplo_database.lista_produtos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>LISTA DE PRODUTOS</h1>
        </div>

           <td><asp:DropDownList ID="ddl_ordena" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ordena_SelectedIndexChanged">
            <asp:ListItem>---</asp:ListItem>
            <asp:ListItem>+Barato</asp:ListItem>
            <asp:ListItem>+Caro</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList></td>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">

            <HeaderTemplate>
                <table border="1" width="500">
                    <tr style="background-color: aquamarine">
                        <td><b>Codigo</b</td>
                        <td><b>Nome</b</td>
                         <td><b>Stock</b></td>
                         <td><b>Preço</b></td>
                        <td><asp:ImageButton ID="btn_saveAll" runat="server" ImageUrl="~/icones/saveall.png" OnClick="btn_saveAll_Click" /></td>
                </tr>
            </HeaderTemplate>

            <ItemTemplate>
                    <td><asp:Label ID="lbl_cod" runat="server"></asp:Label></td>
                    <td><asp:TextBox ID="tb_nome" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="tb_stock" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="tb_pvp" runat="server"></asp:TextBox></td>
                   <td><asp:ImageButton ID="btn_grava" runat="server" ImageUrl="~/icones/save.jpg" CommandName="btn_grava" /></td>
                   <td><asp:ImageButton ID="btn_apaga" runat="server" ImageUrl="~/icones/delete.jpg" CommandName="btn_apaga" /></td>
                    </tr>
            </ItemTemplate>

            <AlternatingItemTemplate>
                   <tr>
                    <td>
                    <asp:Label ID="lbl_cod" runat="server"></asp:Label></td>
                    <td>
                     <asp:TextBox ID="tb_nome" runat="server"></asp:TextBox></td>
                    <td>
                    <asp:TextBox ID="tb_stock" runat="server"></asp:TextBox></td>
                    <td>
                   <asp:TextBox ID="tb_pvp" runat="server"></asp:TextBox></td>
                   <td><asp:ImageButton ID="btn_grava" runat="server" ImageUrl="~/icones/save.jpg" CommandName="btn_grava" /></td>
                   <td><asp:ImageButton ID="btn_apaga" runat="server" ImageUrl="~/icones/delete.jpg" CommandName="btn_apaga" /></td>
                    </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" SelectCommand="SELECT * FROM [tb_lista_produtos]"></asp:SqlDataSource>

    </form>
</body>
</html>
