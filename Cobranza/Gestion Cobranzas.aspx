<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion Cobranzas.aspx.cs" Inherits="Cobranza.Gestion_Cobranzas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestion Cobranzas</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
       
    }

    form {
        max-width: 600px;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }

    .header {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
    }

    .link {
        font-size: 18px;
        text-decoration: none;
        color: #007bff;
    }

    .link:hover {
        text-decoration: underline;
    }

    .input-container {
        margin-bottom: 20px;
    }

    .input-container label {
        font-size: 16px;
        margin-bottom: 5px;
    }

    .input-container input[type="text"],
    .input-container select {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
    }

    .btn-container {
        text-align: center;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px;
    }

    .btn-primary {
        background-color: #138D75;
        color: #fff;
        font-family: 'Arial', sans-serif;
    }

    .btn-danger {
        background-color: #dc3545;
        color: #fff;
        font-family: 'Arial', sans-serif;
    }

    .btn-warning {
        background-color: #ffc107;
        color: #000;
        font-family: 'Arial', sans-serif;
    }

    .label {
        font-size: 16px;
        margin-top: 10px;
        text-align: center;
    }

    .list-box {
        width: 100%;
    }

    .message {
        font-weight: bold;
        color: #007bff;
        text-align: center;
        font-size: 12px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Menu</asp:HyperLink>
            <br />
            <br />
            <div class="header">
                Gestion Cobranzas
            </div>

            <div class="input-container">
                <label for="TextBox1">Monto</label><br />
            <asp:TextBox ID="TextBox1" runat="server" Width="480px"></asp:TextBox>
                </div>

                <div class="input-container">
                <label for="TextBox2">Fecha</label><br />
            <asp:TextBox ID="TextBox2" runat="server" Width="480px"></asp:TextBox>
                </div>

            <div class="input-container">
                <asp:Label ID="Label3" runat="server" Text="Apellido del cliente"></asp:Label><br />
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="apellido" DataValueField="idCliente" Height="60px" Width="500px"></asp:DropDownList>
            </div>
            
            <div class="btn-container">
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Agregar" Width="111px" CssClass="btn btn-primary"/>
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Modificar" Width="112px" CssClass="btn btn-primary"/>           
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Limpiar" Width="101px" CssClass="btn btn-primary"/>
            </div>
            <br />

            <div class="input-container">
            Filtrar por apellido de cliente<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="apellido" DataValueField="idCliente" Height="60px" Width="500px"></asp:DropDownList>
            <br />
                </div>

            <div class="btn-container">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filtrar" CssClass="btn btn-primary"/>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Desfiltrar" CssClass="btn btn-primary"/>
            </div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="543px" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" style="margin-right: 0px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="monto" HeaderText="Monto" SortExpression="monto" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha y Hora" SortExpression="fecha" />
                    <asp:BoundField DataField="idCliente" SortExpression="idCliente"  ReadOnly="True"/>
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido"  ReadOnly="True"/>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" ApplyFormatInEditMode="True"  ReadOnly="True"/>
                    <asp:CommandField ButtonType="Image" EditText="Modificar" ShowDeleteButton="True" DeleteImageUrl="~/icons/delete icon.png" SelectImageUrl="~/icons/select icon.png" ShowSelectButton="True" ControlStyle-Width="20" >
<ControlStyle Width="20px"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cobranzas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cobranzas] ([fecha], [idCliente], [monto]) VALUES (@fecha, @idCliente, @monto)" SelectCommand="SELECT Cobranzas.id, Cobranzas.fecha, Cobranzas.monto, Clientes.apellido, Clientes.nombre, Cobranzas.idCliente FROM Cobranzas INNER JOIN Clientes ON Cobranzas.idCliente = Clientes.idCliente" UpdateCommand="UPDATE [Cobranzas] SET [fecha] = @fecha, [idCliente] = @idCliente, [monto] = @monto WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList2" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="TextBox2" DbType="Date" Name="fecha" PropertyName="Text" />
                <asp:ControlParameter ControlID="DropDownList2" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Clientes]"></asp:SqlDataSource>
    </form>
</body>
</html>
