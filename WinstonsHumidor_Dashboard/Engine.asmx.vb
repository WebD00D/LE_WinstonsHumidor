Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class Engine
    Inherits System.Web.Services.WebService

    Public Class Accessory
        Public AccessoryID As String
        Public ProductID As String
        Public SKU As String
        Public Name As String
        Public Qty As String
        Public Description As String
        Public Brand As String
        Public Price As String
        Public IsFeatured As String
        Public IsOnSale As String
        Public SalePrice As String
    End Class

    Public Class Apparel
        Public ApparelID As String
        Public ProductID As String
        Public SKU As String
        Public Name As String
        Public Description As String
        Public Price As String
        Public XS As String
        Public SM As String
        Public MD As String
        Public LG As String
        Public XL As String
        Public XXL As String
        Public XXXL As String
        Public IsFeatured As String
        Public IsOnSale As String
        Public SalePrice As String
    End Class

    Public Class Coffee
        Public CoffeeID As String
        Public ProductID As String
        Public SKU As String
        Public Name As String
        Public Brand As String
        Public Description As String
        Public Body As String
        Public Roast As String
        Public Price As String
        Public Qty As String
        Public IsFeatured As String
        Public IsOnSale As String
        Public SalePrice As String
    End Class

    Public Class Cigar
        Public CigarID As String
        Public ProductID As String
        Public Brand As String
        Public SKU As String
        Public Name As String
        Public Length As String
        Public Ring As String
        Public BoxCount As String
        Public BoxQty As String
        Public SingleQty As String
        Public BoxPrice As String
        Public SinglePrice As String
        Public Description As String
        Public IsSingleSaleOnly As String
        Public IsBoxSaleOnly As String
        Public IsFeatured As String
        Public SingleIsOnSale As String
        Public BoxIsOnSale As String
        Public SingleSalePrice As String
        Public BoxSalePrice As String
        Public Body As String
    End Class

    Public Class Pipe
        Public PipeID As String
        Public ProductID As String
        Public Brand As String
        Public Name As String
        Public SKU As String
        Public Description As String
        Public Price As String
        Public Qty As String
        Public BowlFinish As String
        Public StemShape As String
        Public BodyShape As String
        Public Material As String
        Public IsFeatured As String
        Public IsOnSale As String
        Public SalePrice As String
    End Class

    Public Class PipeTobacco
        Public PipeTobaccoID As String
        Public ProductID As String
        Public SKU As String
        Public Brand As String
        Public Tobacco As String
        Public Style As String
        Public Cut As String
        Public Strength As String
        Public Price As String
        Public Description As String
        Public Qty As String
        Public IsFeatured As String
        Public IsOnSale As String
        Public SalePrice As String

    End Class

    Public Class NewsPosts
        Public NewsPostID As String
        Public PostTitle As String
        Public PostDate As String
        Public PostedBy As String
        Public HTML As String
        Public Hashtag As String
    End Class

    Public Class Orders
        Public OrderID As Integer
        Public OrderDate As String
        Public OrderTotal As Decimal
        Public HasShipped As String
        Public AccordionNbr As String
        Public CustomerName As String

        Public Address As String
        Public Email As String
        Public PhoneNbr As String
    End Class

    Public Class OrderDetail
        Public OrderDetailID As Integer
        Public OrderID As Integer
        Public ProductId As Integer
        Public ItemName As String
        Public Category As String
        Public Qty As Decimal
        Public Note As String
        Public Price As Decimal
        Public BasePrice As Decimal
    End Class
     
