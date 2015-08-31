<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Dashboard | Login</title>
      <link href="styles/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    
</head>
<body style="background-color:#795135">
    <form id="form1" runat="server">
    <div class="col-lg-4 col-lg-offset-4 " style="margin-top:5%;background-color:white;padding:15px;border-radius:8px" >
        <div class="col-lg-12 text-center">
           
                  <img height="100"  src="WinstonHumidor_Cigar_Brown.png" />
            <br />
            <h3><b>Welcome back!</b></h3>
            <p style="font-style:initial">Please enter your administrative username and password.</p>
          
        </div>
     
        <br />
        <label>Username</label>
        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
        <br />
        <label>Password</label>
        <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Button runat="server" Font-Size="X-Large" ID="btnLogin" CssClass="btn btn-warning btn-block"  Text="Sign In"/>
        <br />
        <br />
     <asp:Label runat="server" ID="lblMsg"></asp:Label>
    </div>
    </form>
</body>
</html>
