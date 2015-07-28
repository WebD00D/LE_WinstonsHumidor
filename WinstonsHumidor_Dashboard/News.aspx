<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="News.aspx.vb" Inherits="WinstonsHumidor_Dashboard.News" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web" Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
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
            <h1 id="Title">What's New?</h1>
        </div>

       
        <!-- end Home Section -->






        <div id="NewsPost" class="container">
            <div class="col-lg-12">

                  <h3>Post History</h3>
                <input id="txtSearchPostHistory" class="form-control" placeholder="Search your post history by title."/>
               <label id="lblSearchPostHistoryMessage" style="color:red"></label>
               <br />
                <div id="PostList" class="list-group" style="overflow-y:scroll;max-height:200px"></div>
                <asp:HiddenField runat="server" ID="hfPostID"/>
               <ul class="list-inline">
                   <li>  <asp:button runat="server" ID="btnLoadPostHTML" CssClass="btn btn-success" Text="Load Post HTML" /></li>
                   <li><asp:Button runat="server" ID="btnDeletePost" CssClass="btn btn-danger" Text="Delete Post" /></li>
                   <li><asp:Button runat="server" ID="btnClearForm" CssClass="btn btn-warning" Text="New Post"/></li>
               </ul>
              


                <h3>Whats new?<br />
                    <small>Keep your customers up to date with any events, new product releases, and more!</small></h3>
                <ul class="list-inline">
                    <li><h6>Post Title</h6><asp:TextBox runat="server" CssClass="form-control" ID="txtPostTitle"></asp:TextBox></li>
                      <li><h6>Header Image</h6><asp:FileUpload runat="server" ID="fuPostImage" CssClass="form-control"/></li>
                    <li><h6>Post Type</h6>
                        <asp:DropDownList ID="ddlPostType" CssClass="form-control" runat="server" >
                            <asp:ListItem Value="Event">Event</asp:ListItem>
                            <asp:ListItem Value="News">News</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                </ul>
                    <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" Width="1137px" >
                        <Toolbars>
                            <dx:HtmlEditorToolbar Name="StandardToolbar1">
                                <Items>
                                    <dx:ToolbarCutButton>
                                    </dx:ToolbarCutButton>
                                    <dx:ToolbarCopyButton>
                                    </dx:ToolbarCopyButton>
                                    <dx:ToolbarPasteButton>
                                    </dx:ToolbarPasteButton>
                                    <dx:ToolbarPasteFromWordButton>
                                    </dx:ToolbarPasteFromWordButton>
                                    <dx:ToolbarUndoButton BeginGroup="True">
                                    </dx:ToolbarUndoButton>
                                    <dx:ToolbarRedoButton>
                                    </dx:ToolbarRedoButton>
                                    <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                    </dx:ToolbarRemoveFormatButton>
                                    <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                    </dx:ToolbarInsertOrderedListButton>
                                    <dx:ToolbarInsertUnorderedListButton>
                                    </dx:ToolbarInsertUnorderedListButton>
                                    <dx:ToolbarIndentButton BeginGroup="True">
                                    </dx:ToolbarIndentButton>
                                    <dx:ToolbarOutdentButton>
                                    </dx:ToolbarOutdentButton>
                                    <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                    </dx:ToolbarInsertLinkDialogButton>
                                    <dx:ToolbarUnlinkButton>
                                    </dx:ToolbarUnlinkButton>
                                    <dx:ToolbarFullscreenButton BeginGroup="True">
                                    </dx:ToolbarFullscreenButton>
                                </Items>
                            </dx:HtmlEditorToolbar>
                            <dx:HtmlEditorToolbar Name="StandardToolbar2">
                                <Items>
                                    <dx:ToolbarParagraphFormattingEdit Width="120px">
                                        <Items>
                                            <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                            <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                            <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                            <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                            <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                            <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                            <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                            <dx:ToolbarListEditItem Text="Address" Value="address" />
                                            <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                        </Items>
                                    </dx:ToolbarParagraphFormattingEdit>
                                    <dx:ToolbarFontNameEdit>
                                        <Items>
                                            <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                            <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                            <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                            <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                            <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                            <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                        </Items>
                                    </dx:ToolbarFontNameEdit>
                                    <dx:ToolbarFontSizeEdit>
                                        <Items>
                                            <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                            <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                            <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                            <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                            <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                            <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                            <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                        </Items>
                                    </dx:ToolbarFontSizeEdit>
                                    <dx:ToolbarBoldButton BeginGroup="True">
                                    </dx:ToolbarBoldButton>
                                    <dx:ToolbarItalicButton>
                                    </dx:ToolbarItalicButton>
                                    <dx:ToolbarUnderlineButton>
                                    </dx:ToolbarUnderlineButton>
                                    <dx:ToolbarStrikethroughButton>
                                    </dx:ToolbarStrikethroughButton>
                                    <dx:ToolbarJustifyLeftButton BeginGroup="True">
                                    </dx:ToolbarJustifyLeftButton>
                                    <dx:ToolbarJustifyCenterButton>
                                    </dx:ToolbarJustifyCenterButton>
                                    <dx:ToolbarJustifyRightButton>
                                    </dx:ToolbarJustifyRightButton>
                                    <dx:ToolbarBackColorButton BeginGroup="True">
                                    </dx:ToolbarBackColorButton>
                                    <dx:ToolbarFontColorButton>
                                    </dx:ToolbarFontColorButton>
                                </Items>
                            </dx:HtmlEditorToolbar>
                        </Toolbars>
                </dx:ASPxHtmlEditor>
                <br />
                <ul class="list-inline">
                    <li> <asp:Button runat="server" ID="btnSavePost" CssClass="btn btn-primary" Text="Save Post" OnClick="Unnamed1_Click"/></li>
                    
                </ul>
               
                <br />
                <br />
                <asp:Label runat="server" ID="lblPostMessage"></asp:Label>
                <br />
                <br />
            </div>
        </div>
        <!-- end News Post Section -->

    </form>