#Region "Accessories"
    Dim Accessories As New List(Of Accessory)

    <WebMethod()> _
    Public Function GetAccessoryInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Accessories"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        Accessories.Clear()
        For Each item As DataRow In dt.Rows()
            Dim A As New Accessory()
            A.AccessoryID = CStr(item("AccessoryID"))
            A.Brand = item("Brand")
            A.Description = item("Description")
            A.Name = item("Name")
            A.Qty = CStr(item("Qty"))
            A.SKU = item("SKU")
            A.ProductID = CStr(item("ProductID"))
            Dim DecPrice As Decimal = Decimal.Round(item("Price"), 2)
            A.Price = CStr(DecPrice)
            A.IsFeatured = item("IsFeatured")
            A.IsOnSale = item("IsOnSale")
            Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
            A.SalePrice = CStr(DecSalePrice)
            Accessories.Add(A)
        Next
        Return Accessories
    End Function

    <WebMethod()> _
    Public Function SearchAccessoryInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = " SELECT * FROM Accessories" &
                              " WHERE SKU LIKE '%" & SearchText & "%' OR Name LIKE '%" & SearchText & "%' OR " &
                              " Brand LIKE '%" & SearchText & "%' OR Price LIKE '%" & SearchText & "%'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        If dt.Rows.Count() = 0 Then
            Return 0
        End If
        Accessories.Clear()
        For Each item As DataRow In dt.Rows()
            Dim A As New Accessory()
            A.AccessoryID = CStr(item("AccessoryID"))
            A.Brand = item("Brand")
            A.Description = item("Description")
            A.Name = item("Name")
            A.Qty = CStr(item("Qty"))
            A.SKU = item("SKU")
            A.ProductID = CStr(item("ProductID"))
            Dim DecPrice As Decimal = Decimal.Round(item("Price"), 2)
            A.Price = CStr(DecPrice)
            A.IsFeatured = item("IsFeatured")
            A.IsOnSale = item("IsOnSale")
            Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
            A.SalePrice = CStr(DecSalePrice)
            Accessories.Add(A)
        Next
        Return Accessories
    End Function

#End Region

#Region "Apparel"
    Dim ApparelList As New List(Of Apparel)

    <WebMethod()> _
    Public Function GetApparelInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Apparel"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            ApparelList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim A As New Apparel
                A.ApparelID = item("ApparelID")
                A.SKU = item("SKU")
                A.Name = item("Name")
                A.ProductID = item("ProductID")
                A.Description = item("Description")
                A.Price = Math.Round(item("Price"), 2)
                A.XS = item("XS_Qty")
                A.SM = item("SM_Qty")
                A.MD = item("MD_Qty")
                A.LG = item("LG_Qty")
                A.XL = item("XL_Qty")
                A.XXL = item("XXL_Qty")
                A.XXXL = item("XXXL_Qty")
                A.IsFeatured = item("IsFeatured")
                A.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                A.SalePrice = CStr(DecSalePrice)
                ApparelList.Add(A)
            Next
            Return ApparelList
        Else
            Return 0
        End If

    End Function
     
    <WebMethod()> _
    Public Function SearchApparelInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = " SELECT * FROM Apparel" &
                              " WHERE SKU LIKE '%" & SearchText & "%' OR Name LIKE '%" & SearchText & "%' OR " &
                              " Price LIKE '%" & SearchText & "%'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        If dt.Rows.Count > 0 Then

            ApparelList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim A As New Apparel
                A.ApparelID = item("ApparelID")
                A.SKU = item("SKU")
                A.Name = item("Name")
                A.ProductID = item("ProductID")
                A.Description = item("Description")
                A.Price = Math.Round(item("Price"), 2)
                A.XS = item("XS_Qty")
                A.SM = item("SM_Qty")
                A.MD = item("MD_Qty")
                A.LG = item("LG_Qty")
                A.XL = item("XL_Qty")
                A.XXL = item("XXL_Qty")
                A.XXXL = item("XXXL_Qty")
                A.IsFeatured = item("IsFeatured")
                A.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                A.SalePrice = CStr(DecSalePrice)
                ApparelList.Add(A)
            Next
            Return ApparelList
        Else
            Return 0
        End If
    End Function


#End Region

