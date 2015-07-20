<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Cigars.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Cigars" %>
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
                      <li><a id="lnkApparel" href="Apparel.aspx">Apparel</a></li>
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


           
        <div id="Coffee" class="container">
           <div class="col-lg-12">
                <h3>Cigars</h3>
                <input id="txtCigarSearch" class="form-control" placeholder="Search Cigars by SKU, brand, name, or price."/>
               <label id="lblCigarSearchMessage" style="color:red"></label>
               <br />
                <div id="CigarList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfCigarProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtCigarSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtCigarName" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="txtCigarBrand" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="txtCigarDescription" class="form-control"></textarea>
               <ul class="list-inline">             
                   <li>
                        <h6>Length</h6>
                       <asp:TextBox runat="server" ID="txtCigarLength" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Ring</h6>
                       <asp:TextBox runat="server" id="txtCigarRing" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Box Count</h6>
                       <asp:TextBox runat="server" ID="txtCigarBoxCount" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>
               <ul class="list-inline">
                   <li><h6>Box Qty</h6>
                       <asp:TextBox runat="server" ID="txtCigarBoxQty" CssClass="form-control"></asp:TextBox></li>
                    <li><h6>Single Qty</h6>
                       <asp:TextBox runat="server" ID="txtCigarSingleQty" CssClass="form-control"></asp:TextBox></li>
               </ul>
                   <ul class="list-inline">
                   <li><h6>Box Price</h6>
                       <asp:TextBox runat="server" ID="txtCigarBoxPrice" CssClass="form-control"></asp:TextBox></li>
                    <li><h6>Single Price</h6>
                       <asp:TextBox runat="server" ID="txtCigarSinglePrice" CssClass="form-control"></asp:TextBox></li>
                </ul>
               <ul class="list-inline">
                   <li><h6>Box Sale Only</h6>
                       <asp:CheckBox runat="server" ID="ckCigarIsBoxSaleOnly" />
                   </li>
                   <li><h6>Single Sale Only</h6>
                       <asp:CheckBox runat="server" ID="ckCigarIsSingleSaleOnly" />
                   </li>
                    <li><h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuCigarImage" CssClass="form-control"/>
                   </li>
               </ul>

               
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveCigar" runat="server" CssClass="btn btn-success" Text="Save Cigar" /></li>
                    <li><asp:Button id="btnDeleteCigar" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblCigarMessage"></asp:Label>
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

        $("#Title").html("Cigar Management");
      


    })
</script>
