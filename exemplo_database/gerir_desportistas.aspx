<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gerir_desportistas.aspx.cs" Inherits="exemplo_database.gerir_desportistas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        

        <h1> TABELA GERIR ESPORTE - SQL + ASP.NET </h1>

        <p>
            &nbsp;</p>
        <p>
            Desporto:
            <asp:DropDownList ID="ddl_desporto" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="desporto" DataValueField="desporto" AppendDataBoundItems="True">
                <asp:ListItem Value="%">Todos</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" SelectCommand="SELECT DISTINCT [desporto] FROM [tb_desportistas]"></asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="cod" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="944px" AllowPaging="True" AllowSorting="True" PageSize="3">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="cod" HeaderText="Cód" InsertVisible="False" ReadOnly="True" SortExpression="cod" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="data_nascimento" HeaderText="Nascimento" SortExpression="data_nascimento" />
                <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                <asp:BoundField DataField="desporto" HeaderText="Desporto" SortExpression="desporto" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/icones/cancel.png" DeleteImageUrl="~/icones/delete.jpg" EditImageUrl="~/icones/edit.png" HeaderText="Açoes" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/icones/confirm.png" />
            </Columns>
            <EmptyDataTemplate>
                <a href="javascript:__doPostBack('GridView1','Sort$cod')" style="color:#F7F7F7;">Cód</a>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" SelectCommand="SELECT * FROM [tb_desportistas] WHERE ([desporto] LIKE '%' + @desporto2 + '%')" DeleteCommand="DELETE FROM [tb_desportistas] WHERE [cod] = @cod" InsertCommand="INSERT INTO [tb_desportistas] ([nome], [data_nascimento], [email], [desporto]) VALUES (@nome, @data_nascimento, @email, @desporto)" UpdateCommand="UPDATE [tb_desportistas] SET [nome] = @nome, [data_nascimento] = @data_nascimento, [email] = @email, [desporto] = @desporto WHERE [cod] = @cod">
            <DeleteParameters>
                <asp:Parameter Name="cod" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter DbType="Date" Name="data_nascimento" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="desporto" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_desporto" Name="desporto2" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter DbType="Date" Name="data_nascimento" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="desporto" Type="String" />
                <asp:Parameter Name="cod" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
