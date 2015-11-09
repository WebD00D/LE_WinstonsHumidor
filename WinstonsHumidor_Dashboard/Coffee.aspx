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
                 <li><a href="News.aspx">Blog / Events Post</a></li>
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
                      <li><a id="lnkSecurity" href="Security.aspx">Security</a></li>
                      <li><a id="lnkConfiguation" href="Configuration.aspx">Configuration</a></li>
                  </ul>
              </li>
              <li><a href="Login.aspx">Sign Out</a></li>
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
                <asp:Label  runat="server" ID="lblCoffeeMessage"></asp:Label>
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
                
               </ul>
               <ul class="list-inline">
                   <li><h6>Is On Sale</h6><asp:CheckBox runat="server" ID="ckCoffeeIsOnSale"/></li>
                   
               </ul>
               <ul class="list-inline">
                   <li> <h6>Sale Price</h6><asp:TextBox runat="server" ID="txtCoffeeSalePrice" CssClass="form-control"></asp:TextBox></li>
               </ul>
                   <ul class="list-inline">
                   <li><h6>Sale Start Date</h6>
                       <asp:TextBox runat="server" ID="txtSaleStartDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                   </li>
                    <li><h6> Sale End Date</h6>
                       <asp:TextBox runat="server" ID="txtSaleEndDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>
               <h6>Is Featured</h6>
                <asp:CheckBox runat="server" ID="ckCoffeeIsFeatured"/>
                <br />

               <h6><b>** To keep up with retina and other high res displays, it is recommended that images be  1080 x 1080 </b></h6>
               <ul class="list-inline">
                   <li>
                       <h6>Current Image</h6>
                       <div id="currentImage">

                      </div>
                   </li>
                   </ul>
               <ul class="list-inline">
                      <li>
                       <h6>New Image Preview</h6>
                          <div id="imgPreview" class="text-center">

                         </div>
                       <asp:FileUpload runat="server" ID="fuCoffeeImage" CssClass="form-control"/>
                   </li>
               </ul>
                 <ul class="list-inline">
                     <li><h6>Publishing Settings</h6>
                       <asp:DropDownList ID="ddlShowItem" runat="server" CssClass="form-control">
                           <asp:ListItem Value="1">Show in Store</asp:ListItem>
                           <asp:ListItem Value="0">Hide from Store</asp:ListItem>
                       </asp:DropDownList>
                    
                   </li>
                </ul>
               <h6><b>** To release immediately, leave release date field blank.</b></h6>
               <h6><b>** Keep in mind, when 'Publishing Settings' are set to hide from store, any item with a scheduled release date will ignored and not published.</b></h6>
               <ul class="list-inline">
                      <li>
                       <h6>Release Date</h6>
                       <asp:TextBox runat="server" ID="txtReleaseDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        
                       </li>
                     
                      
               </ul>
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveCoffee" runat="server" CssClass="btn btn-success" Text="Save Coffee" /></li>
                    <li><asp:Button id="btnDeleteCoffee" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
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
   
        $("#Title").html("Coffee Management");

        $("#imgPreview").hide()

        $("#<%=fuCoffeeImage.ClientID%>").change(function () {
            $("#imgPreview").empty();
            $("#imgPreview").show();
            $("#imgPreview").append("<img />");
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#imgPreview img").attr("src", e.target.result);
                $("#imgPreview img").attr("height", "100px")
                $("#imgPreview img").attr("width", "200px")
            }
            reader.readAsDataURL($(this)[0].files[0]);
        })


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

                     "<a href='#' data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "' data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "'  data-featured='" + item.IsFeatured + "' data-brand='" + item.Brand + "' data-roast='" + item.Roast + "' data-body='" + item.Body + "' data-Qty='" + item.Qty + "'  data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-coffee='" + item.CoffeeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item coffeeitem'>" +
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

        var oldsku;
        var oldname;
        var oldprice;
        var olddescription;
        var oldqty;
        var oldbody;
        var oldroast;
        var oldbrand;
        var oldfeatured;
        var featuredState;
        var oldisonsale;
        var oldsaleprice;
        var oldshowinstore;
        var oldreleasedate;
        var oldsalestart;
        var oldsaleend;

        $("#CoffeeList").delegate(".coffeeitem", "click", function (e) {

            e.preventDefault();

            if ($("#<%=hfCoffeeProductID.ClientID%>").val().length != 0) {

                var changemade = false;

                if ($("#<%=txtCoffeeSKU.ClientID%>").val() != oldsku) { changemade = true; }
                if ($("#<%=txtCoffeeName.ClientID%>").val() != oldname) { changemade = true; }
                if ($("#<%=txtCoffeePrice.ClientID%>").val() != '$' + oldprice) { changemade = true; }
                if ($("#<%=txtCoffeeDescription.ClientID%>").val() != olddescription) { changemade = true; }
                if ($("#<%=txtCoffeeQty.ClientID%>").val() != oldqty) { changemade = true; }
                if ($("#<%=txtCoffeeBody.ClientID%>").val() != oldbody) { changemade = true; }
                if ($("#<%=txtCoffeeRoast.ClientID%>").val() != oldroast) { changemade = true; }
                if ($("#<%=txtCoffeeBrand.ClientID%>").val() != oldbrand) { changemade = true; }
                if ($("#<%=fuCoffeeImage.ClientID%>").val() != "") { changemade = true; }
                if ($("#<%=txtCoffeeSalePrice.ClientID%>").val() != '$' + oldsaleprice) { changemade = true; }
                if ($("#<%=txtReleaseDate.ClientID%>").val() != oldreleasedate) { changemade = true; }
                if ($("#<%=txtSaleStartDate.ClientID%>").val() != oldsalestart) { changemade = true; }
                if ($("#<%=txtSaleEndDate.ClientID%>").val() != oldsaleend) { changemade = true; }

                if ($("#<%=ddlShowItem.ClientID%>").val() != oldshowinstore) {
                    changemade = true;
                }

                if ($("#<%=ckCoffeeIsFeatured.ClientID%>").is(":checked")) {
                    featuredState = 'Y'
                } else {
                    featuredState = 'N'
                }
                if (oldfeatured == 'True') {
                    if (featuredState == 'N') {
                        changemade = true;
                    }
                }
                if (oldfeatured == 'False') {
                    if (featuredState == 'Y') {
                        changemade = true;
                    }
                }

                var currentsalestate;
                if ($("#<%=ckCoffeeIsOnSale.ClientID%>").is(":checked")) {
                    currentsalestate = 'Y'
                } else {
                    currentsalestate = 'N'
                }

                if (oldisonsale == 'True') {
                    if (currentsalestate == 'N') {
                        changemade = true;
                    }
                }
                if (oldisonsale == 'False') {
                    if (currentsalestate == 'Y') {
                        changemade = true;
                    }
                }


                if (changemade == true) {
                    if (confirm('Changes have been made to the current item. If you wish to save, please click "Cancel", and save your changes. To ignore, please click "OK".')) {
                        var fileUpload = document.getElementById("<%=fuCoffeeImage.ClientID%>");
                        var id = fileUpload.id;
                        var name = fileUpload.name;
                        var newFileUpload = document.createElement("INPUT");
                        newFileUpload.type = "FILE";
                        fileUpload.parentNode.insertBefore(newFileUpload, fileUpload.nextSibling);
                        fileUpload.parentNode.removeChild(fileUpload);
                        newFileUpload.id = id;
                        newFileUpload.name = name;
                    } else {
                        return;
                    }
                }

            } else {
            // The user has clicked an item for the firs time sice the 
            // page has loaded. we don't want to call the save method if no product id has been set. 
            }
          
            var ProductID = $(this).attr('id');

            $("#currentImage").empty();
            var currentImage = " <img height='200' width='200' src='CoffeeImageHandler.ashx?id=" + ProductID + "' class='img-responsive center-block'/> "
            $(currentImage).appendTo("#currentImage")


            var SKU = $(this).attr("data-SKU");
            oldsku = SKU;
            var Name = $(this).attr('data-Name');
            oldname = Name;
            var Price = $(this).attr('data-price');
            oldprice = Price;
            var Description = $(this).attr('data-description');
            olddescription = Description;
            var Qty = $(this).attr('data-Qty');
            oldqty = Qty;
            var Body = $(this).attr('data-body');
            oldbody = Body;
            var Roast = $(this).attr('data-roast');
            oldroast = Roast;
            var Brand = $(this).attr('data-brand');
            oldbrand = Brand;
            var Featured = $(this).attr('data-featured');
            oldfeatured = Featured;
            var IsOnSale = $(this).attr('data-isonsale');
            oldisonsale = IsOnSale
            var SalePrice = $(this).attr('data-saleprice')
            oldsaleprice = SalePrice


            var ReleaseDate = $(this).attr('data-releasedate')
            oldreleasedate = ReleaseDate


            var SaleStart = $(this).attr('data-salestart');
            oldsalestart = SaleStart
            var SaleEnd = $(this).attr('data-saleend');
            oldsaleend = SaleEnd

            var ShowInStore = $(this).attr('data-showinstore')
       

            $("#<%=hfCoffeeProductID.ClientID%>").val(ProductID);
            $("#<%=txtCoffeeSKU.ClientID%>").val(SKU);
            $("#<%=txtCoffeeName.ClientID%>").val(Name);
            $("#<%=txtCoffeeDescription.ClientID%>").val(Description);
            $("#<%=txtCoffeePrice.ClientID%>").val('$' + Price);
            $("#<%=txtCoffeeQty.ClientID%>").val(Qty);
            $("#<%=txtCoffeeRoast.ClientID%>").val(Roast);
            $("#<%=txtCoffeeBody.ClientID%>").val(Body);
            $("#<%=txtCoffeeBrand.ClientID%>").val(Brand);
            $("#<%=txtCoffeeSalePrice.ClientID%>").val('$' + SalePrice)

            $("#<%=txtReleaseDate.ClientID%>").val(ReleaseDate);
            $("#<%=txtSaleStartDate.ClientID%>").val(SaleStart);
            $("#<%=txtSaleEndDate.ClientID%>").val(SaleEnd);

            if (Featured == 'True') {
                $("#<%=ckCoffeeIsFeatured.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCoffeeIsFeatured.ClientID%>").prop("checked", false);
            }
            if (IsOnSale == 'True') {
                $("#<%=ckCoffeeIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCoffeeIsOnSale.ClientID%>").prop("checked", false);
            }

            if (ShowInStore == 'True') {
                $("#<%=ddlShowItem.ClientID%>").val(1)
                oldshowinstore = 1
            } else {
                $("#<%=ddlShowItem.ClientID%>").val(0)
                oldshowinstore = 0
            }
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

                                 "<a href='#' data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "' data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "'  data-featured='" + item.IsFeatured + "' data-brand='" + item.Brand + "' data-roast='" + item.Roast + "' data-body='" + item.Body + "' data-Qty='" + item.Qty + "'  data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-coffee='" + item.CoffeeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item coffeeitem'>" +
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
