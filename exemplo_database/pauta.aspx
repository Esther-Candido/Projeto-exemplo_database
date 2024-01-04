<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pauta.aspx.cs" Inherits="exemplo_database.pauta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>PAUTA</h1>
        </div>

        <style>
            .positiva{
                color: green;
            }
            .negativa{
                color: red;
            }
        </style>


        <asp:Repeater ID="rpt_pauta" runat="server">
            <HeaderTemplate>
                <table border="1" width="500">
                    <tr style="background-color: aquamarine">
                        <td><b>Nome</b</td>
                         <td><b>Disciplina</b></td>
                         <td><b>Nota</b></td>
                        </td>
                    </tr>
            </HeaderTemplate>


            <ItemTemplate>
                <tr>
                    <td><%# Eval ("nome") %></td>
                    <td><%# Eval ("disciplina") %></td>
                    <td class="<%# Eval("estiloCSS") %>"><%# Eval ("nota") %></td>
                </tr>
            </ItemTemplate>

            <!-- Cores alternada na linha-->
            <AlternatingItemTemplate>
                    <tr style="background-color:burlywood">
                    <td><%# Eval ("nome") %></td>
                    <td><%# Eval ("disciplina") %></td>
                    <td class="<%# Eval("estiloCSS") %>"><%# Eval ("nota") %></td>
                </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>


    </form>
</body>
</html>
