﻿Imports System.Data.SqlClient
Public Class Coffee
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveCoffee_Click(sender As Object, e As EventArgs) Handles btnSaveCoffee.Click

        'Validation

        txtCoffeeSKU.BorderColor = Nothing
        txtCoffeeName.BorderColor = Nothing
        txtCoffeeBrand.BorderColor = Nothing
        txtCoffeeRoast.BorderColor = Nothing
        txtCoffeeBody.BorderColor = Nothing
        txtCoffeeQty.BorderColor = Nothing
        txtCoffeePrice.BorderColor = Nothing
        fuCoffeeImage.BorderColor = Nothing
        txtCoffeeSalePrice.BorderColor = Nothing
        lblCoffeeMessage.Text = String.Empty
        txtReleaseDate.BorderColor = Nothing
        txtSaleStartDate.BorderColor = Nothing
        txtSaleEndDate.BorderColor = Nothing

        If Trim(txtCoffeeSKU.Text) = String.Empty Then
            lblCoffeeMessage.Text = "A unique SKU is required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeSKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCoffeeName.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee name required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeName.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCoffeeBrand.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee brand required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeBrand.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCoffeeRoast.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee roast required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeRoast.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCoffeeBody.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee body required"
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeBody.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(txtCoffeeQty.Text) Then
            lblCoffeeMessage.Text = "Quantity must be of numeric value."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(txtCoffeePrice.Text) Then
            lblCoffeeMessage.Text = "Price must be of numeric value."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeePrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        Dim SalePrice As Decimal = 0.0
        If ckCoffeeIsOnSale.Checked Then
            If Not IsNumeric(txtCoffeeSalePrice.Text) Then
                lblCoffeeMessage.Text = "Sale price must be of numeric value."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                txtCoffeeSalePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        'check to make sure that Is On sale was not checked by accident by making sure 
        'there is an actual price in the txtAccessorySalePrice.text
        If ckCoffeeIsOnSale.Checked AndAlso IsNumeric(txtCoffeeSalePrice.Text) Then
            Dim CheckThePrice As Decimal = Math.Round(CDec(txtCoffeeSalePrice.Text), 2)
            If CheckThePrice = 0.0 Then
                lblCoffeeMessage.Text = "You've marked this item as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                SalePrice = txtCoffeeSalePrice.Text
            End If
        End If

        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            'They are trying to set a release date for a later time. We need to make sure the date entered is a valid date.
            If Not IsDate(txtReleaseDate.Text) Then
                txtReleaseDate.BorderColor = Drawing.Color.Red
                lblCoffeeMessage.Text = "Release date entered is invalid."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim PublishDate As Date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            If IsDate(txtReleaseDate.Text) Then
                PublishDate = CDate(txtReleaseDate.Text).ToString("yyyy/MM/dd HH:mm:ss")
            Else
                lblCoffeeMessage.Text = "Please enter a valid publish date and time."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                txtReleaseDate.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim SaleStartDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim SaleEndDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        If ckCoffeeIsOnSale.Checked Then

            'make sure a valid start and end date have been set
            If Not IsDate(txtSaleStartDate.Text) Then
                lblCoffeeMessage.Text = "Please enter a valid sale start date."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                txtSaleStartDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SaleStartDate = CDate(txtSaleStartDate.Text).ToString("yyyy/MM/dd")
            End If

            If Not IsDate(txtSaleEndDate.Text) Then
                lblCoffeeMessage.Text = "Please enter a valid sale end date."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                txtSaleEndDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SaleEndDate = CDate(txtSaleEndDate.Text).ToString("yyyy/MM/dd")
            End If

        End If


        'Check If SKU already exists. If so, then call update, else insert new.

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtCoffeeSKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then
            If dt.Rows(0).Item("Category") = "Coffee" Then
                If hfCoffeeProductID.Value = Nothing Then
                    lblCoffeeMessage.Text = "Failed To Save: To update a product, please make sure to have selected the item first from the list."
                    lblCoffeeMessage.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    storedProcedure = "sp_Update_Coffee"
                End If

            Else
                lblCoffeeMessage.Text = "This SKU is already being used by another product in the " & dt.Rows(0).Item("Category") & " category."
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If

        Else
            storedProcedure = "sp_Insert_Coffee"
            If Not fuCoffeeImage.HasFile Then
                lblCoffeeMessage.Text = "Please upload an image for the product"
                lblCoffeeMessage.ForeColor = Drawing.Color.Red
                fuCoffeeImage.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If



        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtCoffeeSKU.Text)
            cmd.Parameters.AddWithValue("@Name", txtCoffeeName.Text)
            cmd.Parameters.AddWithValue("@Roast", txtCoffeeRoast.Text)
            cmd.Parameters.AddWithValue("@Body", txtCoffeeBody.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtCoffeeQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtCoffeePrice.Text))
            cmd.Parameters.AddWithValue("@Description", txtCoffeeDescription.Value)
            cmd.Parameters.AddWithValue("@Image", fuCoffeeImage.FileBytes)
            cmd.Parameters.AddWithValue("@Brand", txtCoffeeBrand.Text)
            cmd.Parameters.AddWithValue("@IsFeatured", CByte(ckCoffeeIsFeatured.Checked))
            cmd.Parameters.AddWithValue("@IsOnSale", CByte(ckCoffeeIsOnSale.Checked))
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice)
            cmd.Parameters.AddWithValue("@ShowInStore", CByte(ddlShowItem.SelectedValue))
            cmd.Parameters.AddWithValue("@PublishDate", PublishDate)
            cmd.Parameters.AddWithValue("@SaleStartDate", SaleStartDate)
            cmd.Parameters.AddWithValue("@SaleEndDate", SaleEndDate)
            If storedProcedure = "sp_Insert_Coffee" Then
                cmd.Parameters.AddWithValue("@Category", "Coffee")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfCoffeeProductID.Value))
            End If


            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using

        ClearForm()

    End Sub

    Protected Sub btnDeleteCoffee_Click(sender As Object, e As EventArgs) Handles btnDeleteCoffee.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_Coffee"
            cmd.Parameters.AddWithValue("@ProductID", hfCoffeeProductID.Value)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()
    End Sub

    Public Sub ClearForm()
        txtCoffeeSKU.Text = ""
        txtCoffeeName.Text = ""
        txtCoffeeBrand.Text = ""
        txtCoffeeRoast.Text = ""
        txtCoffeeBody.Text = ""
        txtCoffeeQty.Text = ""
        txtCoffeePrice.Text = ""
        txtCoffeeDescription.Value = ""
        lblCoffeeMessage.Text = String.Empty
        ckCoffeeIsFeatured.Checked = False
        hfCoffeeProductID.Value = Nothing
        ckCoffeeIsOnSale.Checked = False
        txtCoffeeSalePrice.Text = ""
        txtReleaseDate.Text = " "
        txtSaleStartDate.Text = " "
        txtSaleEndDate.Text = " "
    End Sub
End Class