#Region "Coffee"

    Dim CoffeeList As New List(Of Coffee)

    <WebMethod()> _
    Public Function GetCoffeeInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Coffee"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            CoffeeList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim C As New Coffee
                C.CoffeeID = item("CoffeeID")
                C.SKU = item("SKU")
                C.Name = item("Name")
                C.ProductID = item("ProductID")
                C.Description = item("Description")
                C.Price = Math.Round(item("Price"), 2)
                C.Brand = item("Brand")
                C.Qty = CStr(item("Qty"))
                C.Roast = item("Roast")
                C.Body = item("Body")
                C.IsFeatured = item("IsFeatured")
                C.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                C.SalePrice = CStr(DecSalePrice)
                CoffeeList.Add(C)
            Next
            Return CoffeeList
        Else
            Return 0
        End If

    End Function

    <WebMethod()> _
    Public Function SearchCoffeeInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            If Trim(SearchText) = String.Empty Then
                cmd.CommandText = "SELECT * FROM Coffee"
            Else
                cmd.CommandText = " SELECT * FROM Coffee" &
                             " WHERE SKU LIKE '%" & SearchText & "%' OR Name LIKE '%" & SearchText & "%' OR " &
                             " Price LIKE '%" & SearchText & "%' OR Roast LIKE '%" & SearchText & "%' OR Body LIKE '%" & SearchText & "%' OR Brand LIKE '%" & SearchText & "%'"
            End If
           
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        If dt.Rows.Count > 0 Then

            CoffeeList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim C As New Coffee
                C.CoffeeID = item("CoffeeID")
                C.SKU = item("SKU")
                C.Name = item("Name")
                C.ProductID = item("ProductID")
                C.Description = item("Description")
                C.Price = Math.Round(item("Price"), 2)
                C.Brand = item("Brand")
                C.Qty = CStr(item("Qty"))
                C.Roast = item("Roast")
                C.Body = item("Body")
                C.IsFeatured = item("IsFeatured")
                C.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                C.SalePrice = CStr(DecSalePrice)
                CoffeeList.Add(C)
            Next
            Return CoffeeList
        Else
            Return 0
        End If
    End Function



#End Region

#Region "Cigars"

    Dim CigarList As New List(Of Cigar)

    <WebMethod()> _
    Public Function GetCigarInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Cigars"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            CigarList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim C As New Cigar
                C.CigarID = item("CigarID")
                C.ProductID = item("ProductID")
                C.Brand = item("Brand")
                C.SKU = item("SKU")
                C.Name = item("Name")
                C.Description = item("Description")
                C.SinglePrice = Math.Round(item("SinglePrice"), 2)
                C.BoxPrice = Math.Round(item("BoxPrice"), 2)
                C.Length = item("Length")
                C.Ring = item("Ring")
                C.BoxCount = item("BoxCount")
                C.BoxQty = item("BoxQty")
                C.SingleQty = item("SingleQty")
                C.IsBoxSaleOnly = item("IsBoxSaleOnly")
                C.IsSingleSaleOnly = item("IsSingleSaleOnly")
                C.IsFeatured = item("IsFeatured")
                C.Body = item("Body")
                C.SingleIsOnSale = item("SingleIsOnSale")
                C.BoxIsOnSale = item("BoxIsOnSale")
                Dim DecSingleSalePrice As Decimal = Decimal.Round(item("SingleSalePrice"), 2)
                Dim DecBoxSalePrice As Decimal = Decimal.Round(item("BoxSalePrice"), 2)
                C.SingleSalePrice = CStr(DecSingleSalePrice)
                C.BoxSalePrice = CStr(DecBoxSalePrice)
                CigarList.Add(C)
            Next
            Return CigarList
        Else
            Return 0
        End If

    End Function


    <WebMethod()> _
    Public Function SearchCigarInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            If Trim(SearchText) = String.Empty Then
                cmd.CommandText = "SELECT * FROM Cigars"
            Else
                cmd.CommandText = " SELECT * FROM Cigars" &
                             " WHERE SKU LIKE '%" & SearchText & "%' OR Name LIKE '%" & SearchText & "%' OR " &
                             " BoxPrice LIKE '%" & SearchText & "%' OR SinglePrice LIKE '%" & SearchText & "%' OR Length LIKE '%" & SearchText & "%' OR Brand LIKE '%" & SearchText & "%' OR Ring LIKE '%" & SearchText & "%'"
            End If

            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        If dt.Rows.Count > 0 Then

            CigarList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim C As New Cigar
                C.CigarID = item("CigarID")
                C.ProductID = item("ProductID")
                C.Brand = item("Brand")
                C.SKU = item("SKU")
                C.Name = item("Name")
                C.Description = item("Description")
                C.SinglePrice = Math.Round(item("SinglePrice"), 2)
                C.BoxPrice = Math.Round(item("BoxPrice"), 2)
                C.Length = item("Length")
                C.Ring = item("Ring")
                C.BoxCount = item("BoxCount")
                C.BoxQty = item("BoxQty")
                C.SingleQty = item("SingleQty")
                C.IsBoxSaleOnly = item("IsBoxSaleOnly")
                C.IsSingleSaleOnly = item("IsSingleSaleOnly")
                C.IsFeatured = item("IsFeatured")
                C.Body = item("Body")
                C.SingleIsOnSale = item("SingleIsOnSale")
                C.BoxIsOnSale = item("BoxIsOnSale")
                Dim DecSingleSalePrice As Decimal = Decimal.Round(item("SingleSalePrice"), 2)
                Dim DecBoxSalePrice As Decimal = Decimal.Round(item("BoxSalePrice"), 2)
                C.SingleSalePrice = CStr(DecSingleSalePrice)
                C.BoxSalePrice = CStr(DecBoxSalePrice)
                CigarList.Add(C)
            Next
            Return CigarList
        Else
            Return 0
        End If
    End Function


 

