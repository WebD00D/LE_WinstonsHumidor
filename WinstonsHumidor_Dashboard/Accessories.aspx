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

   
        <!-- end Home Section -->

        <div id="Accessories" class="container">
            <div class="col-lg-12">
                <h3>Accessories</h3>
                <input id="txtAccessorySearch" class="form-control" placeholder="Search an accessory by SKU, brand, name, or price."/>
                <label id="lblAccessorySearchMsg" style="color:red"></label>
               <br />
                <div id="AccessoryList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfAccessoryProductID"/>
                <asp:HiddenField runat="server" ID="hfNextUpProductID" />
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
             
                        <h6>Is On Sale</h6>
                        <asp:CheckBox ID="ckAccessoryIsOnSale" runat="server"/>
               
                    
                        <h6>Sale Price</h6>
                        <asp:TextBox ID="txtAccessorySalePrice" runat="server" CssClass="form-control"></asp:TextBox>
                    
               
                <h6>Product Image</h6>
                <asp:FileUpload ID="fuAccessoryImage" runat="server" CssClass="form-control" />
                <h6>Featured Item</h6>
                <asp:CheckBox ID="ckAccessoryFeaturedItem" runat="server"/>
                <br />
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

                            "<a href='#' data-isonsale='"+ item.IsOnSale +"' data-saleprice='"+ item.SalePrice +"' data-featured='" + item.IsFeatured + "' data-Qty='" + item.Qty + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "' data-brand='" + item.Brand + "' data-SKU='" + item.SKU + "' data-accessory='" + item.AccessoryID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item accessoryitem'>" +
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
       
            var oldsku;
            var oldname;
            var oldbrand;
            var olddescription;
            var oldqty;
            var oldprice;
            var oldfeatured;
            var newfeatured;
            var oldisonsale;
            var oldsaleprice;
            
        $("#AccessoryList").delegate(".accessoryitem", "click", function (e) {
           
       if ($("#<%=hfAccessoryProductID.ClientID%>").val().length != 0) {
                // a value has been set
           e.preventDefault();
           var changemade = false;

           if ($("#<%=txtAccessorySKU.ClientID%>").val() != oldsku) {
               changemade = true;
           }
       
           if ($("#<%=txtAccessoryName.ClientID%>").val() != oldname) {
               changemade = true;
           }
          
           if ($("#<%=txtAccessoryBrand.ClientID%>").val() != oldbrand) {
               changemade = true;
           }
           
           if ($("#<%=txtAccessoryDescription.ClientID%>").val() != olddescription) {
               changemade = true;
           }
         
           if ($("#<%=txtAccessoryQty.ClientID%>").val() != oldqty) {
               changemade = true;
           }
           
           if ($("#<%=txtAccessoryPrice.ClientID%>").val() != '$' + oldprice) {
               changemade = true;
           }
          

           var currentstate;
           if ($("#<%=ckAccessoryFeaturedItem.ClientID%>").is(":checked")) {
               currentstate = 'Y'
           } else {
               currentstate = 'N'
           }

           if (oldfeatured == 'True') {
               if (currentstate == 'N') {
                   changemade = true;
               }
           }
           if (oldfeatured == 'False') {
               if (currentstate == 'Y') {
                   changemade = true;
               }
           }


           var currentsalestate;
           if ($("#<%=ckAccessoryIsOnSale.ClientID%>").is(":checked")) {
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


          
           if ($("#<%=fuAccessoryImage.ClientID%>").val() != "") {
               changemade = true;
           }
            
         
           if (changemade == true) {
               if (confirm('Changes have been made to the current item. If you wish to save, please click "Cancel", and save your changes. To ignore, please click "OK".')) {
                   var fileUpload = document.getElementById("<%=fuAccessoryImage.ClientID%>");
                   var id = fileUpload.id;
                   var name = fileUpload.name;

                   //Create a new FileUpload element.
                   var newFileUpload = document.createElement("INPUT");
                   newFileUpload.type = "FILE";

                   //Append it next to the original FileUpload.
                   fileUpload.parentNode.insertBefore(newFileUpload, fileUpload.nextSibling);

                   //Remove the original FileUpload.
                   fileUpload.parentNode.removeChild(fileUpload);

                   //Set the Id and Name to the new FileUpload.
                   newFileUpload.id = id;
                   newFileUpload.name = name;
                  // return false;
                   // return;
                  
               }
               else {
                   return;
               }
           }


            } else {
                // The user has clicked an item for the firs time sice the 
                // page has loaded. we don't want to call the save method if no product id has been set. 
            }

       
            // save current selection before showing selected item data
        
            e.preventDefault();
            var ProductID = $(this).attr('id');

            var SKU = $(this).attr("data-SKU");
            oldsku = SKU
           
            var Brand = $(this).attr('data-brand');
            oldbrand = Brand

            var Name = $(this).attr('data-Name');
            oldname = Name

            var Price = $(this).attr('data-price');
            oldprice = Price

            var Description = $(this).attr('data-description');
            olddescription = Description

            var Qty = $(this).attr('data-Qty');
            oldqty = Qty

            var Featured = $(this).attr('data-featured');
            oldfeatured = Featured


            var IsOnSale = $(this).attr('data-isonsale');
            oldisonsale = IsOnSale

            var SalePrice = $(this).attr('data-saleprice')
            oldsaleprice = SalePrice
           
            $("#<%=hfAccessoryProductID.ClientID%>").val(ProductID);
            $("#<%=txtAccessorySKU.ClientID%>").val(SKU);
            $("#<%=txtAccessoryName.ClientID%>").val(Name);
            $("#<%=txtAccessoryBrand.ClientID%>").val(Brand);
            $("#<%=txtAccessoryDescription.ClientID%>").val(Description);
            $("#<%=txtAccessoryQty.ClientID%>").val(Qty);
            $("#<%=txtAccessoryPrice.ClientID%>").val('$' + Price);
            $("#<%=txtAccessorySalePrice.ClientID%>").val('$' + SalePrice)

     

            if (Featured == 'True') {
                $("#<%=ckAccessoryFeaturedItem.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckAccessoryFeaturedItem.ClientID%>").prop("checked", false);
            }

            if (IsOnSale == 'True') {
                $("#<%=ckAccessoryIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckAccessoryIsOnSale.ClientID%>").prop("checked", false);
            }

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

                                   "<a href='#' data-featured='" + item.IsFeatured + "' data-Qty='" + item.Qty + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "' data-brand='" + item.Brand + "' data-SKU='" + item.SKU + "' data-accessory='" + item.AccessoryID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item accessoryitem'>" +
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
