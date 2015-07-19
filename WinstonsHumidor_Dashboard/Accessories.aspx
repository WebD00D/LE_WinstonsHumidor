<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Accessories.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Accessories" %>

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
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
        <!-- end Accessories Section -->
    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
     
            $("#Title").html("Accessory Management");
           
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

                    if (result == 0) {
                        return;
                    } else {

                        $.each(result, function (index, item) {
                          
  
                            var content =

                            "<a href='#' data-Qty='" + item.Qty + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "' data-brand='" + item.Brand + "' data-SKU='" + item.SKU + "' data-accessory='" + item.AccessoryID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item accessoryitem'>" +
                    "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#AccessoryList").fadeIn();
                        })
                    }
                },
                failure: function (msg) {
                    alert(msg);
                },
                error: function (err) {
                    alert(err);
                }
            }) //end ajax 
       

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


    })
</script>