#End Region

#Region "Pipes"

    Dim PipeList As New List(Of Pipe)

    <WebMethod()> _
    Public Function GetPipeInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Pipes"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            PipeList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim P As New Pipe
                P.PipeID = item("PipeID")
                P.ProductID = item("ProductID")
                P.Brand = item("Brand")
                P.SKU = item("SKU")
                P.Name = item("Name")
                P.Description = item("Description")
                P.Price = Math.Round(item("Price"), 2)
                P.Qty = item("Qty")
                P.StemShape = item("StemShape")
                P.BowlFinish = item("BowlFinish")
                P.BodyShape = item("BodyShape")
                P.Material = item("Material")
                P.IsFeatured = item("IsFeatured")
                P.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                P.SalePrice = CStr(DecSalePrice)
                PipeList.Add(P)
            Next
            Return PipeList
        Else
            Return 0
        End If

    End Function


    <WebMethod()> _
    Public Function SearchPipeInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            If Trim(SearchText) = String.Empty Then
                cmd.CommandText = "SELECT * FROM Pipes"
            Else
                cmd.CommandText = " SELECT * FROM Pipes" &
                             " WHERE SKU LIKE '%" & SearchText & "%' OR Name LIKE '%" & SearchText & "%' OR " &
                             " Price LIKE '%" & SearchText & "%' OR Material LIKE '%" & SearchText & "%' OR BodyShape LIKE '%" & SearchText & "%' OR Brand LIKE '%" & SearchText & "%' OR StemShape LIKE '%" & SearchText & "%' OR BowlFinish LIKE '%" & SearchText & "%'"
            End If

            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
         If dt.Rows.Count > 0 Then

            PipeList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim P As New Pipe
                P.PipeID = item("PipeID")
                P.ProductID = item("ProductID")
                P.Brand = item("Brand")
                P.SKU = item("SKU")
                P.Name = item("Name")
                P.Description = item("Description")
                P.Price = Math.Round(item("Price"), 2)
                P.Qty = item("Qty")
                P.StemShape = item("StemShape")
                P.BowlFinish = item("BowlFinish")
                P.BodyShape = item("BodyShape")
                P.Material = item("Material")
                P.IsFeatured = item("IsFeatured")
                P.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                P.SalePrice = CStr(DecSalePrice)
                PipeList.Add(P)
            Next
            Return PipeList
        Else
            Return 0
        End If
    End Function




