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


           
        <div id="Cigars" class="container">
           <div class="col-lg-12">
                <asp:Label  runat="server" ID="lblCigarMessage"></asp:Label>
                <h3>Cigars</h3>
                <input id="txtCigarSearch" class="form-control" placeholder="Search cigars by SKU, brand, name, price, length, or ring gauge."/>
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
                    <li><h6>Body</h6>
                       <asp:TextBox runat="server" ID="txtCigarBody" CssClass="form-control"></asp:TextBox>
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
                   <li><h6>Box Sale Only</h6>
                       <asp:CheckBox runat="server" ID="ckCigarIsBoxSaleOnly" />
                   </li>
                   <li><h6>Single Sale Only</h6>
                       <asp:CheckBox runat="server" ID="ckCigarIsSingleSaleOnly" />
                   </li>
                </ul>
               <ul class="list-inline">
               
                       <li><h6>Box Price</h6>
                           <asp:TextBox runat="server" ID="txtCigarBoxPrice" CssClass="form-control"></asp:TextBox></li>
                   <li>
                       <h6>Single Price</h6>
                       <asp:TextBox runat="server" ID="txtCigarSinglePrice" CssClass="form-control"></asp:TextBox></li>
                  
               </ul>

               <ul class="list-inline">
                   <li><h6>Box Is On Sale</h6>
                       <asp:CheckBox runat="server" ID="ckCigarBoxIsOnSale"/>
                   </li>
                   <li><h6>Single Is On Sale</h6>
                       <asp:Checkbox runat="server" ID="ckCigarSingleIsOnSale" />
                   </li>
               </ul>

               <ul class="list-inline">
                   <li><h6>Box Sale Price</h6>
                       <asp:TextBox runat="server" ID="txtBoxSalePrice" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Single Sale Price</h6>
                       <asp:TextBox runat="server" ID="txtSingleSalePrice" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>

               <ul class="list-inline">
                   <li><small>** Please note that when there are no limits on purchase quantity, leave 'Max Purchase' text fields blank or set them equal to 0.</small></li>
               </ul>

               <ul class="list-inline">
                   <li><h6>Max Box Purchase Amount</h6>
                       <asp:TextBox runat="server" ID="txtMaxBoxPurchaseAmount" CssClass="form-control"></asp:TextBox>
                   </li>
                   <li><h6>Max Single Purchase Amount</h6>
                       <asp:TextBox runat="server" ID="txtMaxSinglePurchaseAmount" CssClass="form-control"></asp:TextBox>
                   </li>
               </ul>

               <ul class="list-inline">
                  
                   <li>
                       <h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuCigarImage" CssClass="form-control" />
                   </li>
               </ul>

               <ul class="list-inline">
                    <li>
                       <h6>Is Featured</h6>
                       <asp:CheckBox runat="server" ID="ckCigarIsFeatured" />
                   </li>
               </ul>


               <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveCigar" runat="server" CssClass="btn btn-success" Text="Save Cigar" /></li>
                    <li><asp:Button id="btnDeleteCigar" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
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

        $("#Title").html("Cigar Management");
      

       



        $.ajax({
            type: "POST",
            url: "Engine.asmx/GetCigarInventory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#CigarList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#' data-maxsinglepurchase='"+ item.MaxSinglePurchase +"' data-maxboxpurchase='" + item.MaxBoxPurchase + "' data-boxsaleprice='" + item.BoxSalePrice + "' data-singlesaleprice='" + item.SingleSalePrice + "' data-boxisonsale='" + item.BoxIsOnSale + "' data-singleisonsale='" + item.SingleIsOnSale + "' data-body='" + item.Body + "' data-featured='" + item.IsFeatured + "'  data-boxprice='" + item.BoxPrice + "' data-singleprice='" + item.SinglePrice + "' data-boxonly='" + item.IsBoxSaleOnly + "'  data-singleonly='" + item.IsSingleSaleOnly + "' data-SingleQty='" + item.SingleQty + "' data-brand='" + item.Brand + "' data-length='" + item.Length + "' data-ring='" + item.Ring + "' data-BoxCount='" + item.BoxCount + "'  data-description='" + item.Description + "' ' data-BoxQty='" + item.BoxQty + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-cigar='" + item.CigarID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item cigarItem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Box Price: <b>$" + item.BoxPrice + "</b></li><li>Single Price: <b>$" + item.SinglePrice + "</b></li></ul></a>";
                    $(content).hide().appendTo("#CigarList").fadeIn();

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
        var oldbody;
        var oldlength;
        var oldring;
        var oldboxcount;
        var oldboxqty;
        var oldsingleqty;
        var oldboxprice;
        var oldsingleprice;
        var oldissingleonly;
        var oldisboxonly;
        var oldfeatured;
        var oldsingleonsale;
        var oldboxonsale;
        var oldsinglesaleprice;
        var oldboxsaleprice;
        var oldmaxsingle;
        var oldmaxbox;

        $("#CigarList").delegate(".cigarItem", "click", function (e) {

            e.preventDefault();

            if ($("#<%=hfCigarProductID.ClientID%>").val().length != 0) {
                var changemade = false;
                if ($("#<%=txtCigarSKU.ClientID%>").val() != oldsku) {
                    changemade = true;
                }
                if ($("#<%=txtCigarName.ClientID%>").val() != oldname) {
                    changemade = true;
                }
                if ($("#<%=txtCigarBrand.ClientID%>").val() != oldbrand) {
                    changemade = true;
                }
                if ($("#<%=txtCigarDescription.ClientID%>").val() != olddescription) {
                    changemade = true;
                }
                if ($("#<%=txtCigarBody.ClientID%>").val() != oldbody) {
                    changemade = true;
                }
                if ($("#<%=txtCigarLength.ClientID%>").val() != oldlength) {
                    changemade = true;
                }
                if ($("#<%=txtCigarRing.ClientID%>").val() != oldring) {
                    changemade = true;
                }
                if ($("#<%=txtCigarBoxCount.ClientID%>").val() != oldboxcount) {
                    changemade = true;
                }
                if ($("#<%=txtCigarBoxQty.ClientID%>").val() != oldboxqty) {
                    changemade = true;
                }
                if ($("#<%=txtCigarBoxPrice.ClientID%>").val() != '$' + oldboxprice) {
                    changemade = true;
                }
                if ($("#<%=txtCigarSingleQty.ClientID%>").val() != oldsingleqty) {
                    changemade = true;
                }
                if ($("#<%=txtCigarSinglePrice.ClientID%>").val() != '$' + oldsingleprice) {
                    changemade = true;
                }
                if ($("#<%=fuCigarImage.ClientID%>").val() != "") {
                    changemade = true;
                }
                if ($("#<%=txtMaxBoxPurchaseAmount.ClientID%>").val() !=  oldmaxbox) {
                    changemade = true;
                }
                if ($("#<%=txtMaxSinglePurchaseAmount.ClientID%>").val() !=  oldmaxsingle) {
                    changemade = true;
                }



                if ($("#<%=txtSingleSalePrice.ClientID%>").val() != '$' + oldsinglesaleprice) {
                    changemade = true;
                   
                }
                if ($("#<%=txtBoxSalePrice.ClientID%>").val() != '$' + oldboxsaleprice) {
                    changemade = true;
                }

                var currentSingleIsOnSaleState;
                if ($("#<%=ckCigarSingleIsOnSale.ClientID%>").is(":checked")) {
                    currentSingleIsOnSaleState = 'Y'
                } else {
                    currentSingleIsOnSaleState = 'N'
                }
                var currentBoxIsOnSaleState;
                if ($("#<%=ckCigarBoxIsOnSale.ClientID%>").is(":checked")) {
                    currentBoxIsOnSaleState = 'Y'
                } else {
                    currentBoxIsOnSaleState = 'N'
                }
               
                if (oldsingleonsale == 'True') {
                    if (currentSingleIsOnSaleState == 'N') {
                        changemade = true;
                    }
                }
                if (oldsingleonsale == 'False') {
                    if (currentSingleIsOnSaleState == 'Y') {
                        changemade = true;
                    }
                }
                if (oldboxonsale == 'True') {
                    if (currentBoxIsOnSaleState == 'N') {
                        changemade = true;
                    }
                }
                if (oldboxonsale == 'False') {
                    if (currentBoxIsOnSaleState == 'Y') {
                        changemade = true;
                    }
                }

                
                var currentSinglyOnlyState;
                if ($("#<%=ckCigarIsSingleSaleOnly.ClientID%>").is(":checked")) {
                    currentSinglyOnlyState = 'Y'
                }else {
                    currentSinglyOnlyState = 'N'
                }
                var currentBoxOnlyState;
                if ($("#<%=ckCigarIsBoxSaleOnly.ClientID%>").is(":checked")) {
                    currentBoxOnlyState = 'Y'
                }else {
                    currentBoxOnlyState = 'N'
                }
                var featuredState;
                if ($("#<%=ckCigarIsFeatured.ClientID%>").is(":checked")) {
                    featuredState = 'Y'
                } else {
                    featuredState = 'N'
                }

                if (oldissingleonly == 'True') {
                    if (currentSinglyOnlyState == 'N') {
                        changemade = true;
                    }
                }
                if (oldissingleonly == 'False') {
                    if (currentSinglyOnlyState == 'Y') {
                        changemade = true;
                    }
                }
                if (oldisboxonly == 'True') {
                    if (currentBoxOnlyState == 'N') {
                        changemade = true;
                    }
                }
                if (oldisboxonly == 'False') {
                    if (currentBoxOnlyState == 'Y') {
                        changemade = true;
                    }
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

                if (changemade == true) {
                    if (confirm('Changes have been made to the current item. If you wish to save, please click "Cancel", and save your changes. To ignore, please click "OK".')) {
                        var fileUpload = document.getElementById("<%=fuCigarImage.ClientID%>");
                        var id = fileUpload.id;
                        var name = fileUpload.name;
                        var newFileUpload = document.createElement("INPUT");
                        newFileUpload.type = "FILE";
                        fileUpload.parentNode.insertBefore(newFileUpload, fileUpload.nextSibling);
                        fileUpload.parentNode.removeChild(fileUpload);
                        newFileUpload.id = id;
                        newFileUpload.name = name;
                    }
                    else {
                        return;
                    }
                }

            } else {
                // The user has clicked an item for the firs time sice the 
                // page has loaded. we don't want to call the save method if no product id has been set. 
            }

            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            oldsku = SKU;
            var Name = $(this).attr('data-Name');
            oldname = Name;
            var Brand = $(this).attr('data-Brand');
            oldbrand = Brand;
            var Description = $(this).attr('data-description');
            olddescription = Description;
            var Qty = $(this).attr('data-Qty');
          
            var Length = $(this).attr('data-length');
            oldlength = Length;
            var Ring = $(this).attr('data-ring');
            oldring = Ring;
            var BoxCount = $(this).attr('data-BoxCount');
            oldboxcount = BoxCount;
            var BoxQty = $(this).attr('data-BoxQty');
            oldboxqty = BoxQty;
            var SingleQty = $(this).attr('data-SingleQty');
            oldsingleqty = SingleQty;
            var BoxPrice = $(this).attr('data-boxprice');
            oldboxprice = BoxPrice;
            var SinglePrice = $(this).attr('data-singleprice');
            oldsingleprice = SinglePrice;
            var Body = $(this).attr('data-body');
            oldbody = Body;
            var IsSingleOnly = $(this).attr('data-singleonly');
            oldissingleonly = IsSingleOnly;
            var IsBoxOnly = $(this).attr('data-boxonly');
            oldisboxonly = IsBoxOnly;
            var Featured = $(this).attr('data-featured');
            oldfeatured = Featured;

            var SingleOnSale = $(this).attr('data-singleisonsale');
            oldsingleonsale = SingleOnSale;
            var BoxOnSale = $(this).attr('data-boxisonsale');
            oldboxonsale = BoxOnSale;
            var SingleSalePrice = $(this).attr('data-singlesaleprice');
            oldsinglesaleprice = SingleSalePrice;
            var BoxSalePrice = $(this).attr('data-boxsaleprice');
            oldboxsaleprice = BoxSalePrice

           
            var MaxBox = $(this).attr('data-maxboxpurchase');
            oldmaxbox = MaxBox;
            var MaxSingle = $(this).attr('data-maxsinglepurchase')
            oldmaxsingle = MaxSingle;

            $("#<%=hfCigarProductID.ClientID%>").val(ProductID);
            $("#<%=txtCigarSKU.ClientID%>").val(SKU);
            $("#<%=txtCigarName.ClientID%>").val(Name);
            $("#<%=txtCigarBrand.ClientID%>").val(Brand);
            $("#<%=txtCigarDescription.ClientID%>").val(Description);
            $("#<%=txtCigarLength.ClientID%>").val(Length);
            $("#<%=txtCigarRing.ClientID%>").val(Ring);
            $("#<%=txtCigarBoxCount.ClientID%>").val(BoxCount);
            $("#<%=txtCigarBoxQty.ClientID%>").val(BoxQty);
            $("#<%=txtCigarSingleQty.ClientID%>").val(SingleQty);
            $("#<%=txtCigarBoxPrice.ClientID%>").val('$' + BoxPrice);
            $("#<%=txtCigarSinglePrice.ClientID%>").val('$' + SinglePrice);
            $("#<%=txtSingleSalePrice.ClientID%>").val('$' + SingleSalePrice);
            $("#<%=txtBoxSalePrice.ClientID%>").val('$' + BoxSalePrice);
            $("#<%=txtCigarBody.ClientID%>").val(Body);
            $("#<%=txtMaxBoxPurchaseAmount.ClientID%>").val(MaxBox);
            $("#<%=txtMaxSinglePurchaseAmount.ClientID%>").val(MaxSingle);
         
            if (Featured == 'True') {
                $("#<%=ckCigarIsFeatured.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCigarIsFeatured.ClientID%>").prop("checked", false);
            }

            if (IsBoxOnly == 'True') {
                $("#<%=ckCigarIsBoxSaleOnly.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCigarIsBoxSaleOnly.ClientID%>").prop("checked", false);
            }

            if (IsSingleOnly == 'True') {
                $("#<%=ckCigarIsSingleSaleOnly.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCigarIsSingleSaleOnly.ClientID%>").prop("checked", false);
            }

            if (SingleOnSale == 'True') {
                $("#<%=ckCigarSingleIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCigarSingleIsOnSale.ClientID%>").prop("checked", false);
            }
            if (BoxOnSale == 'True') {
                $("#<%=ckCigarBoxIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckCigarBoxIsOnSale.ClientID%>").prop("checked", false);
            }




        })

        $("#txtCigarSearch").keyup(function () {
            $("#lblCigarSearchMessage").empty();
            var AccessoryToSearch = $("#txtCigarSearch").val();
            if ($("#txtCigarSearch").val().length > 0) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchCigarInventory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#CigarList").empty();
                            $("#lblCigarSearchMessage").text("No products found matching search query");
                            return;
                        }


                        $("#CigarList").empty();
                        $.each(result, function (index, item) {

                            var content =

                       "<a href='#' data-maxsinglepurchase='" + item.MaxSinglePurchase + "' data-maxboxpurchase='" + item.MaxBoxPurchase + "'  data-boxsaleprice='" + item.BoxSalePrice + "' data-singlesaleprice='" + item.SingleSalePrice + "' data-boxisonsale='" + item.BoxIsOnSale + "' data-singleisonsale='" + item.SingleIsOnSale + "' data-body='" + item.Body + "' data-featured='" + item.IsFeatured + "'  data-boxprice='" + item.BoxPrice + "' data-singleprice='" + item.SinglePrice + "' data-boxonly='" + item.IsBoxSaleOnly + "'  data-singleonly='" + item.IsSingleSaleOnly + "' data-SingleQty='" + item.SingleQty + "' data-brand='" + item.Brand + "' data-length='" + item.Length + "' data-ring='" + item.Ring + "' data-BoxCount='" + item.BoxCount + "'  data-description='" + item.Description + "' ' data-BoxQty='" + item.BoxQty + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-cigar='" + item.CigarID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item cigarItem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Brand: <b>" + item.Brand + "</b></li><li>Box Price: <b>$" + item.BoxPrice + "</b></li><li>Single Price: <b>$" + item.SinglePrice + "</b></li></ul></a>";
                            $(content).hide().appendTo("#CigarList").fadeIn();
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
