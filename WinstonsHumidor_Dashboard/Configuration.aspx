<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Configuration.aspx.vb" Inherits="WinstonsHumidor_Dashboard.Configuration" %>

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

       
        <div id="Configuration" class="container">
           <div class="col-lg-12">
                
               <h4>Checkout Details</h4>

               <ul class="list-inline">             
                   <li>
                       <h6>Tax Percentage</h6>
                <asp:TextBox ID="txtConfigurationTaxPercentage" runat="server" CssClass="form-control"></asp:TextBox> 
                   </li>
                   <li>
                         <h6>Shipping Cost</h6>
                <asp:TextBox ID="txtConfigurationShippingCost" runat="server" CssClass="form-control"></asp:TextBox>
                   </li>
                 
                
                </ul>
                  <ul class="list-inline">
                    <li><asp:Button ID="btnSaveConfig" runat="server" CssClass="btn btn-success" Text="Save Checkout Details" /></li>
                </ul>
               <br />
               

               <h4>Discounts</h4>
               
               <div class="list-group" id="discountlist">
                  
               </div>
               <ul class="list-inline">
                   <li><h6>Discount ID</h6><input class="form-control" id="txtDiscountID" disabled="disabled"/></li>
                   <li><h6>Discount Code</h6><input class="form-control" id="txtDiscountCode"/></li>
                   <li><h6>Discount Amount</h6><input class="form-control" id="txtDiscountAmount"/></li>
                   <li><h6>Start Date</h6> <input id="txtDiscountStartDate" class="form-control" /></li>
                   <li><h6>End Date</h6> <input id="txtDiscountEndDate" class="form-control" /></li>
                   <li><h6>Discount Code Active</h6><asp:CheckBox ID="ckDiscountCodeActive" runat="server"/></li>
               </ul>
               <ul class="list-inline">
                   <li><a id="btnSaveDiscount" href="#" class="btn btn-success">Save</a></li>
                    <li><a id="btnClearForm" href="#" class="btn btn-default">Clear Form</a></li>
                    <li><a id="btnDeleteDiscount" href="#" class="btn btn-danger">Delete</a></li>
               </ul>
                <small>** To update a discount, click an item from the list, update fields, then 'Save'.</small>
               <br />
               <small>** To insert a new discount, click 'Clear Form', enter information, then 'Save'.</small>

 
                <br />
             
                <br />
                <asp:Label  runat="server" ID="lblConfigMessage"></asp:Label>
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
   
        $("#Title").html("Configuration");


        $("#btnDeleteDiscount").click(function (e) {
            e.preventDefault();
            if ($('#txtDiscountID').val() == '') {
                alert("no discount selected");
                return;
            }
           


            $.ajax({
                type: "POST",
                url: "Engine.asmx/DeleteDiscount",
                data: "{DiscountID:'" + $('#txtDiscountID').val() + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    window.location.reload(true);
                },
                failure: function (msg) {
                    alert(msg);
                },
                error: function (err) {
                    alert(err);
                }
            }) //end ajax
        })

        $("#btnSaveDiscount").click(function () {
      
            var isvalid;
         
            if ($('#<%=ckDiscountCodeActive.ClientID%>').is(':checked')) {
                isvalid = 1;
            } else {
                isvalid = 0;
            }


            alert(isvalid);

            alert($("#txtDiscountID").val())
            alert($("#txtDiscountCode").val())
           alert($("#txtDiscountAmount").val())
            alert($("#txtDiscountStartDate").val())
            alert($("#txtDiscountEndDate").val())

           
            $.ajax({
                type: "POST",
                url: "Engine.asmx/ManageDiscounts",
                data: "{DiscountID:'"+ $('#txtDiscountID').val() +"',Code:'"+ $('#txtDiscountCode').val() +"',Amount:'"+ $('#txtDiscountAmount').val() +"',Starts:'"+ $('#txtDiscountStartDate').val() +"',Ends:'"+ $('#txtDiscountEndDate').val() +"',IsValid:'"+ isvalid +"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    //take data and append as list item parameters to be selected by user
                    window.location.reload();
                },
                failure: function (msg) {
                    alert(msg);
                },
                error: function (err) {
                    alert(err);
                }
            }) //end ajax

        })


        $.ajax({
            type: "POST",
            url: "Engine.asmx/GetAllDiscounts",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#discountlist").empty();
                $.each(result, function (index, item) {

                    var content =
                     "<a href='#' data-isvalid='"+ item.IsValid +"' data-ends='"+ item.Ends +"' data-starts='"+ item.Starts +"' data-amount='"+ item.Amount +"' data-code='"+ item.Code +"' data-discountid="+ item.DiscountID +" class='list-group-item discountitem'>" +
                            "<ul class='list-inline'><li>Code: <b>" + item.Code + "</b></li><li>Amount: <b>" + item.Amount + "</b></li><li>Starts: <b>" + item.Starts + "</b></li><li>Ends: <b>" + item.Ends + "</b></li></ul></a>";
                    $(content).hide().appendTo("#discountlist").fadeIn();
                   
                })
            },
            failure: function (msg) {
                alert(msg);
            },
            error: function (err) {
                alert(err);
            }
        }) //end ajax

        $("#btnClearForm").click(function (e) {
            e.preventDefault();
            $("#txtDiscountID").val('')
            $("#txtDiscountCode").val('')
            $("#txtDiscountAmount").val('')
            $("#txtDiscountStartDate").val('')
            $("#txtDiscountEndDate").val('')
            $("#<%=ckDiscountCodeActive.ClientID%>").prop("checked", false);
        })


        $("#discountlist").delegate(".discountitem", "click", function (e) {
           
            e.preventDefault();

            var isvalid = $(this).attr('data-isvalid');
            var ends = $(this).attr('data-ends');
            var starts = $(this).attr('data-starts');
            var amount = $(this).attr('data-amount')
            var code = $(this).attr('data-code');
            var discount = $(this).attr('data-discountid')

          

            $("#txtDiscountID").val(discount)
            $("#txtDiscountCode").val(code)
            $("#txtDiscountAmount").val(amount)
            $("#txtDiscountStartDate").val(starts)
            $("#txtDiscountEndDate").val(ends)

            if (isvalid == 'true') {
                $("#<%=ckDiscountCodeActive.ClientID%>").prop("checked", true);
            } else {

                $("#<%=ckDiscountCodeActive.ClientID%>").prop("checked", false);
            }
            
        })

    })
</script>