</body>
</html>
   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
   
        $.ajax({
            type: "POST",
            url: "Engine.asmx/LoadPostHistory",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {

                //take data and append as list item parameters to be selected by user
                var result = data.d;
                $("#PostList").empty();
                $.each(result, function (index, item) {

                    var content =

                     "<a href='#' data-posttitle='" + item.PostTitle + "' data-postdate='" + item.PostDate + "'  data-postedby='" + item.PostedBy + "' data-html='" + item.HTML + "' id='" + item.NewsPostID + "' data-selected='0' class='list-group-item newpostitem'>" +
                            "<ul class='list-inline'><li>Post Date: <b>" + item.PostDate + "</b></li><li>Post Title: <b>" + item.PostTitle + "</b></li></ul></a>";
                    $(content).hide().appendTo("#PostList").fadeIn();

                })

            },
            failure: function (msg) {
                alert(msg);
            },
            error: function (err) {
                alert(err);
            }
        }) //end ajax


        $("#PostList").delegate(".newpostitem", "click", function (e) {

            e.preventDefault();
            var PostID = $(this).attr('id');
            $("#<%=hfPostID.ClientID%>").val(PostID);
            
        })


        $("#txtSearchPostHistory").keyup(function () {
            $("#lblSearchPostHistoryMessage").empty();
            var AccessoryToSearch = $("#txtSearchPostHistory").val();
            if ($("#txtSearchPostHistory").val().length > 0) {


                $.ajax({
                    type: "POST",
                    url: "Engine.asmx/SearchPostHistory",
                    data: "{SearchText:'" + AccessoryToSearch + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        //take data and append as list item parameters to be selected by user
                        var result = data.d;

                        if (result == 0) {

                            $("#PostList").empty();
                            $("#lblSearchPostHistoryMessage").text("No posts found matching search query");
                            return;
                        }


                        $("#PostList").empty();
                        $.each(result, function (index, item) {

                            var content =

                             "<a href='#' data-posttitle='" + item.PostTitle + "' data-postdate='" + item.PostDate + "'  data-postedby='" + item.PostedBy + "' data-html='" + item.HTML + "' id='" + item.NewsPostID + "' data-selected='0' class='list-group-item newpostitem'>" +
                            "<ul class='list-inline'><li>Post Date: <b>" + item.PostDate + "</b></li><li>Post Title: <b>" + item.PostTitle + "</b></li></ul></a>";
                            $(content).hide().appendTo("#PostList").fadeIn();
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
