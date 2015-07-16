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
                <input id="txtAccessorySearch" class="form-control" placeholder="Search an accessory by SKU, brand, name, or price."/>
                <label id="lblAccessorySearchMsg" style="color:red"></label>
               <br />
                <div id="AccessoryList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfAccessoryProductID"/>
           
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
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveAccessory" runat="server" CssClass="btn btn-success" Text="Save Accessory" /></li>
                    <li><asp:Button id="btnDeleteAccessory" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblAccessoryMessage"></asp:Label>
            </div>
        </div>
        <!-- end Accessories Section -->

        <div id="Apparel" class="container">
           <div class="col-lg-12">
                <h3>Apparel</h3>
                <input class="form-control" placeholder="Search apparel by SKU, brand, name, or price."/>
               <br />
                <div id="ApparelList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfApparelProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="Textarea1" class="form-control"></textarea>
                <h6>Qty</h6>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Price</h6>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Product Image</h6>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Save Accessory" /></li>
                    <li><asp:Button id="Button2" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="Label1"></asp:Label>
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
   
        GoHome();

        function GoHome() {
            $("#Title").html("Winstons Humidor <br/> <small>Business Dashboard</small>");
            $("#Home").show();
            $("#Accessories").hide();
            $("#Apparel").hide();
            $("#Cigars").hide();
            $("#Coffee").hide();
            $("#Configuration").hide();
            $("#Pipes").hide();
            $("#NewsPost").hide();
        }

        function HideAll() {
            $("#Title").html("Winstons Humidor <br/> <small>Business Dashboard</small>");
            $("#Home").hide();
            $("#Accessories").hide();
            $("#Apparel").hide();
            $("#Cigars").hide();
            $("#Coffee").hide();
            $("#Configuration").hide();
            $("#Pipes").hide();
            $("#NewsPost").hide();
        }



        $("#lnkHome").click(function () {
            GoHome();
        })

        $("#lnkAccessories").click(function () {
            HideAll();
            $("#Title").html("Accessory Management");
            $("#Accessories").show();
            //Load Accessories
            $.ajax({
                type: "POST",
                url: "Engine.asmx/GetAccessoryInventory",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    //take data and append as list item parameters to be selected by user
                    var result = data.d;
                    $("#AccessoryList").empty();
                    $.each(result, function (index, item) {

                        var content =
                            
                       "<a href='#' data-Qty='"+ item.Qty +"' data-description='" +item.Description +"' ' data-price='"+item.Price+"' data-Name='"+ item.Name +"' data-brand='"+ item.Brand +"' data-SKU='"+ item.SKU +"' data-accessory='" + item.AccessoryID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item accessoryitem'>" +
                        "<ul class='list-inline'><li>SKU: <b>"+  item.SKU +"</b></li><li>Brand: <b>"+  item.Brand +"</b></li><li>Name: <b>"+  item.Name +"</b></li><li>Price: <b>$"+  item.Price +"</b></li></ul></a>";
                        $(content).hide().appendTo("#AccessoryList").fadeIn();
                    })

                },
                failure: function (msg) {
                    alert(msg);
                },
                error: function (err) {
                    alert(err);
                }
            }) //end ajax 
        })

        $("#AccessoryList").delegate(".accessoryitem", "click", function (e) {
           
            e.preventDefault();
            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            var Brand = $(this).attr('data-brand');
            var Name = $(this).attr('data-Name');
            var Price = $(this).attr('data-price');
            var Description = $(this).attr('data-description');
            var Qty = $(this).attr('data-Qty');
           
            $("#<%=hfAccessoryProductID.ClientID%>").val(ProductID);
            $("#<%=txtAccessorySKU.ClientID%>").val(SKU);
            $("#<%=txtAccessoryName.ClientID%>").val(Name);
            $("#<%=txtAccessoryBrand.ClientID%>").val(Brand);
            $("#<%=txtAccessoryDescription.ClientID%>").val(Description);
            $("#<%=txtAccessoryQty.ClientID%>").val(Qty);
            $("#<%=txtAccessoryPrice.ClientID%>").val('$'+ Price);

        })


        $("#txtAccessorySearch").keyup(function () {
            $("#lblAccessorySearchMsg").empty();
            var AccessoryToSearch = $("#txtAccessorySearch").val();
            if ($("#txtAccessorySearch").val().length > 2) {
               

                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchAccessoryInventory",
                    data: "{SearchText:'"+ AccessoryToSearch  +"'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#AccessoryList").empty();
                            $("#lblAccessorySearchMsg").text("No products found matching search query");
                            return;
                        }


                        $("#AccessoryList").empty();
                        $.each(result, function (index, item) {

                            var content =

                           "<a href='#' data-Qty='" + item.Qty + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "' data-brand='" + item.Brand + "' data-SKU='" + item.SKU + "' data-accessory='" + item.AccessoryID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item accessoryitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#AccessoryList").fadeIn();
                        })

                    },
                    failure: function (msg) {
                        alert(msg);
                    },
                    error: function (err) {
                        alert(err);
                    }
                }) //end ajax 



            }
        })



       
        $("#lnkApparel").click(function () {
            HideAll()
            $("#Title").html("Apparel Management");
            $("#Apparel").show();
        })
        
        $("#lnkCigars").click(function () {
            HideAll()
            $("#Title").html("Cigar Management");
            $("#Cigars").show();
        })

        $("#lnkCoffee").click(function () {
            HideAll()
            $("#Title").html("Coffee Management");
            $("#Coffee").show();
        })

        $("#lnkConfiguation").click(function () {
            HideAll()
            $("#Title").html("Configuration");
            $("#Configuration").show();
        })

        $("#lnkPipes").click(function () {
            HideAll()
            $("#Title").html("Pipe Management");
            $("#Pipes").show();
        })

        $("#lnkNewsPost").click(function () {
            HideAll()
            $("#Title").html("What's New");
            $("#NewPosts").show();
        })

        $("#lnkSecurity").click(function () {
            alert("Security");
        })

    })
</script>