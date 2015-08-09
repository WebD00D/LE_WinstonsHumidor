<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Configuration.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Configuration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="styles/bootstrap.min.css" type="text/css" rel="stylesheet"/>
   
</head>
<body>
    <form id="form1" runat="server">
   
  <nav class="navbar navbar-default" style="margin-bottom:0">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a id="lnkHome" class="navbar-brand" href="Default.aspx">Winston's Humidor</a>
    </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
                 <li><a href="News.aspx">News Post</a></li>
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Product Management <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      <li><a id="lnkAccessories" href="Accessories.aspx">Accessories</a></li>
                      <li><a id="lnkApparel" href="Apparel.aspx">Apparel</a></li>
                      <li><a id="lnkCigars" href="Cigars.aspx">Cigars</a></li>
                      <li><a id="lnkCoffee" href="Coffee.aspx">Coffee</a></li>
                      <li><a id="lnkPipes" href="Pipes.aspx">Pipes</a></li>
                      <li><a  href="PipeTobacco.aspx">Pipe Tobacco</a></li>
                  </ul>
              </li>
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Settings <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      <li><a id="lnkSecurity" href="#">Security</a></li>
                      <li><a id="lnkConfiguation" href="Configuration.aspx">Configuration</a></li>
                  </ul>
              </li>
              <li><a href="#">Sign Out</a></li>
          </ul>
      </div>
      <!-- /.navbar-collapse -->
  </div>
        <!-- /.container-fluid -->
 </nav>

        <div class="jumbotron text-center">
            <h1 id="Title"></h1>
        </div>

       
        <div id="Configuration" class="container">
           <div class="col-lg-12">
                

               <ul class="list-inline">             
                   <li>
                       <h6>Tax Percentage</h6>
                <asp:TextBox ID="txtConfigurationTaxPercentage" runat="server" CssClass="form-control"></asp:TextBox> 
                   </li>
                   <li>
                         <h6>Shipping Cost</h6>
                <asp:TextBox ID="txtConfigurationShippingCost" runat="server" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Discount Code</h6>
                       <asp:TextBox runat="server" ID="txtConfigurationDiscountCode" CssClass="form-control"></asp:TextBox>
                   </li>
                       <li><h6>Discount Amount</h6>
                       <asp:TextBox runat="server" ID="txtDiscountCodeAmount" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Discount Code Active</h6>
                       <asp:CheckBox runat="server" ID="ckConfigurationDiscountCodeValid"/>
                   </li>
                
                </ul>
             
                <br />
                <ul class="list-inline">
                    <li><asp:Button ID="btnSaveConfig" runat="server" CssClass="btn btn-success" Text="Save Configuration" /></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblConfigMessage"></asp:Label>
               <br />
               <br />
               <br />
            </div>
        </div>


    

    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
        $("#Title").html("Configuration");

    })
</script>
