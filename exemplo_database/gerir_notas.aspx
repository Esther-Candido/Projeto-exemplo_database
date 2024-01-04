<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerir_notas.aspx.cs" Inherits="exemplo_database.gerir_notas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <h1>GESTÃO DE NOTAS</h1>
        <br />
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                 <table border="1" width="500">
                     <tr style="background-color: aquamarine">
                         <td><b>Cod</b</td>
                         <td><b>Nome</b</td>
                          <td><b>Disciplina</b></td>
                          <td><b>Nota</b></td>
                         <td><b>Nota</b></td>
                         <td>
                             <asp:ImageButton ID="btn_saveAll" runat="server" ImageUrl="~/icones/saveall.png" OnClick="btn_saveAll_Click" /></td>

                     </tr>
            </HeaderTemplate>

            <ItemTemplate>
                 <tr>
                     <td>
                         <asp:Label ID="lbl_cod" runat="server"></asp:Label></td>
                     <td>
                         <asp:TextBox ID="tb_nome" runat="server"></asp:TextBox></td>
                     <td>
                         <asp:TextBox ID="tb_disciplina" runat="server"></asp:TextBox></td>
                     <td>
                         <asp:TextBox ID="tb_nota" runat="server"></asp:TextBox></td>
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
                         <asp:TextBox ID="tb_disciplina" runat="server"></asp:TextBox></td>
                     <td>
                         <asp:TextBox ID="tb_nota" runat="server"></asp:TextBox></td>
                    <td><asp:ImageButton ID="btn_grava" runat="server" ImageUrl="~/icones/save.jpg" CommandName="btn_grava" /></td>
                    <td><asp:ImageButton ID="btn_apaga" runat="server" ImageUrl="~/icones/delete.jpg" CommandName="btn_apaga" /></td>
                       </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" SelectCommand="SELECT * FROM [tb_avaliacao]"></asp:SqlDataSource>

    </form>
</body>
</html>
