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

   

End Class