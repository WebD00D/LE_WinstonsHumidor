<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Coffee.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Coffee" %>

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

        
        <div id="Coffee" class="container">
           <div class="col-lg-12">
                <h3>Coffee</h3>
                <input id="txtCoffeeSearch" class="form-control" placeholder="Search coffee by SKU, brand, name, or price."/>
               <label id="lblCoffeeSearchMessage" style="color:red"></label>
               <br />
                <div id="CoffeeList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfCoffeeProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtCoffeeSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtCoffeeName" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="txtCoffeeBrand" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="txtCoffeeDescription" class="form-control"></textarea>
               <ul class="list-inline">
                   <li>
                       <h6>Price</h6>
                       <asp:TextBox runat="server" ID="txtCoffeePrice" class="form-control"></asp:TextBox></li>
                   <li>
                        <h6>Roast</h6>
                       <asp:TextBox runat="server" ID="txtCoffeeRoast" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Body</h6>
                       <asp:TextBox runat="server" id="txtCoffeeBody" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Qty</h6>
                       <asp:TextBox runat="server" ID="txtCoffeeQty" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuCoffeeImage" CssClass="form-control"/>
                   </li>
               </ul>

               
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveCoffee" runat="server" CssClass="btn btn-success" Text="Save Coffee" /></li>
                    <li><asp:Button id="btnDeleteCoffee" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblCoffeeMessage"></asp:Label>
            </div>
        </div>
      


       

    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
        $("#Title").html("Coffee Management");


        $.ajax({
            type: "POST",
            url: "Engine.asmx/GetCoffeeInventory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#CoffeeList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#' data-brand='"+ item.Brand +"' data-roast='"+ item.Roast  +"' data-body='"+ item.Body +"' data-Qty='" + item.Qty + "'  data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-coffee='" + item.CoffeeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item coffeeitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                    $(content).hide().appendTo("#CoffeeList").fadeIn();


                })

            },
            failure: function (msg) {
                alert(msg);
            },
            error: function (err) {
                alert(err);
            }
        }) //end ajax


        $("#CoffeeList").delegate(".coffeeitem", "click", function (e) {

            e.preventDefault();
            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            var Name = $(this).attr('data-Name');
            var Price = $(this).attr('data-price');
            var Description = $(this).attr('data-description');
            var Qty = $(this).attr('data-Qty');
            var Body = $(this).attr('data-body');
            var Roast = $(this).attr('data-roast');
            var Brand = $(this).attr('data-brand');


            $("#<%=hfCoffeeProductID.ClientID%>").val(ProductID);
            $("#<%=txtCoffeeSKU.ClientID%>").val(SKU);
            $("#<%=txtCoffeeName.ClientID%>").val(Name);
            $("#<%=txtCoffeeDescription.ClientID%>").val(Description);
            $("#<%=txtCoffeePrice.ClientID%>").val('$' + Price);
            $("#<%=txtCoffeeQty.ClientID%>").val(Qty);
            $("#<%=txtCoffeeRoast.ClientID%>").val(Roast);
            $("#<%=txtCoffeeBody.ClientID%>").val(Body);
            $("#<%=txtCoffeeBrand.ClientID%>").val(Brand);

        })

        $("#txtCoffeeSearch").keyup(function () {
            $("#lblCoffeeSearchMessage").empty();
            var AccessoryToSearch = $("#txtCoffeeSearch").val();
            if ($("#txtCoffeeSearch").val().length > 0) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchCoffeeInventory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#CoffeeList").empty();
                            $("#lblCoffeeSearchMessage").text("No products found matching search query");
                            return;
                        }


                        $("#CoffeeList").empty();
                        $.each(result, function (index, item) {

                            var content =

                               "<a href='#' data-roast='" + item.Roast + "' data-body='" + item.Body + "' data-Qty='" + item.Qty + "'  data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-coffee='" + item.CoffeeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item coffeeitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#CoffeeList").fadeIn();
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
