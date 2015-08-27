<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Dashboard | Login</title>
      <link href="styles/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="col-lg-4 col-lg-offset-4">
        <label>Username</label>
        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
        <br />
        <label>Password</label>
        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-control"></asp:TextBox>
    </div>
    </form>
</body>
</html>
