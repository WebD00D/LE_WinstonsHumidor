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
                CoffeeList.Add(C)
            Next
            Return CoffeeList
        Else
            Return 0
        End If
    End Function



#End Region



End Class