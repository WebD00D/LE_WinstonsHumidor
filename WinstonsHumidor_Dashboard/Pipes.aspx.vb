﻿Imports System.Data.SqlClient
Public Class Pipes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSavePipe_Click(sender As Object, e As EventArgs) Handles btnSavePipe.Click

        'validate
        txtPipeSKU.BorderColor = Nothing
        txtPipeName.BorderColor = Nothing
        txtPipeBrand.BorderColor = Nothing
        txtPipeMaterial.BorderColor = Nothing
        txtPipeBodyShape.BorderColor = Nothing
        txtPipeStemShape.BorderColor = Nothing
        txtPipeBowlFinish.BorderColor = Nothing
        txtPipeQty.BorderColor = Nothing
        txtPipePrice.BorderColor = Nothing
        fuPipeImage.BorderColor = Nothing
        txtPipesSalePrice.BorderColor = Nothing
        lblPipeMessage.ForeColor = Nothing
        lblPipeMessage.Text = " "
        txtReleaseDate.BorderColor = Nothing
        txtSaleStartDate.BorderColor = Nothing
        txtSaleEndDate.BorderColor = Nothing

        If Trim(txtPipeSKU.Text) = String.Empty Then
            lblPipeMessage.Text = "SKU is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeSKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeName.Text) = String.Empty Then
            lblPipeMessage.Text = "Name is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeName.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeBrand.Text) = String.Empty Then
            lblPipeMessage.Text = "Brand is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeBrand.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeMaterial.Text) = String.Empty Then
            lblPipeMessage.Text = "Material is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeMaterial.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeBodyShape.Text) = String.Empty Then
            lblPipeMessage.Text = "Body shape is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeBodyShape.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeStemShape.Text) = String.Empty Then
            lblPipeMessage.Text = "Stem shape is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeStemShape.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeBowlFinish.Text) = String.Empty Then
            lblPipeMessage.Text = "Bowl finish is required"
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeBowlFinish.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeQty.Text) = String.Empty Or Not IsNumeric(txtPipeQty.Text) Then
            lblPipeMessage.Text = "A numeric value is required for pipe quantity."
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipeQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipePrice.Text) = String.Empty Or Not IsNumeric(txtPipePrice.Text) Then
            lblPipeMessage.Text = "A numeric value is required for pipe price."
            lblPipeMessage.ForeColor = Drawing.Color.Red
            txtPipePrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        Dim SalePrice As Decimal = 0.0
        If ckPipesIsOnSale.Checked Then
            If Not IsNumeric(txtPipesSalePrice.Text) Then
                lblPipeMessage.Text = "Sale price must be of numeric value."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                txtPipesSalePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If
        'check to make sure that Is On sale was not checked by accident by making sure 
        'there is an actual price in the txtAccessorySalePrice.text
        If ckPipesIsOnSale.Checked AndAlso IsNumeric(txtPipesSalePrice.Text) Then
            Dim CheckThePrice As Decimal = Math.Round(CDec(txtPipesSalePrice.Text), 2)
            If CheckThePrice = 0.0 Then
                lblPipeMessage.Text = "You've marked this item as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                SalePrice = txtPipesSalePrice.Text
            End If
        End If



        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            'They are trying to set a release date for a later time. We need to make sure the date entered is a valid date.
            If Not IsDate(txtReleaseDate.Text) Then
                txtReleaseDate.BorderColor = Drawing.Color.Red
                lblPipeMessage.Text = "Release date entered is invalid."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim PublishDate As Date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            If IsDate(txtReleaseDate.Text) Then
                PublishDate = CDate(txtReleaseDate.Text).ToString("yyyy/MM/dd HH:mm:ss")
            Else
                lblPipeMessage.Text = "Please enter a valid publish date and time."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                txtReleaseDate.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim SaleStartDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim SaleEndDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        If ckPipesIsOnSale.Checked Then

            'make sure a valid start and end date have been set
            If Not IsDate(txtSaleStartDate.Text) Then
                lblPipeMessage.Text = "Please enter a valid sale start date."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                txtSaleStartDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SaleStartDate = CDate(txtSaleStartDate.Text).ToString("yyyy/MM/dd")
            End If

            If Not IsDate(txtSaleEndDate.Text) Then
                lblPipeMessage.Text = "Please enter a valid sale end date."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                txtSaleEndDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SaleEndDate = CDate(txtSaleEndDate.Text).ToString("yyyy/MM/dd")
            End If

        End If

        'check if SKU Exists
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtPipeSKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then
            If dt.Rows(0).Item("Category") = "Pipes" Then
                If hfPipeProductID.Value = Nothing Then
                    lblPipeMessage.Text = "Failed To Save: To update a product, please make sure to have selected the item first from the list."
                    lblPipeMessage.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    storedProcedure = "sp_Update_Pipes"
                End If

            Else
                lblPipeMessage.Text = "This SKU is already being used by another product in the " & dt.Rows(0).Item("Category") & " category."
                lblPipeMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If

        Else
            storedProcedure = "sp_Insert_Pipes"
            If Not fuPipeImage.HasFile Then
                lblPipeMessage.Text = "Please upload an image for the product"
                lblPipeMessage.ForeColor = Drawing.Color.Red
                fuPipeImage.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtPipeSKU.Text)
            cmd.Parameters.AddWithValue("@Brand", txtPipeBrand.Text)
            cmd.Parameters.AddWithValue("@Name", txtPipeName.Text)
            cmd.Parameters.AddWithValue("@Material", txtPipeMaterial.Text)
            cmd.Parameters.AddWithValue("@BodyShape", txtPipeBodyShape.Text)
            cmd.Parameters.AddWithValue("@StemShape", txtPipeStemShape.Text)
            cmd.Parameters.AddWithValue("@BowlFinish", txtPipeBowlFinish.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtPipeQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtPipePrice.Text))
            cmd.Parameters.AddWithValue("@Description", txtPipeDescription.Value)
            cmd.Parameters.AddWithValue("@Image", fuPipeImage.FileBytes)
            cmd.Parameters.AddWithValue("@IsFeatured", CByte(ckPipesIsFeatured.Checked))
            cmd.Parameters.AddWithValue("@IsOnSale", CByte(ckPipesIsOnSale.Checked))
            cmd.Parameters.AddWithValue("@ShowInStore", CByte(ddlShowItem.SelectedValue))
            cmd.Parameters.AddWithValue("@PublishDate", PublishDate)
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice)
            cmd.Parameters.AddWithValue("@SaleStartDate", SaleStartDate)
            cmd.Parameters.AddWithValue("@SaleEndDate", SaleEndDate)
            If storedProcedure = "sp_Insert_Pipes" Then
                cmd.Parameters.AddWithValue("@Category", "Pipes")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfPipeProductID.Value))
            End If


            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()



    End Sub

    Protected Sub btnDeletePipe_Click(sender As Object, e As EventArgs) Handles btnDeletePipe.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_Pipes"
            cmd.Parameters.AddWithValue("@ProductID", hfPipeProductID.Value)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()
    End Sub

    Private Sub ClearForm()
        txtPipeSKU.Text = ""
        txtPipeName.Text = ""
        txtPipeBrand.Text = ""
        txtPipeMaterial.Text = ""
        txtPipeBodyShape.Text = ""
        txtPipeStemShape.Text = ""
        txtPipeBowlFinish.Text = ""
        txtPipeQty.Text = ""
        txtPipePrice.Text = ""
        lblPipeMessage.Text = ""
        ckPipesIsFeatured.Checked = False
        hfPipeProductID.Value = Nothing
        txtPipeDescription.Value = " "
        txtPipesSalePrice.Text = " "
        ckPipesIsOnSale.Checked = False
        txtReleaseDate.Text = " "
        txtSaleStartDate.Text = " "
        txtSaleEndDate.Text = " "
    End Sub
End Class