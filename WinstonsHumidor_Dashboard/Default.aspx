<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WinstonsHumidor_Dashboard._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
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
                      <li><a id="lnkAccessories" href="#">Accessories</a></li>
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

        <div id="Home" class="container">
            <div class="col-lg-12">
                <h3>Order Management<br />
                   </h3>
                Do this part last
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Home Section -->

        <div id="Accessories" class="container">
            <div class="col-lg-12">
                <h3>Accessories</h3>
                <input class="form-control" placeholder="Search an accessory by SKU, brand, name, or price."/>
                <br />
                <div class="list-group" style="overflow-y:scroll;max-height:200px">
                    <a href="#" class="list-group-item">
                        <ul class="list-inline">
                            <li><b>SKU:</b> 554433</li>
                            <li><b>Brand:</b> Xikar</li>
                            <li><b>Name:</b> Blue Lighter</li>
                            <li><b>Price:</b> $100.50</li>
                        </ul>
                    </a>
                     <a href="#" class="list-group-item">
                        <ul class="list-inline">
                            <li><b>SKU:</b> 554433</li>
                            <li><b>Brand:</b> Xikar</li>
                            <li><b>Name:</b> Blue Lighter</li>
                            <li><b>Price:</b> $100.50</li>
                        </ul>
                    </a>
                     <a href="#" class="list-group-item">
                        <ul class="list-inline">
                            <li><b>SKU:</b> 554433</li>
                            <li><b>Brand:</b> Xikar</li>
                            <li><b>Name:</b> Blue Lighter</li>
                            <li><b>Price:</b> $100.50</li>
                        </ul>
                    </a>

                </div>
               
                <h6>Product ID</h6>
                <asp:TextBox ID="txtAccessoryProductID" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                <h6>SKU</h6>
                <asp:TextBox ID="txtAccessorySKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtAccessoryName" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="txtAccessoryBrand" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="txtAccessoryDescription" class="form-control"></textarea>
                <h6>Qty</h6>
                <asp:TextBox ID="txtAccessoryQty" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Price</h6>
                <asp:TextBox ID="txtAccessoryPrice" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Product Image</h6>
                <asp:FileUpload ID="fuAccessoryImage" runat="server" CssClass="form-control" />
                <br />
                <asp:Button ID="btnSaveAccessory" runat="server" CssClass="btn btn-success" Text="Save Accessory" />
                <br />
                <asp:Label runat="server" ID="lblAccessoryMessage"></asp:Label>
            </div>
        </div>
        <!-- end Accessories Section -->

        <div id="Apparel" class="container">
            <div class="col-lg-12">
                <h3>Apparel<br />
                </h3>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Apparel Section -->

       <div id="Cigars" class="container">
            <div class="col-lg-12">
                <h3>Cigars<br />
                </h3>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Cigars Section -->

        <div id="Coffee" class="container">
            <div class="col-lg-12">
                <h3>Coffee<br />
                </h3>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Coffee Section -->

        <div id="Configuration" class="container">
            <div class="col-lg-12">
                <h3>Configuration<br />
                </h3>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Configuration Section -->

        <div id="Pipes" class="container">
            <div class="col-lg-12">
                <h3>Pipes<br />
                </h3>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Pipes Section -->

        <div id="NewsPost" class="container">
            <div class="col-lg-12">
                <h3>Whats new?<br />
                    <small>Keep your customers up to date with any events, new product releases, and more!</small></h3>
                    <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" ToolbarMode="Ribbon" Width="1137px"></dx:ASPxHtmlEditor>
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end News Post Section -->

    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {





       
        $("#Title").html("Winstons Humidor <br/> <small>Business Dashboard</small>");
        $("#Home").show();
        //$("#Accessories").hide();
        //$("#Apparel").hide();
        //$("#Cigars").hide();
        //$("#Coffee").hide();
        //$("#Configuration").hide();
        //$("#Pipes").hide();
        //$("#NewsPost").hide();

        $("#lnkHome").click(function () {
            alert("Home");
        })

        $("#lnkAccessories").click(function () {
            alert("Accessories");
        })

        $("#lnkApparel").click(function () {
            alert("Apparel");
        })
        
        $("#lnkCigars").click(function () {
            alert("Cigars");
        })

        $("#lnkCoffee").click(function () {
            alert("Coffee");
        })

        $("#lnkConfiguation").click(function () {
            alert("Config");
        })

        $("#lnkPipes").click(function () {
            alert("Pipes");
        })

        $("#lnkNewsPost").click(function () {
            alert("NewsPosts");
        })

        $("#lnkSecurity").click(function () {
            alert("Security");
        })

    })
</script>