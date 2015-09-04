<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Apparel.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Apparel" %>
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

 
        <div id="Apparel" class="container">
           <div class="col-lg-12">
                   <asp:Label  runat="server" ID="lblApparelMessage"></asp:Label>
                <h3>Apparel</h3>
                <input class="form-control" id="txtApparelSearch" placeholder="Search apparel by SKU, name, or price."/>
               <label id="lblApparelSearchMessage" style="color:red"></label>
               <br />
                <div id="ApparelList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfApparelProductID"/>
           
                <h6>SKU</h6>
                <asp:TextBox ID="txtApparelSKU" runat="server" CssClass="form-control"></asp:TextBox>
                <h6>Name</h6>
                <asp:TextBox ID="txtApparelNames" runat="server" CssClass="form-control"></asp:TextBox>
        
                <h6>Description</h6>
                <textarea runat="server" id="txtApprarelDescriptions" class="form-control"></textarea>
                
                <ul class="list-inline">
                    <li><h6>XS Qty</h6>
                         <asp:TextBox ID="XS" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>SM Qty</h6>
                         <asp:TextBox ID="SM" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>MD Qty</h6>
                         <asp:TextBox ID="MD" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>LG Qty</h6>
                         <asp:TextBox ID="LG" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XL Qty</h6>
                         <asp:TextBox ID="XL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XXL Qty</h6>
                         <asp:TextBox ID="XXL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                      <li><h6>XXXL Qty</h6>
                         <asp:TextBox ID="XXXL" runat="server" CssClass ="form-control"></asp:TextBox>
                    </li>
                    <li> <h6>Price</h6>
                <asp:TextBox ID="txtApparelPrice" runat="server" CssClass="form-control"></asp:TextBox></li>
                <li> <h6>Is On Sale</h6>
                      <asp:CheckBox ID="ckApparelIsOnSale" runat="server"/>
                </li>
                   
                      <li>
                          <h6>Sale Price</h6>
                        <asp:TextBox ID="txtApparelSalePrice" runat="server" CssClass="form-control"></asp:TextBox>
                      </li>
              

                    <li>  <h6>Product Image</h6>
                <asp:FileUpload ID="fuApprelImg" runat="server" CssClass="form-control" /></li>
                </ul>
               <h6>Is Featured</h6>
               <asp:CheckBox runat="server" ID="ckApparelIsFeatured"/>
                <br />
                <br />
                <ul class="list-inline">
                    <li>  <asp:Button ID="btnSaveApprel" runat="server" CssClass="btn btn-success" Text="Save Apparel" /></li>
                    <li><asp:Button id="btnDeleteApparel" runat="server" CssClass="btn btn-danger" Text="Delete"/></li>
                </ul>
                <br />
            
            </div>
        </div>
        <!-- end Apparel Section -->
    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
        $("#Title").html("Apparel Management");

        $.ajax({
            type: "POST",
            url: "Engine.asmx/GetApparelInventory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#ApparelList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "' data-featured='" + item.IsFeatured + "' data-XS='" + item.XS + "' data-SM='" + item.SM + "' data-MD='" + item.MD + "' data-LG='" + item.XS + "'  data-XL='" + item.XL + "'  data-XXL='" + item.XXL + "'  data-XXXL='" + item.XXXL + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-apparel='" + item.ApparelID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item apparelitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                    $(content).hide().appendTo("#ApparelList").fadeIn();

                 
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
        var oldxs;
        var oldsm;
        var oldmd;
        var oldlg;
        var oldxl;
        var oldxxl;
        var oldxxxl;
        var oldprice;
        var oldfeatured;
        var newfeatured;
        var oldisonsale;
        var oldsaleprice;

        $("#ApparelList").delegate(".apparelitem", "click", function (e) {


            if ($("#<%=hfApparelProductID.ClientID%>").val().length != 0) {
                // a value has been set
                e.preventDefault();
                var changemade = false;
               
                if ($("#<%=txtApparelSKU.ClientID%>").val() != oldsku) {
                    changemade = true;
                }
               
                if ($("#<%=txtApparelNames.ClientID%>").val() != oldname) {
                    changemade = true;
                }
              
                if ($("#<%=txtApprarelDescriptions.ClientID%>").val() != olddescription) {
                    changemade = true;
                }
               
                if ($("#<%=XS.ClientID%>").val() != oldxs) {
                    changemade = true;
                }
             
                if ($("#<%=SM.ClientID%>").val() != oldsm) {
                    changemade = true;
                }
              
                if ($("#<%=MD.ClientID%>").val() != oldmd) {
                    changemade = true;
                }
                
                if ($("#<%=LG.ClientID%>").val() != oldlg) {
                    changemade = true;
                }
               
                if ($("#<%=XL.ClientID%>").val() != oldxl) {
                    changemade = true;
                }
             
                if ($("#<%=XXL.ClientID%>").val() != oldxxl) {
                    changemade = true;
                }
               
                if ($("#<%=XXXL.ClientID%>").val() != oldxxxl) {
                    changemade = true;
                }
            
              
                if ($("#<%=txtApparelPrice.ClientID%>").val() != '$' + oldprice) {
                    changemade = true;
                }
           

                var currentstate;
                if ($("#<%=ckApparelIsFeatured.ClientID%>").is(":checked")) {
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
                if ($("#<%=ckApparelIsOnSale.ClientID%>").is(":checked")) {
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




                if ($("#<%=fuApprelImg.ClientID%>").val() != "") {
                    changemade = true;
                }

                if (changemade == true) {
                    if (confirm('Changes have been made to the current item. If you wish to save, please click "Cancel", and save your changes. To ignore, please click "OK".')) {
                        var fileUpload = document.getElementById("<%=fuApprelImg.ClientID%>");
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




            e.preventDefault();
            var ProductID = $(this).attr('id');
            var SKU = $(this).attr("data-SKU");
            oldsku = SKU
            var Name = $(this).attr('data-Name');
            oldname = Name
            var Price = $(this).attr('data-price');
            oldprice = Price
            var Description = $(this).attr('data-description');
            olddescription = Description
            var XS = $(this).attr('data-XS');
            oldxs = XS
            var SM = $(this).attr('data-SM');
            oldsm = SM
            var MD = $(this).attr('data-MD');
            oldmd = MD
            var LG = $(this).attr('data-LG');
            oldlg = LG
            var XL = $(this).attr('data-XL');
            oldxl = XL
            var XXL = $(this).attr('data-XXL');
            oldxxl = XXL
            var XXXL = $(this).attr('data-XXXL');
            oldxxxl = XXXL
            var Featured = $(this).attr('data-featured');
            oldfeatured = Featured
            var IsOnSale = $(this).attr('data-isonsale');
            oldisonsale = IsOnSale
            var SalePrice = $(this).attr('data-saleprice')
            oldsaleprice = SalePrice

            $("#<%=hfApparelProductID.ClientID%>").val(ProductID);
            $("#<%=txtApparelSKU.ClientID%>").val(SKU);
            $("#<%=txtApparelNames.ClientID%>").val(Name);
            $("#<%=txtApprarelDescriptions.ClientID%>").val(Description);
            $("#<%=XS.ClientID%>").val(XS);
            $("#<%=SM.ClientID%>").val(SM);
            $("#<%=MD.ClientID%>").val(MD);
            $("#<%=LG.ClientID%>").val(LG);
            $("#<%=XL.ClientID%>").val(XL);
            $("#<%=XXL.ClientID%>").val(XXL);
            $("#<%=XXXL.ClientID%>").val(XXXL);
            $("#<%=txtApparelPrice.ClientID%>").val('$' + Price);
            $("#<%=txtApparelSalePrice.ClientID%>").val('$' + SalePrice)

            if (Featured == 'True') {
                $("#<%=ckApparelIsFeatured.ClientID%>").prop("checked", true);
               
            } else {
                $("#<%=ckApparelIsFeatured.ClientID%>").prop("checked", false);
            }
            if (IsOnSale == 'True') {
                $("#<%=ckApparelIsOnSale.ClientID%>").prop("checked", true);
            } else {
                $("#<%=ckApparelIsOnSale.ClientID%>").prop("checked", false);
            }


        })


        $("#txtApparelSearch").keyup(function () {
            $("#lblApparelSearchMessage").empty();
            var AccessoryToSearch = $("#txtApparelSearch").val();
            if ($("#txtApparelSearch").val().length > 2) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchApparelInventory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#ApparelList").empty();
                            $("#lblApparelSearchMessage").text("No products found matching search query");
                            return;
                        }


                        $("#ApparelList").empty();
                        $.each(result, function (index, item) {

                            var content =

                            "<a href='#' data-isonsale='" + item.IsOnSale + "' data-saleprice='" + item.SalePrice + "' data-featured='" + item.IsFeatured + "' data-XS='" + item.XS + "' data-SM='" + item.SM + "' data-MD='" + item.MD + "' data-LG='" + item.XS + "'  data-XL='" + item.XL + "'  data-XXL='" + item.XXL + "'  data-XXXL='" + item.XXXL + "' data-description='" + item.Description + "' ' data-price='" + item.Price + "' data-Name='" + item.Name + "'  data-SKU='" + item.SKU + "' data-apparel='" + item.ApparelID + "' id='" + item.ProductID + "' data-selected='0' class='list-group-item apparelitem'>" +
                            "<ul class='list-inline'><li>SKU: <b>" + item.SKU + "</b></li><li>Name: <b>" + item.Name + "</b></li><li>Price: <b>$" + item.Price + "</b></li></ul></a>";
                            $(content).hide().appendTo("#ApparelList").fadeIn();
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
