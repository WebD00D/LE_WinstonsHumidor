Imports System.Data.SqlClient
Public Class Accessories
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveAccessory_Click(sender As Object, e As EventArgs) Handles btnSaveAccessory.Click
        txtAccessoryQty.BorderColor = Nothing
        txtAccessoryPrice.BorderColor = Nothing
        lblAccessoryMessage.BorderColor = Nothing
        txtAccessoryName.BorderColor = Nothing
        txtAccessorySKU.BorderColor = Nothing
        txtAccessoryBrand.BorderColor = Nothing
        txtAccessorySalePrice.BorderColor = Nothing
        ckAccessoryIsOnSale.BorderColor = Nothing
        fuAccessoryImage.BorderColor = Nothing

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
        If Trim(txtAccessoryBrand.Text) = String.Empty Then
            lblAccessoryMessage.Text = "Brand name is required."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryBrand.BorderColor = Drawing.Color.Red
        End If

        If Not IsNumeric(txtAccessoryQty.Text) Then
            lblAccessoryMessage.Text = "Quantity must be of numeric value."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(txtAccessoryPrice.Text) Then
            lblAccessoryMessage.Text = "Price must be of numeric value."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            txtAccessoryPrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        Dim SalePrice As Decimal = 0.0
        If ckAccessoryIsOnSale.Checked Then
            If Not IsNumeric(txtAccessorySalePrice.Text) Then
                lblAccessoryMessage.Text = "Sale price must be of numeric value."
                lblAccessoryMessage.ForeColor = Drawing.Color.Red
                txtAccessorySalePrice.BorderColor = Drawing.Color.Red
                Exit Sub

            End If
        End If

        'check to make sure that Is On sale was not checked by accident by making sure 
        'there is an actual price in the txtAccessorySalePrice.text
        If ckAccessoryIsOnSale.Checked AndAlso IsNumeric(txtAccessorySalePrice.Text) Then
            Dim CheckThePrice As Decimal = Math.Round(CDec(txtAccessorySalePrice.Text), 2)
            If CheckThePrice = 0.0 Then
                ckAccessoryIsOnSale.BorderColor = Drawing.Color.Red
                lblAccessoryMessage.Text = "Failed To Save: You've marked this item as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblAccessoryMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                SalePrice = txtAccessorySalePrice.Text
            End If
        End If

        'Check If SKU already exists. If so, then call update, else insert new.

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtAccessorySKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using


        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then

            If dt.Rows(0).Item("Category") = "Accessory" Then
                If hfAccessoryProductID.Value = Nothing Then
                    lblAccessoryMessage.Text = "Failed To Save: To update a product, please make sure to have selected the item first from the list."
                    lblAccessoryMessage.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    storedProcedure = "sp_Update_Accessories"
                End If

            Else
                lblAccessoryMessage.Text = "Failed To Save: This SKU is already being used by another product in the " & dt.Rows(0).Item("Category") & " category."
                lblAccessoryMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        Else
            storedProcedure = "sp_Insert_Accessories"
            If Not fuAccessoryImage.HasFile Then
                lblAccessoryMessage.Text = "Failed To Save: Please upload an image for the product"
                lblAccessoryMessage.ForeColor = Drawing.Color.Red
                fuAccessoryImage.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtAccessorySKU.Text)
            cmd.Parameters.AddWithValue("@Name", txtAccessoryName.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtAccessoryQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtAccessoryPrice.Text))
            cmd.Parameters.AddWithValue("@Brand", txtAccessoryBrand.Text)
            cmd.Parameters.AddWithValue("@Description", txtAccessoryDescription.Value)
            cmd.Parameters.AddWithValue("@FeaturedItem", CByte(ckAccessoryFeaturedItem.Checked))
            cmd.Parameters.AddWithValue("@IsOnSale", CByte(ckAccessoryIsOnSale.Checked))
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice)

            If storedProcedure = "sp_Insert_Accessories" Then
                cmd.Parameters.AddWithValue("@Category", "Accessory")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfAccessoryProductID.Value))
            End If

            cmd.Parameters.AddWithValue("@Image", fuAccessoryImage.FileBytes)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using

        If storedProcedure = "sp_Insert_Accessories" Then
            lblAccessoryMessage.Text = "Accessory successfully inserted!"
            lblAccessoryMessage.ForeColor = Drawing.Color.Green
        Else
            lblAccessoryMessage.Text = "Accessory successfully updated!"
            lblAccessoryMessage.ForeColor = Drawing.Color.Green
        End If

        ClearAccessoryForm()

    End Sub

    Protected Sub btnDeleteAccessory_Click(sender As Object, e As EventArgs) Handles btnDeleteAccessory.Click
        If hfAccessoryProductID.Value = Nothing Then
            lblAccessoryMessage.Text = "No accessory has been selected."
            lblAccessoryMessage.ForeColor = Drawing.Color.Red
            Exit Sub
        End If

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim cmd As SqlCommand = con.CreateCommand
        Using cmd
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_Accessories"
            cmd.Parameters.AddWithValue("@ProductID", CInt(hfAccessoryProductID.Value))
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearAccessoryForm()
    End Sub

    Public Sub ClearAccessoryForm()

        txtAccessoryDescription.Value = ""
        txtAccessoryQty.Text = ""
        txtAccessoryPrice.Text = ""
        lblAccessoryMessage.Text = ""
        txtAccessoryName.Text = ""
        txtAccessorySKU.Text = ""
        txtAccessoryBrand.Text = ""
        ckAccessoryFeaturedItem.Checked = False
        ckAccessoryIsOnSale.Checked = False
        txtAccessorySalePrice.Text = ""
        hfAccessoryProductID.Value = Nothing

    End Sub

End Class