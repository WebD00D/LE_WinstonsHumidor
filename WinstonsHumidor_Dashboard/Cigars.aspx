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
                    <li><h6>Single Price</h6>
                       <asp:TextBox runat="server" ID="txtCigarSinglePrice" CssClass="form-control"></asp:TextBox></li>
                    <li><h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuCigarImage" CssClass="form-control"/>
                   </li>
               </ul>
               <h6>Is Featured</h6>
               <asp:CheckBox runat="server" ID="ckCigarIsFeatured" />
               
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

                     "<a href='#' data-body='"+ item.Body +"' data-featured='" + item.IsFeatured + "'  data-boxprice='" + item.BoxPrice + "' data-singleprice='" + item.SinglePrice + "' data-boxonly='" + item.IsBoxSaleOnly + "'  data-singleonly='" + item.IsSingleSaleOnly + "' data-SingleQty='" + item.SingleQty + "' data-brand='" + item.Brand + "' data-length='" + item.Length + "' data-ring='" + item.Ring + "' data-BoxCount='" + item.BoxCount + "'  data-description='" + item.Description + "' ' data-BoxQty='" + item.BoxQty + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-cigar='" + item.CigarID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item cigarItem'>" +
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


        $("#CigarList").delegate(".cigarItem", "click", function (e) {

            e.preventDefault();

            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            var Name = $(this).attr('data-Name');
            var Brand = $(this).attr('data-Brand');
           
            var Description = $(this).attr('data-description');
            var Qty = $(this).attr('data-Qty');
            var Body = $(this).attr('data-body');
            var Length = $(this).attr('data-length');
            var Ring = $(this).attr('data-ring');
            var BoxCount = $(this).attr('data-BoxCount');
            var BoxQty = $(this).attr('data-BoxQty');
            var SingleQty = $(this).attr('data-SingleQty');
            var BoxPrice = $(this).attr('data-boxprice');
            var SinglePrice = $(this).attr('data-singleprice');
            var Body = $(this).attr('data-body');
            var IsSingleOnly = $(this).attr('data-singleonly');
            var IsBoxOnly = $(this).attr('data-boxonly');

            var Featured = $(this).attr('data-featured');


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
            $("#<%=txtCigarBody.ClientID%>").val(Body);
         


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

                       "<a href='#' data-body='"+ item.Body +"' data-featured='" + item.IsFeatured + "'  data-boxprice='" + item.BoxPrice + "' data-singleprice='" + item.SinglePrice + "' data-boxonly='" + item.IsBoxSaleOnly + "'  data-singleonly='" + item.IsSingleSaleOnly + "' data-SingleQty='" + item.SingleQty + "' data-brand='" + item.Brand + "' data-length='" + item.Length + "' data-ring='" + item.Ring + "' data-BoxCount='" + item.BoxCount + "'  data-description='" + item.Description + "' ' data-BoxQty='" + item.BoxQty + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-cigar='" + item.CigarID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item cigarItem'>" +
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
