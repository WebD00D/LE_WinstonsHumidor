﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Pipes.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Pipes" %>

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

                
        <div id="Pipes" class="container">
           <div class="col-lg-12">
                  <asp:Label  runat="server" ID="lblPipeMessage"></asp:Label>
                <h3>Pipes</h3>
                <input id="txtPipeSearch" class="form-control" placeholder="Search pipes by SKU, brand, name, price, material, shape, and style."/>
               <label id="lblPipeSearchMessage" style="color:red"></label>
               <br />
                <div id="PipeList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfPipeProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtPipeSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtPipeName" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Brand</h6>
                <asp:TextBox ID="txtPipeBrand" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Description</h6>
                <textarea runat="server" id="txtPipeDescription" class="form-control"></textarea>
               <ul class="list-inline">             
                   <li>
                        <h6>Material</h6>
                       <asp:TextBox runat="server" ID="txtPipeMaterial" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Body Shape</h6>
                       <asp:TextBox runat="server" id="txtPipeBodyShape" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Stem Shape</h6>
                       <asp:TextBox runat="server" ID="txtPipeStemShape" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Bowl Finish</h6>
                       <asp:TextBox runat="server" ID="txtPipeBowlFinish" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>
               <ul class="list-inline">
                   <li><h6>Qty </h6>
                       <asp:TextBox runat="server" ID="txtPipeQty" CssClass="form-control"></asp:TextBox></li>
                    <li><h6>Price </h6>
                       <asp:TextBox runat="server" ID="txtPipePrice" CssClass="form-control"></asp:TextBox></li>
               </ul>
                 <ul class="list-inline">
                   <li><h6>Is On Sale</h6><asp:CheckBox runat="server" ID="ckPipesIsOnSale"/></li>
                   
               </ul>
               <ul class="list-inline">
                   <li> <h6>Sale Price</h6><asp:TextBox runat="server" ID="txtPipesSalePrice" CssClass="form-control"></asp:TextBox></li>
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
                   <li>  <h6>Is Featured</h6>
               <asp:CheckBox runat="server" ID="ckPipesIsFeatured"/></li>
               </ul>
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
                    <li><h6>New Image Preview</h6>
                         <div id="imgPreview" class="text-center">

                         </div>
                       <asp:FileUpload runat="server" ID="fuPipeImage" CssClass="form-control"/>
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
                    <li>  <asp:Button ID="btnSavePipe" runat="server" CssClass="btn btn-success" Text="Save Pipe" /></li>
                    <li><asp:Button id="btnDeletePipe" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
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
        $("#Title").html("Pipe Management");
      

        $("#imgPreview").hide()

        $("#<%=fuPipeImage.ClientID%>").change(function () {
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
            url: "Engine.asmx/GetPipeInventory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#PipeList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#' data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "' data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "'  data-featured='" + item.IsFeatured + "' data-material='" + item.Material + "' data-bodyshape='" + item.BodyShape + "' data-stemshape='" + item.StemShape + "' data-bowlfinish='" + item.BowlFinish + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-pipe='" + item.PipeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipeitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                    $(content).hide().appendTo("#PipeList").fadeIn();

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
        var oldbrand;
        var olddescription;
        var oldqty;
        var oldprice;
        var oldbowlfinish;
        var oldstemshape;
        var oldbodyshape;
        var oldmaterial;
        var oldfeatured;
        var featuredstate;
        var oldisonsale;
        var oldsaleprice;
        var oldshowinstore;
        var oldreleasedate;
        var oldsalestart;
        var oldsaleend;

        $("#PipeList").delegate(".pipeitem", "click", function (e) {

            e.preventDefault();


            if ($("#<%=hfPipeProductID.ClientID%>").val().length != 0) {

                var changemade = false;

                if ($("#<%=txtPipeSKU.ClientID%>").val() != oldsku) { changemade = true; }
                if ($("#<%=txtPipeName.ClientID%>").val() != oldname) { changemade = true; }
                if ($("#<%=txtPipePrice.ClientID%>").val() != '$' + oldprice) { changemade = true; }
                if ($("#<%=txtPipeDescription.ClientID%>").val() != olddescription) { changemade = true; }
                if ($("#<%=txtPipeQty.ClientID%>").val() != oldqty) { changemade = true; }
                if ($("#<%=txtPipeBrand.ClientID%>").val() != oldbrand) { changemade = true; }
                if ($("#<%=txtPipeBowlFinish.ClientID%>").val() != oldbowlfinish) { changemade = true; }
                if ($("#<%=txtPipeBodyShape.ClientID%>").val() != oldbodyshape) { changemade = true; }
                if ($("#<%=txtPipeStemShape.ClientID%>").val() != oldstemshape) { changemade = true; }
                if ($("#<%=txtPipeMaterial.ClientID%>").val() != oldmaterial) { changemade = true; }
                if ($("#<%=fuPipeImage.ClientID%>").val() != "") { changemade = true; }
                if ($("#<%=ddlShowItem.ClientID%>").val() != oldshowinstore) {
                    changemade = true;
                }
                if ($("#<%=txtReleaseDate.ClientID%>").val() != oldreleasedate) { changemade = true; }
                if ($("#<%=txtSaleStartDate.ClientID%>").val() != oldsalestart) { changemade = true; }
                if ($("#<%=txtSaleEndDate.ClientID%>").val() != oldsaleend) { changemade = true; }


                if ($("#<%=txtPipesSalePrice.ClientID%>").val() != '$' + oldsaleprice) { changemade = true; }


                if ($("#<%=ckPipesIsFeatured.ClientID%>").is(":checked")) {
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
                if ($("#<%=ckPipesIsOnSale.ClientID%>").is(":checked")) {
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
                        var fileUpload = document.getElementById("<%=fuPipeImage.ClientID%>");
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
            var currentImage = " <img height='200' width='200' src='PipeImageHandler.ashx?id=" + ProductID + "' class='img-responsive center-block'/> "
            $(currentImage).appendTo("#currentImage")

            var SKU = $(this).attr("data-SKU");
            oldsku = SKU
            var Name = $(this).attr('data-Name');
            oldname = Name;
            var Brand = $(this).attr('data-brand');
            oldbrand = Brand;
            var Description = $(this).attr('data-description');
            olddescription = Description;
            var Qty = $(this).attr('data-qty');
            oldqty = Qty;
            var price = $(this).attr('data-price');
            oldprice = price;
            var BowlFinish = $(this).attr('data-bowlfinish');
            oldbowlfinish = BowlFinish;
            var StemShape = $(this).attr('data-stemshape');
            oldstemshape = StemShape;
            var BodyShape = $(this).attr('data-bodyshape');
            oldbodyshape = BodyShape;
            var Material = $(this).attr('data-material');
            oldmaterial = Material;
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
          
            $("#<%=hfPipeProductID.ClientID%>").val(ProductID);
            $("#<%=txtPipeSKU.ClientID%>").val(SKU);
            $("#<%=txtPipeName.ClientID%>").val(Name);
            $("#<%=txtPipeBrand.ClientID%>").val(Brand);
            $("#<%=txtPipeDescription.ClientID%>").val(Description);
            $("#<%=txtPipeQty.ClientID%>").val(Qty);
            $("#<%=txtPipePrice.ClientID%>").val('$' + price);
            $("#<%=txtPipeBowlFinish.ClientID%>").val(BowlFinish);
            $("#<%=txtPipeStemShape.ClientID%>").val(StemShape);
            $("#<%=txtPipeBodyShape.ClientID%>").val(BodyShape);
            $("#<%=txtPipeMaterial.ClientID%>").val(Material);
            $("#<%=txtPipesSalePrice.ClientID%>").val('$' + SalePrice)
            $("#<%=txtReleaseDate.ClientID%>").val(ReleaseDate);
            $("#<%=txtSaleStartDate.ClientID%>").val(SaleStart);
            $("#<%=txtSaleEndDate.ClientID%>").val(SaleEnd);

            if (Featured == 'True') {
                $("#<%=ckPipesIsFeatured.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckPipesIsFeatured.ClientID%>").prop("checked", false);
            }
            if (IsOnSale == 'True') {
                $("#<%=ckPipesIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckPipesIsOnSale.ClientID%>").prop("checked", false);
            }
            if (ShowInStore == 'True') {
                $("#<%=ddlShowItem.ClientID%>").val(1)
                oldshowinstore = 1
            } else {
                $("#<%=ddlShowItem.ClientID%>").val(0)
                oldshowinstore = 0
            }
           
        })



        $("#txtPipeSearch").keyup(function () {
            $("#lblPipeSearchMessage").empty();
            var AccessoryToSearch = $("#txtPipeSearch").val();
            if ($("#txtPipeSearch").val().length > 0) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchPipeInventory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#PipeList").empty();
                            $("#lblPipeSearchMessage").text("No products found matching search query");
                            return;
                        }


                        $("#PipeList").empty();
                        $.each(result, function (index, item) {

                            var content =
                            "<a href='#'  data-saleend='" + item.SaleEndDate + "' data-salestart='" + item.SaleStartDate + "'  data-releasedate='" + item.ReleaseDate + "' data-showinstore='" + item.ShowInStore + "' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "' data-featured='" + item.IsFeatured + "' data-material='" + item.Material + "' data-bodyshape='" + item.BodyShape + "' data-stemshape='" + item.StemShape + "' data-bowlfinish='" + item.BowlFinish + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-pipe='" + item.PipeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipeitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#PipeList").fadeIn();
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
