<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion Clientes.aspx.cs" Inherits="Cobranza.Gestion_Clientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Gestion de Clientes</title>
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
              height: 700px;
          }

      form {
          max-width: 650px;
          margin: 0 auto;
          padding: 20px;
          background-color: #fff;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          border-radius: 5px;
              height: 750px;
          }

      .header {
          text-align: center;
      }

      .link {
          font-size: 25px;
          text-decoration: none;
          color: #007bff;
      }

      .link:hover {
          text-decoration: underline;
      }

      .input-container {
          display: flex;
          flex-direction: column;
          margin-bottom: 20px;
      }

      .input-container label {
          font-size: 14px;
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
          display: flex;
          justify-content: center; 
          align-items: center; 
      }

      .btn {
          padding: 10px 20px;
          font-size: 16px;
          border: none;
          border-radius: 5px;
          cursor: pointer;
      }

      .btn-primary {
          background-color: #007bff;
          color: #fff;
          font-family: 'Arial', sans-serif;
          margin: 10px
      }

      .btn-danger {
          background-color: #dc3545;
          color: #fff;
          font-family: 'Arial', sans-serif;
          margin: 10px;
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
          justify-content: center;
          align-items: center;
          text-align: center;
          font-size: 12px;
      }
      .message-delete {
    font-weight: bold;
    color: #EB2222;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-size: 12px;
}
  </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 700px">
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Index.aspx">Menu</asp:HyperLink>
            <div class="header">
            <asp:Label ID="Label2" runat="server" Text="Gestion de Clientes"></asp:Label>
                </div>
            <br />
             <div class="input-container">
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Nombre"></asp:TextBox><br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Apellido"></asp:TextBox>
                 </div>

            <div class="header">
             <asp:Label ID="Label1" runat="server" CssClass="message" style="margin: 0 auto; margin: 50px;"></asp:Label>
                </div>

             <div class="btn-container">
            <asp:Button ID="Button1" runat="server" Height="40px" OnClick="Button1_Click" Text="Agregar" Width="120px" CssClass="btn btn-primary" /> 
            <asp:Button ID="Button2" runat="server" Height="40px" Text="Modificar" Width="120px" OnClick="Button2_Click" CssClass="btn btn-primary"/>
           </div>

            <div class="input-container">
                <label for="DropDownList1">Seleccionar Cliente</label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="apellido" DataValueField="idCliente" Height="60px" CssClass="list-box" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
                </div>

             <div class="message-container">
               <asp:Label ID="MessageLabel" runat="server" CssClass="message-delete" style="margin: 0 auto; margin: 220px;"></asp:Label>
             </div>
            <div class="btn-container">
            <asp:Button ID="Button3" runat="server" Height="40px" OnClick="Button3_Click" Text="Eliminar" CssClass="btn btn-danger" Width="120px" />
                </div>
            <br />
            <asp:Table ID="Table1" runat="server" Width="790px">
            </asp:Table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Clientes] WHERE [idCliente] = @idCliente" InsertCommand="INSERT INTO [Clientes] ([apellido], [nombre]) VALUES (@apellido, @nombre)" SelectCommand="SELECT * FROM [Clientes]" UpdateCommand="UPDATE [Clientes] SET [apellido] = @apellido, [nombre] = @nombre WHERE [idCliente] = @idCliente">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT apellido, nombre FROM Clientes"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Clientes] WHERE ([idCliente] = @idCliente)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idCliente" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
