<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="WinstonsHumidor_Dashboard._Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="styles/bootstrap.min.css" type="text/css" rel="stylesheet"/>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"/>
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
            <h1 id="Title">Order Management</h1>
        </div>

        <div id="Home" class="container">
            <div class="col-lg-8 col-lg-offset-2">
              
                 <h4 id="noorders" class="text-center">(No Orders To Display)</h4>
                <div class="list-group" id="orderlist">
                    
                
                  
                  
                   
                </div>
       
                <div class="bs-example">
    <div class="panel-group" id="accordion">
       <%-- <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">1. What is HTML?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    <p>HTML stands for HyperText Markup Language. HTML is the main markup language for describing the structure of Web pages. <a href="http://www.tutorialrepublic.com/html-tutorial/" target="_blank">Learn more.</a></p>
                </div>
            </div>
        </div>--%>
        
      
    </div>
</div>




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
   
        $("#noorders").hide()


        $("#orderlist").delegate(".vieworder", "click", function () {

            alert($(this).attr("data-order"));
        })


        $.ajax({
            type: "POST",
            url: "Engine.asmx/LoadOrders",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var result = data.d;
                $("#accordion").empty();

                if (result == 0) {
                    $("#noorders").show();
                    return;
                }


                
                $.each(result, function (index, item) {

                  
                    var shiplabel;
                    var updateship;
                    var shiptext;
                    var fa;
                    var fa2;
                    var isshipped;
                    if (item.HasShipped == 'HAS SHIPPED') {
                        shiplabel = 'label label-success'
                        updateship = 'btn btn-sm btn-danger'
                        shiptext = 'Cancel Shipment'
                        isshipped = '1';
                        fa2 = 'fa fa-close'
                        fa = 'fa fa-check'
                    } else {
                        shiplabel = 'label label-danger'
                        updateship = 'btn btn-sm btn-primary'
                        fa = 'fa fa-close'
                        fa2 = 'fa fa-truck'
                        isshipped = '2';
                        shiptext = 'Mark as Shipped'
                    }


                    var content = "  <div class='panel panel-default'> " +
                                    "  <div class='panel-heading'> " +
                                    "  <ul class='panel-title list-inline'><li> " +
                                    "  <a class='btn btn-default' data-toggle='collapse' data-parent='#accordion' href='#" + item.AccordionNbr + "'><i class='fa fa-search'></i> <b>view</b></a></li>"+
                                    " <li><label class='" + shiplabel + "'><i class='" + fa + "'></i> " + item.HasShipped + "</label></li> <li><b>Order ID: </b>" + item.OrderID + "</li><li><b>Total: </b>$" + item.OrderTotal + "</li> </h4></div>" +
                                    "  <div id=" + item.AccordionNbr + " class='panel-collapse collapse'> " +
                                    "  <div class='panel-body '>" +
                                    " <b>Customer Information: </b><br /><i class='fa fa-user'></i> " + item.CustomerName + " <br /><i class='fa fa-envelope'></i> " + item.Email + "  <br /><i class='fa fa-home'></i> " + item.Address + "    <br /><br /> <ol class='" + item.AccordionNbr + "'></ol><br /><a data-shipped='" + isshipped + "' id=" + item.OrderID + " class='" + updateship + " markasshipped'><i class='" + fa2 + "'></i> " + shiptext + "<a/> <a data-shipped='" + isshipped + "' id=" + item.OrderID + " class='removeorder btn btn-danger btn-sm'><i class='fa fa-close'></i> Remove<a/></div></div></div>"
               
                    $(content).appendTo("#accordion");


                  //  OrderDetailID
                  //  OrderID 
                  //  ProductId 
                  //  ItemName 
                  //  Category 
                  //  Qty 
                  //  Note 
                  //  Price 
                  //  BasePrice 


                    //second ajax call
                    $.ajax({
                        type: "POST",
                        url: "Engine.asmx/LoadOrderDetails",
                        data: "{OrderID:"+ item.OrderID  +"}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            var result = data.d;
                            $.each(result, function (index, order) {

                                var orderitems = "<li><ul class='list-inline'><li><b>Category: </b>"+ order.Category +"</li><li><b>Item: </b>" + order.ItemName + "</li><li><b> Details: </b>"+ order.Note +"</li><li><b>Qty: </b>" + order.Qty + "</li></ul></li>"
                                $(orderitems).appendTo("." + item.AccordionNbr);

                            })

                        },
                        failure: function (msg) {
                            alert(msg);
                        },
                        error: function (err) {
                            alert(err);
                        }
                    }) //end ajax

                    // end second ajax call

               
                })
                
            },
            failure: function (msg) {
                alert(msg);
            },
            error: function (err) {
                alert(err);
            }
        }) //end ajax


        $("#accordion").delegate(".removeorder", "click", function () {
            var order = $(this).attr('id');
            $.ajax({
            type: "POST",
            url: "Engine.asmx/removeOrder",
            data: "{OrderID:" + order + "}",
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

        $("#accordion").delegate(".markasshipped", "click", function () {
           
            var order = $(this).attr('id');
            var shipped = $(this).attr('data-shipped');
           
            if (shipped == 1) {
               
                //second ajax call
                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/CancelShipping",
                    data: "{OrderID:" + order + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        window.location.reload(true); s

                    },
                    failure: function (msg) {
                        alert(msg);
                    },
                    error: function (err) {
                        alert(err);
                    }
                }) //end ajax
            } else {
                //second ajax call
                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/MarkAsShipped",
                    data: "{OrderID:" + order + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        window.location.reload(true); s

                    },
                    failure: function (msg) {
                        alert(msg);
                    },
                    error: function (err) {
                        alert(err);
                    }
                }) //end ajax
            }
            
           
            return;
          
         



        })
      

    })
</script>