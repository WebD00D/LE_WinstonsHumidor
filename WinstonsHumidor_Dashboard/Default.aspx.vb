Imports System.Data.SqlClient
Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveAccessory_Click(sender As Object, e As EventArgs) Handles btnSaveAccessory.Click

        txtAccessoryQty.BorderColor = Nothing
        txtAccessoryPrice.BorderColor = Nothing
        lblAccessoryMessage.BorderColor = Nothing
        txtAccessoryName.BorderColor = Nothing
        txtAccessorySKU.BorderColor = Nothing

        If Trim(txtAccessorySKU.Text) = String.Empty Then
            lblAccessoryMessage.Text = "A unique SKU is required."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessorySKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtAccessoryName.Text) = String.Empty Then
            lblAccessoryMessage.Text = "Accessory name is required."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryName.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(txtAccessoryQty.Text) Then
            lblAccessoryMessage.Text = "Quantity must be of numeric value"
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(txtAccessoryPrice.Text) Then
            lblAccessoryMessage.Text = "Price must be of numeric value"
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryPrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not fuAccessoryImage.HasFile Then
            lblAccessoryMessage.Text = "Please upload an image for the product"
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            lblAccessoryMessage.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Insert_Accessories"
            cmd.Parameters.AddWithValue("@SKU", txtAccessorySKU.Text)
            cmd.Parameters.AddWithValue("@Name", txtAccessoryName.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtAccessoryQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtAccessoryPrice.Text))
            cmd.Parameters.AddWithValue("@Category", "Accessory")
            cmd.Parameters.AddWithValue("@Image", fuAccessoryImage.FileBytes)
            cmd.ExecuteNonQuery()
        End Using


    End Sub
End Class