#End Region

#Region "Pipe Tobacco"

    Dim PipeTobaccoList As New List(Of PipeTobacco)

    <WebMethod()> _
    Public Function GetPipeTobaccoInventory()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM PipeTobacco"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            PipeTobaccoList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim PT As New PipeTobacco
                PT.PipeTobaccoID = item("PipeTobaccoID")
                PT.ProductID = item("ProductID")
                PT.Brand = item("Brand")
                PT.SKU = item("SKU")
                PT.Tobacco = item("Tobacco")
                PT.Description = item("Description")
                PT.Price = Math.Round(item("Price"), 2)
                PT.Qty = item("Qty")
                PT.Style = item("Style")
                PT.Cut = item("Cut")
                PT.Strength = item("Strength")
                PT.IsFeatured = item("IsFeatured")
                PT.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                PT.SalePrice = CStr(DecSalePrice)
                PipeTobaccoList.Add(PT)
            Next
            Return PipeTobaccoList
        Else
            Return 0
        End If

       

    End Function


    <WebMethod()> _
    Public Function SearchPipeTobaccoInventory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            If Trim(SearchText) = String.Empty Then
                cmd.CommandText = "SELECT * FROM PipeTobacco"
            Else
                cmd.CommandText = " SELECT * FROM PipeTobacco" &
                             " WHERE SKU LIKE '%" & SearchText & "%' OR Tobacco LIKE '%" & SearchText & "%' OR " &
                             " Price LIKE '%" & SearchText & "%' OR Strength LIKE '%" & SearchText & "%' OR Cut LIKE '%" & SearchText & "%' OR Brand LIKE '%" & SearchText & "%' OR Style LIKE '%" & SearchText & "%'"
            End If

            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
        If dt.Rows.Count > 0 Then

            PipeTobaccoList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim PT As New PipeTobacco
                PT.PipeTobaccoID = item("PipeTobaccoID")
                PT.ProductID = item("ProductID")
                PT.Brand = item("Brand")
                PT.SKU = item("SKU")
                PT.Tobacco = item("Tobacco")
                PT.Description = item("Description")
                PT.Price = Math.Round(item("Price"), 2)
                PT.Qty = item("Qty")
                PT.Style = item("Style")
                PT.Cut = item("Cut")
                PT.Strength = item("Strength")
                PT.IsFeatured = item("IsFeatured")
                PT.IsOnSale = item("IsOnSale")
                Dim DecSalePrice As Decimal = Decimal.Round(item("SalePrice"), 2)
                PT.SalePrice = CStr(DecSalePrice)
                PipeTobaccoList.Add(PT)
            Next
            Return PipeTobaccoList
        Else
            Return 0
        End If

    End Function





#End Region

#Region "News Posts"

    Dim NewsPostList As New List(Of NewsPosts)
    <WebMethod()> _
    Public Function LoadPostHistory()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM NewsPosts"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        If dt.Rows.Count > 0 Then

            NewsPostList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim NP As New NewsPosts
                NP.NewsPostID = item("PostID")
                NP.PostTitle = item("PostTitle")
                NP.PostDate = item("PostDate")
                NP.PostedBy = item("PostedBy")
                NP.HTML = item("HTML")
                NP.Hashtag = item("Hashtag")
                NewsPostList.Add(NP)
            Next
            Return NewsPostList
        Else
            Return 0
        End If

    End Function
    <WebMethod()> _
    Public Function SearchPostHistory(ByVal SearchText As String)
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            If Trim(SearchText) = String.Empty Then
                cmd.CommandText = "SELECT * FROM NewsPosts"
            Else
                cmd.CommandText = " SELECT * FROM NewsPosts" &
                             " WHERE PostTitle LIKE '%" & SearchText & "%'"
            End If

            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
        End Using
       If dt.Rows.Count > 0 Then

            NewsPostList.Clear()
            For Each item As DataRow In dt.Rows()
                Dim NP As New NewsPosts
                NP.NewsPostID = item("PostID")
                NP.PostTitle = item("PostTitle")
                NP.PostDate = item("PostDate")
                NP.PostedBy = item("PostedBy")
                NP.HTML = item("HTML")
                NP.Hashtag = item("Hashtag")
                NewsPostList.Add(NP)
            Next
            Return NewsPostList
        Else
            Return 0
        End If

    End Function

