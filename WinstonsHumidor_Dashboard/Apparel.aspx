<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Apparel.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Apparel" %>
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
        <a id="lnkHome" class="navbar-brand" href="#">Winston's Humidor</a>
    </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Product Management <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      <li><a id="lnkAccessories" href="Accessories.aspx">Accessories</a></li>
                      <li><a id="lnkApparel" href="#">Apparel</a></li>
                      <li><a id="lnkCigars" href="#">Cigars</a></li>
                      <li><a id="lnkCoffee" href="#">Coffee</a></li>
                      <li><a id="lnkPipes" href="#">Pipes</a></li>
                  </ul>
              </li>
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Settings <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                      <li><a id="lnkSecurity" href="#">Security</a></li>
                      <li><a id="lnkConfiguation" href="#">Configuration</a></li>
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

 
        <div id="Apparel" class="container">
           <div class="col-lg-12">
                <h3>Apparel</h3>
                <input class="form-control" placeholder="Search apparel by SKU, brand, name, or price."/>
               <br />
                <div id="ApparelList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfApparelProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtApparelSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtApparelNames" runat="server" CssClass="form-control"></asp:TextBox>
        
                <h6>Description</h6>
                <textarea runat="server" id="txtApprarelDescriptions" class="form-control"></textarea>
                
                <ul class="list-inline">
                    <li><h6>XS Qty</h6>
                         <asp:TextBox ID="XS" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>SM Qty</h6>
                         <asp:TextBox ID="SM" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>MD Qty</h6>
                         <asp:TextBox ID="MD" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>LG Qty</h6>
                         <asp:TextBox ID="LG" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XL Qty</h6>
                         <asp:TextBox ID="XL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XXL Qty</h6>
                         <asp:TextBox ID="XXL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XXXL Qty</h6>
                         <asp:TextBox ID="XXXL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                    <li> <h6>Price</h6>
                <asp:TextBox ID="txtApparelPrice" runat="server" CssClass="form-control"></asp:TextBox></li>
                    <li>  <h6>Product Image</h6>
                <asp:FileUpload ID="fuApprelImg" runat="server" CssClass="form-control" /></li>
                </ul>
               
              
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveApprel" runat="server" CssClass="btn btn-success" Text="Save Apparel" /></li>
                    <li><asp:Button id="btnDeleteApparel" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblApparelMessage"></asp:Label>
            </div>
        </div>
        <!-- end Apparel Section -->
    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
        $("#Title").html("Apparel Management");

    })
</script>
