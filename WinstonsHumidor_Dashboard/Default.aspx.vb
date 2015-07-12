Imports System.Data.SqlClient
Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveAccessory_Click(sender As Object, e As EventArgs) Handles btnSaveAccessory.Click

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Insert_Accessories"
            cmd.Parameters.AddWithValue("@SKU", txtAccessoryQty.Text)
            cmd.Parameters.AddWithValue("@Name", txtAccessoryName.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtAccessoryQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtAccessoryPrice.Text))
            cmd.Parameters.AddWithValue("@Category", "Accessory")
            cmd.Parameters.AddWithValue("@Image", fuAccessoryImage.FileBytes)
            cmd.ExecuteNonQuery()
        End Using


    End Sub
End Class