#End Region

#Region "Manage Orders"


    <WebMethod(True)> _
    Public Function MarkAsShipped(ByVal OrderID As Integer)

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE Orders SET IsShipped = 1 WHERE OrderID = " & OrderID
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        Return ""
    End Function

    <WebMethod(True)> _
    Public Function CancelShipping(ByVal OrderID As Integer)

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE Orders SET IsShipped = 0 WHERE OrderID = " & OrderID
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        Return ""
    End Function


    <WebMethod(True)> _
    Public Function LoadOrderDetails(ByVal OrderID As Integer)

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM OrderDetails WHERE OrderID = " & OrderID
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim OrderDetailsList As New List(Of OrderDetail)

        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                Dim Item As New OrderDetail

                Item.ItemName = dt.Rows(i).Item("ItemName")
                Item.Category = dt.Rows(i).Item("Category")
                Item.ProductId = dt.Rows(i).Item("ProductID")
                Item.OrderDetailID = dt.Rows(i).Item("OrderDetailsID")
                Item.OrderID = dt.Rows(i).Item("OrderID")
                Item.Qty = dt.Rows(i).Item("Qty")
                Item.Note = dt.Rows(i).Item("Notes")
                Item.Price = dt.Rows(i).Item("Price")
                Item.BasePrice = dt.Rows(i).Item("BasePrice")

                OrderDetailsList.Add(Item)
            Next
        End If
        Return OrderDetailsList

    End Function


    <WebMethod(True)> _
    Public Function LoadOrders()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Orders ORDER BY OrderDate DESC"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim OrderList As New List(Of Orders)
        Dim AccordionCount As Integer = 0
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                Dim Order As New Orders
                Order.OrderID = dt.Rows(i).Item("OrderID")
                Order.OrderTotal = dt.Rows(i).Item("OrderTotal")
                If dt.Rows(i).Item("IsShipped") = True Then
                    Order.HasShipped = "HAS SHIPPED"
                Else
                    Order.HasShipped = "NOT SHIPPED"
                End If

                Order.OrderDate = CDate(dt.Rows(i).Item("OrderDate")).ToString("M/dd/yyyy")
                Order.AccordionNbr = CStr("Acc" & AccordionCount)
                Order.CustomerName = dt.Rows(i).Item("FirtName") & " " & dt.Rows(i).Item("LastName")
                Order.Address = dt.Rows(i).Item("Street") & " " & dt.Rows(i).Item("City") & " " & dt.Rows(i).Item("State") & " " & dt.Rows(i).Item("Zip")
                Order.Email = dt.Rows(i).Item("Email")
                AccordionCount += 1
                OrderList.Add(Order)
            Next
            Return OrderList
        Else
            Return 0
        End If






        'Dim ReturnList As New List(Of ShoppingCart)

        'For i As Integer = 0 To InMyCart.Count - 1
        '    Dim sc As New ShoppingCart
        '    Dim ProductID As Integer = InMyCart(i).ProductID
        '    Dim Qty As Integer = InMyCart(i).Qty
        '    Dim Notes As String = InMyCart(i).Notes
        '    Dim Price As Decimal = InMyCart(i).Price
        '    Dim DisplayName As String = InMyCart(i).ItemName
        '    Dim Category As String = InMyCart(i).Category
        '    '  Dim Item As String = GetItemDetails(ProductID)
        '    sc.ProductID = ProductID
        '    sc.Qty = Qty
        '    sc.ItemName = DisplayName
        '    sc.Category = Category
        '    sc.Notes = Notes
        '    sc.Price = Math.Round(Price, 2)
        '    ReturnList.Add(sc)
        'Next
        'Return ReturnList


    End Function


#End Region

End Class