<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestao_formandos.aspx.cs" Inherits="exemplo_database.gestao_formandos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <h1>TABELA DOS FORMANDOS - SQL + ASP.NET</h1>


        Curso:<asp:DropDownList ID="ddl_curso" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="curso" DataValueField="curso" style="margin-left: 8px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" SelectCommand="SELECT DISTINCT [curso] FROM [tb_formandos]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="num_formando" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="195px" style="margin-top: 0px" Width="605px" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="num_formando" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="num_formando" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="curso" HeaderText="Curso" SortExpression="curso" />
                <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/icones/cancel.png" DeleteImageUrl="~/icones/delete.jpg" EditImageUrl="~/icones/edit.png" HeaderText="Açoes" ShowDeleteButton="True" ShowEditButton="True" UpdateImageUrl="~/icones/confirm.png" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:atec_palConnectionString %>" DeleteCommand="DELETE FROM [tb_formandos] WHERE [num_formando] = @num_formando" InsertCommand="INSERT INTO [tb_formandos] ([nome], [curso], [email]) VALUES (@nome, @curso, @email)" SelectCommand="SELECT * FROM [tb_formandos] WHERE ([curso] = @curso)" UpdateCommand="UPDATE [tb_formandos] SET [nome] = @nome, [curso] = @curso, [email] = @email WHERE [num_formando] = @num_formando">
            <DeleteParameters>
                <asp:Parameter Name="num_formando" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="curso" Type="String" />
                <asp:Parameter Name="email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_curso" Name="curso" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="curso" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="num_formando" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />


    </form>
</body>
</html>
