<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PipeTobacco.aspx.vb" Inherits="WinstonsHumidor_Dashboard.PipeTobacco" %>
<% %>
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

       <div id="PipeTobacco" class="container">
           <div class="col-lg-12">
                  <asp:Label  runat="server" ID="lblPipeTobaccoMessage"></asp:Label>
                <h3>Pipe Tobacco</h3>
                <input id="txtPipeTobaccoSearch" class="form-control" placeholder="Search pipe tobacco by SKU, brand, style, cut, price, or tobacco."/>
               <label id="lblPipeTobaccoSearchMessage" style="color:red"></label>
               <br />
                <div id="PipeTobaccoList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfPipeTobaccoProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtPipeTobaccoSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="txtPipeTobaccoBrand" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="txtPipeTobaccoDescription" class="form-control"></textarea>
               <ul class="list-inline">             
                   <li>
                        <h6>Tobacco</h6>
                       <asp:TextBox runat="server" ID="txtPipeTobacco" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Style</h6>
                       <asp:TextBox runat="server" id="txtPipeTobaccoStyle" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Cut</h6>
                       <asp:TextBox runat="server" ID="txtPipeTobaccoCut" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Strength</h6>
                       <asp:TextBox runat="server" ID="txtPipeTobaccoStrength" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>
               <ul class="list-inline">
                   <li><h6>Qty (in ounces)</h6>
                       <asp:TextBox runat="server" ID="txtPipeTobaccoQty" CssClass="form-control"></asp:TextBox></li>
                    <li><h6>Price (per ounce)</h6>
                       <asp:TextBox runat="server" ID="txtPipeTobaccoPrice" CssClass="form-control"></asp:TextBox></li>
               </ul>
                <ul class="list-inline">
                   <li><h6>Is On Sale</h6><asp:CheckBox runat="server" ID="ckPipeTobaccoIsOnSale"/></li>
                   
               </ul>
               <ul class="list-inline">
                   <li> <h6>Sale Price (per ounce)</h6><asp:TextBox runat="server" ID="txtPipeTobaccoSalePrice" CssClass="form-control"></asp:TextBox></li>
               </ul>
                   <ul class="list-inline">
                   <li><h6>Sale Start Date</h6>
                       <asp:TextBox runat="server" ID="txtSaleStartDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                   </li>
                    <li><h6> Sale End Date</h6>
                       <asp:TextBox runat="server" ID="txtSaleEndDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>
           <ul class="list-inline">
               <li><h6>Is Featured</h6>
               <asp:CheckBox runat="server" ID="ckPipeTobaccoIsFeatured"/></li>
           </ul>
          
               <ul class="list-inline">
                   <li><h6>Current Image</h6>
                       <div id="currentImage">

                      </div>
                   </li>
               </ul>
            

                   <ul class="list-inline">
                    <li><h6>New Image Preview</h6>
                        <div id="imgPreview" class="text-center">

                         </div>
                       <asp:FileUpload runat="server" ID="fuPipeTobaccoImage" CssClass="form-control"/>
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
                   <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSavePipeTobacco" runat="server" CssClass="btn btn-success" Text="Save Pipe Tobacco" /></li>
                    <li><asp:Button id="btnDeletePipeTobacco" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
             
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
   
        $("#Title").html("Pipe Tobacco Management");


        $("#imgPreview").hide()

        $("#<%=fuPipeTobaccoImage.ClientID%>").change(function () {
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
            url: "Engine.asmx/GetPipeTobaccoInventory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#PipeTobaccoList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#'  data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "'  data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "'  data-featured='" + item.IsFeatured + "' data-strength='" + item.Strength + "' data-cut='" + item.Cut + "' data-style='" + item.Style + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-tobacco='" + item.Tobacco + "'  data-SKU='" + item.SKU + "' data-pipetobacco='" + item.PipeTobaccoID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipetobaccoitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Tobacco: <b>" + item.Tobacco + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                    $(content).hide().appendTo("#PipeTobaccoList").fadeIn();

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
        var oldtobacco;
        var oldbrand;
        var olddescription;
        var oldqty;
        var oldprice;
        var oldcut;
        var oldstyle;
        var oldstrength;
        var oldfeatured;
        var featuredstate;
        var oldisonsale;
        var oldsaleprice;
        var oldshowinstore;
        var oldreleasedate;
        var oldsalestart;
        var oldsaleend;

        $("#PipeTobaccoList").delegate(".pipetobaccoitem", "click", function (e) {

            e.preventDefault();
            if ($("#<%=hfPipeTobaccoProductID.ClientID%>").val().length != 0) {
                var changemade = false;
                if ($("#<%=txtPipeTobaccoSKU.ClientID%>").val() != oldsku) { changemade = true; }
                if ($("#<%=txtPipeTobacco.ClientID%>").val() != oldtobacco) { changemade = true; }
                if ($("#<%=txtPipeTobaccoBrand.ClientID%>").val() != oldbrand) { changemade = true; }
                if ($("#<%=txtPipeTobaccoDescription.ClientID%>").val() != olddescription) { changemade = true; }
                if ($("#<%=txtPipeTobaccoQty.ClientID%>").val() != oldqty) { changemade = true; }
                if ($("#<%=txtPipeTobaccoPrice.ClientID%>").val() != '$' + oldprice) { changemade = true; }
                if ($("#<%=txtPipeTobaccoCut.ClientID%>").val() != oldcut) { changemade = true; }
                if ($("#<%=txtPipeTobaccoStyle.ClientID%>").val() != oldstyle) { changemade = true; }
                if ($("#<%=txtPipeTobaccoStrength.ClientID%>").val() != oldstrength) { changemade = true; }
                if ($("#<%=fuPipeTobaccoImage.ClientID%>").val() != "") { changemade = true; }
                if ($("#<%=txtPipeTobaccoSalePrice.ClientID%>").val() != '$' + oldsaleprice) { changemade = true; }
                if ($("#<%=ddlShowItem.ClientID%>").val() != oldshowinstore) { changemade = true; }
                if ($("#<%=txtReleaseDate.ClientID%>").val() != oldreleasedate) { changemade = true; }
                if ($("#<%=txtSaleStartDate.ClientID%>").val() != oldsalestart) { changemade = true; }
                if ($("#<%=txtSaleEndDate.ClientID%>").val() != oldsaleend) { changemade = true; }

                if ($("#<%=ckPipeTobaccoIsFeatured.ClientID%>").is(":checked")) {
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
                if ($("#<%=ckPipeTobaccoIsOnSale.ClientID%>").is(":checked")) {
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
                        var fileUpload = document.getElementById("<%=fuPipeTobaccoImage.ClientID%>");
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
            var currentImage = " <img height='200' width='200' src='PipeTobaccoImageHandler.ashx?id=" + ProductID + "' class='img-responsive center-block'/> "
            $(currentImage).appendTo("#currentImage")

            var SKU = $(this).attr("data-SKU");
            oldsku = SKU;
            var Tobacco = $(this).attr('data-tobacco');
            oldtobacco = Tobacco;
            var Brand = $(this).attr('data-brand');
            oldbrand = Brand;
            var Description = $(this).attr('data-description');
            olddescription = Description;
            var Qty = $(this).attr('data-qty');
            oldqty = Qty;
            var price = $(this).attr('data-price');
            oldprice = price;
            var Cut = $(this).attr('data-cut');
            oldcut = Cut;
            var Style = $(this).attr('data-style');
            oldstyle = Style;
            var Strength = $(this).attr('data-strength');
            oldstrength = Strength;
            var Featured = $(this).attr('data-featured');
            oldfeatured = Featured;
            var IsOnSale = $(this).attr('data-isonsale');
            oldisonsale = IsOnSale
            var SalePrice = $(this).attr('data-saleprice')
            oldsaleprice = SalePrice
            var ShowInStore = $(this).attr('data-showinstore')
            var ReleaseDate = $(this).attr('data-releasedate')
            oldreleasedate = ReleaseDate
            var SaleStart = $(this).attr('data-salestart');
            oldsalestart = SaleStart
            var SaleEnd = $(this).attr('data-saleend');
            oldsaleend = SaleEnd

            $("#<%=hfPipeTobaccoProductID.ClientID%>").val(ProductID);
            $("#<%=txtPipeTobaccoSKU.ClientID%>").val(SKU);
            $("#<%=txtPipeTobacco.ClientID%>").val(Tobacco);
            $("#<%=txtPipeTobaccoBrand.ClientID%>").val(Brand);
            $("#<%=txtPipeTobaccoDescription.ClientID%>").val(Description);
            $("#<%=txtPipeTobaccoQty.ClientID%>").val(Qty);
            $("#<%=txtPipeTobaccoPrice.ClientID%>").val('$' + price);
            $("#<%=txtPipeTobaccoStyle.ClientID%>").val(Style);
            $("#<%=txtPipeTobaccoStrength.ClientID%>").val(Strength);
            $("#<%=txtPipeTobaccoCut.ClientID%>").val(Cut);
            $("#<%=txtPipeTobaccoSalePrice.ClientID%>").val('$' + SalePrice)
            $("#<%=txtReleaseDate.ClientID%>").val(ReleaseDate);
            $("#<%=txtSaleStartDate.ClientID%>").val(SaleStart);
            $("#<%=txtSaleEndDate.ClientID%>").val(SaleEnd);

            if (Featured == 'True') {
                $("#<%=ckPipeTobaccoIsFeatured.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckPipeTobaccoIsFeatured.ClientID%>").prop("checked", false);
            }
            if (IsOnSale == 'True') {
                $("#<%=ckPipeTobaccoIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckPipeTobaccoIsOnSale.ClientID%>").prop("checked", false);
            }

            if (ShowInStore == 'True') {
                $("#<%=ddlShowItem.ClientID%>").val(1)
                oldshowinstore = 1
            } else {
                $("#<%=ddlShowItem.ClientID%>").val(0)
                oldshowinstore = 0
            }

        })


        $("#txtPipeTobaccoSearch").keyup(function () {
            $("#lblPipeTobaccoSearchMessage").empty();
            var AccessoryToSearch = $("#txtPipeTobaccoSearch").val();
            if ($("#txtPipeTobaccoSearch").val().length > 0) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchPipeTobaccoInventory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#PipeTobaccoList").empty();
                            $("#lblPipeTobaccoSearchMessage").text("No products found matching search query");
                            return;
                        }


                        $("#PipeTobaccoList").empty();
                        $.each(result, function (index, item) {

                            var content =
                            "<a href='#'  data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "'  data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "'  data-featured='" + item.IsFeatured + "' data-strength='" + item.Strength + "' data-cut='" + item.Cut + "' data-style='" + item.Style + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-tobacco='" + item.Tobacco + "'  data-SKU='" + item.SKU + "' data-pipetobacco='" + item.PipeTobaccoID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipetobaccoitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Tobacco: <b>" + item.Tobacco + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#PipeTobaccoList").fadeIn();
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
