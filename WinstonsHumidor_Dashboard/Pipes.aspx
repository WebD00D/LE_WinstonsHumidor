<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Pipes.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Pipes" %>

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
                      <li><a id="lnkAccessories" href="Accessories.aspx">Accessories</a></li>
                      <li><a id="lnkApparel" href="Apparel.aspx">Apparel</a></li>
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

                
        <div id="Pipes" class="container">
           <div class="col-lg-12">
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
                    <li><h6>Image</h6>
                       <asp:FileUpload runat="server" ID="fuPipeImage" CssClass="form-control"/>
                   </li>
               </ul>

               
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSavePipe" runat="server" CssClass="btn btn-success" Text="Save Pipe" /></li>
                    <li><asp:Button id="btnDeletePipe" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
                <asp:Label  runat="server" ID="lblPipeMessage"></asp:Label>
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

                     "<a href='#' data-material='"+ item.Material +"' data-bodyshape='"+ item.BodyShape +"' data-stemshape='"+ item.StemShape +"' data-bowlfinish='"+ item.BowlFinish +"' data-price='"+ item.Price+"' data-qty='"+ item.Qty +"'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-pipe='" + item.PipeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipeitem'>" +
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

        $("#PipeList").delegate(".pipeitem", "click", function (e) {

            e.preventDefault();

            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            var Name = $(this).attr('data-Name');
            var Brand = $(this).attr('data-brand');
            var Description = $(this).attr('data-description');
            var Qty = $(this).attr('data-qty');
            var price = $(this).attr('data-price');
            var BowlFinish = $(this).attr('data-bowlfinish');
            var StemShape = $(this).attr('data-stemshape');
            var BodyShape = $(this).attr('data-bodyshape');
            var Material = $(this).attr('data-material');

          
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

                       "<a href='#' data-material='" + item.Material + "' data-bodyshape='" + item.BodyShape + "' data-stemshape='" + item.StemShape + "' data-bowlfinish='" + item.BowlFinish + "' data-price='" + item.Price + "' data-qty='" + item.Qty + "'  data-brand='" + item.Brand + "'  data-description='" + item.Description + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-pipe='" + item.PipeID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item pipeitem'>" +
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
