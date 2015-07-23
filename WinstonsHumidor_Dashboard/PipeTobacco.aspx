<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PipeTobacco.aspx.vb" Inherits="WinstonsHumidor_Dashboard.PipeTobacco" %>

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

       <div id="PipeTobacco" class="container">
           <div class="col-lg-12">
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
                    <li><h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuPipeTobaccoImage" CssClass="form-control"/>
                   </li>
               </ul>
               <h6>Is Featured</h6>
               <asp:CheckBox runat="server" ID="ckPipeTobaccoIsFeatured"/>
               
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSavePipeTobacco" runat="server" CssClass="btn btn-success" Text="Save Pipe Tobacco" /></li>
                    <li><asp:Button id="btnDeletePipeTobacco" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblPipeTobaccoMessage"></asp:Label>
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

                     "<a href='#' data-featured='" + item.IsFeatured + "' data-strength='" + item.Strength + "' data-cut='" + item.Cut + "' data-style='" + item.Style + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-tobacco='" + item.Tobacco + "'  data-SKU='" + item.SKU + "' data-pipetobacco='" + item.PipeTobaccoID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipetobaccoitem'>" +
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


        $("#PipeTobaccoList").delegate(".pipetobaccoitem", "click", function (e) {

            e.preventDefault();

            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            var Tobacco = $(this).attr('data-tobacco');
            var Brand = $(this).attr('data-brand');
            var Description = $(this).attr('data-description');
            var Qty = $(this).attr('data-qty');
            var price = $(this).attr('data-price');
            var Cut = $(this).attr('data-cut');
            var Style = $(this).attr('data-style');
            var Strength = $(this).attr('data-strength');
            var Featured = $(this).attr('data-featured');


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
            

            if (Featured == 'True') {
                $("#<%=ckPipeTobaccoIsFeatured.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckPipeTobaccoIsFeatured.ClientID%>").prop("checked", false);
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
                            "<a href='#' data-featured='" + item.IsFeatured + "' data-strength='" + item.Strength + "' data-cut='" + item.Cut + "' data-style='" + item.Style + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-tobacco='" + item.Tobacco + "'  data-SKU='" + item.SKU + "' data-pipetobacco='" + item.PipeTobaccoID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipetobaccoitem'>" +
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
