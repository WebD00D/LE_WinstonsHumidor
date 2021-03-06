﻿Imports System.Data.SqlClient
Public Class Cigars
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveCigar_Click(sender As Object, e As EventArgs) Handles btnSaveCigar.Click
        txtCigarSKU.BorderColor = Nothing
        txtCigarName.BorderColor = Nothing
        txtCigarBrand.BorderColor = Nothing
        txtCigarLength.BorderColor = Nothing
        txtCigarRing.BorderColor = Nothing
        txtCigarBoxCount.BorderColor = Nothing
        txtCigarBoxQty.BorderColor = Nothing
        txtCigarSingleQty.BorderColor = Nothing
        txtCigarBoxPrice.BorderColor = Nothing
        txtCigarSinglePrice.BorderColor = Nothing
        lblCigarMessage.Text = " "
        txtCigarBody.BorderColor = Nothing
        fuCigarImage.BorderColor = Nothing
        txtMaxBoxPurchaseAmount.BorderColor = Nothing
        txtMaxSinglePurchaseAmount.BorderColor = Nothing
        txtReleaseDate.BorderColor = Nothing

        txtSingleSaleStartDate.BorderColor = Nothing
        txtSingleSaleEndDate.BorderColor = Nothing
        txtBoxSaleStartDate.BorderColor = Nothing
        txtBoxSaleEndDate.BorderColor = Nothing


      

        'Start Validation
        If Trim(txtCigarSKU.Text) = String.Empty Then
            lblCigarMessage.Text = "SKU is required"
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarSKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarName.Text) = String.Empty Then
            lblCigarMessage.Text = "Cigar name is required"
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarName.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarBrand.Text) = String.Empty Then
            lblCigarMessage.Text = "Cigar brand is required"
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarBrand.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarLength.Text) = String.Empty Then
            lblCigarMessage.Text = "A numeric value is required for cigar length."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarLength.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarRing.Text) = String.Empty Then
            lblCigarMessage.Text = "A numeric value is required for cigar ring."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarRing.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarBody.Text) = String.Empty Then
            lblCigarMessage.Text = "Please specify the body for cigar: Mild, Medium, or Full."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarBody.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        If Trim(txtCigarBoxCount.Text) = String.Empty Or Not IsNumeric(txtCigarBoxCount.Text) Then
            lblCigarMessage.Text = "A numeric value is required for box count."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarBoxCount.BorderColor = Drawing.Color.Red
            Exit Sub
        End If


        If Trim(txtCigarBoxQty.Text) = String.Empty Or Not IsNumeric(txtCigarBoxQty.Text) Then
            lblCigarMessage.Text = "A numeric value is required for box quantity."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarBoxQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarSingleQty.Text) = String.Empty Or Not IsNumeric(txtCigarSingleQty.Text) Then
            lblCigarMessage.Text = "A numeric value is required for single quantity."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarSingleQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If


        If ckCigarIsBoxSaleOnly.Checked = False AndAlso ckCigarIsSingleSaleOnly.Checked = False Then

            If Trim(txtCigarBoxPrice.Text) = String.Empty Or Not IsNumeric(txtCigarBoxPrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for box price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarBoxPrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
            If Trim(txtCigarSinglePrice.Text) = String.Empty Or Not IsNumeric(txtCigarSinglePrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for single price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarSinglePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If

        End If

        If ckCigarIsBoxSaleOnly.Checked = False AndAlso ckCigarIsSingleSaleOnly.Checked = True Then
            If Trim(txtCigarSinglePrice.Text) = String.Empty Or Not IsNumeric(txtCigarSinglePrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for single price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarSinglePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        If ckCigarIsSingleSaleOnly.Checked = False AndAlso ckCigarIsBoxSaleOnly.Checked = True Then
            If Trim(txtCigarBoxPrice.Text) = String.Empty Or Not IsNumeric(txtCigarBoxPrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for box price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarBoxPrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        If ckCigarIsBoxSaleOnly.Checked = True AndAlso ckCigarIsSingleSaleOnly.Checked = True Then
            lblCigarMessage.Text = "Can not check both Box Sale Only and Single Sale Only. Please choose one or the other, or leave them both unchecked."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            ckCigarIsBoxSaleOnly.BorderColor = Drawing.Color.Red
            ckCigarIsSingleSaleOnly.BorderColor = Drawing.Color.Red
            Exit Sub
        End If


        Dim SingleSalePrice As Decimal = 0.0
        If ckCigarSingleIsOnSale.Checked Then
            If Not IsNumeric(txtSingleSalePrice.Text) Then
                lblCigarMessage.Text = "Single sale price must be of numeric value."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtSingleSalePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If
        Dim BoxSalePrice As Decimal = 0.0
        If ckCigarBoxIsOnSale.Checked Then
            If Not IsNumeric(txtBoxSalePrice.Text) Then
                lblCigarMessage.Text = "Box sale price must be of numeric value."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtBoxSalePrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        If ckCigarIsBoxSaleOnly.Checked = True AndAlso ckCigarSingleIsOnSale.Checked = True Then
            lblCigarMessage.Text = "To set singles on sale, please uncheck 'Is Box Sale Only'"
            lblCigarMessage.ForeColor = Drawing.Color.Red
            Exit Sub
        End If

        If ckCigarIsSingleSaleOnly.Checked = True AndAlso ckCigarBoxIsOnSale.Checked = True Then
            lblCigarMessage.Text = "To set boxes on sale, please uncheck 'Is Single Sale Only'"
            lblCigarMessage.ForeColor = Drawing.Color.Red
            Exit Sub
        End If


        'check to make sure that Is On sale was not checked by accident by making sure 
        'there is an actual price in the txtAccessorySalePrice.text
        If ckCigarSingleIsOnSale.Checked AndAlso IsNumeric(txtSingleSalePrice.Text) Then
            Dim CheckTheSinglePrice As Decimal = Math.Round(CDec(txtSingleSalePrice.Text), 2)
            If CheckTheSinglePrice = 0.0 Then
                lblCigarMessage.Text = "You've marked singles as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                SingleSalePrice = txtSingleSalePrice.Text
            End If
        End If
        If ckCigarBoxIsOnSale.Checked AndAlso IsNumeric(txtBoxSalePrice.Text) Then
            Dim CheckTheBoxPrice As Decimal = Math.Round(CDec(txtBoxSalePrice.Text), 2)
            If CheckTheBoxPrice = 0.0 Then
                lblCigarMessage.Text = "You've marked boxes as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                BoxSalePrice = txtBoxSalePrice.Text
            End If
        End If

        If Not Trim(txtMaxBoxPurchaseAmount.Text) = String.Empty Then
            If Not IsNumeric(txtMaxBoxPurchaseAmount.Text) Then
                lblCigarMessage.Text = "Max box purchase must be a numeric."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtMaxBoxPurchaseAmount.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        If Not Trim(txtMaxSinglePurchaseAmount.Text) = String.Empty Then
            If Not IsNumeric(txtMaxSinglePurchaseAmount.Text) Then
                txtMaxSinglePurchaseAmount.BorderColor = Drawing.Color.Red
                lblCigarMessage.Text = "Max box purchase must be a numeric."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            'They are trying to set a release date for a later time. We need to make sure the date entered is a valid date.
            If Not IsDate(txtReleaseDate.Text) Then
                txtReleaseDate.BorderColor = Drawing.Color.Red
                lblCigarMessage.Text = "Release date entered is invalid."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim PublishDate As Date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            If IsDate(txtReleaseDate.Text) Then
                PublishDate = CDate(txtReleaseDate.Text).ToString("yyyy/MM/dd HH:mm:ss")
            Else
                lblCigarMessage.Text = "Please enter a valid publish date and time."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtReleaseDate.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If
        'Dim PublishDate As Date = Date.Now
        'If ddlPublishSettings.SelectedValue = 1 Then
        '    If Not IsDate(dpPubDate.Text & " " & dpPubTime.Text) Then
        '        dpPubDate.BorderColor = Drawing.Color.Red
        '        dpPubTime.BorderColor = Drawing.Color.Red
        '        lblCigarMessage.Text = "Please enter a valid publish date and time."
        '        lblCigarMessage.ForeColor = Drawing.Color.Red
        '        Exit Sub
        '    Else
        '        PublishDate = dpPubDate.Text & " " & dpPubTime.Text
        '    End If

        'End If


        'End Validation

        Dim SinglePrice As Decimal = 0
        Dim BoxPrice As Decimal = 0

        If Not Trim(txtCigarSinglePrice.Text) = String.Empty Then
            SinglePrice = CDec(txtCigarSinglePrice.Text)
        End If
        If Not Trim(txtCigarBoxPrice.Text) = String.Empty Then
            BoxPrice = CDec(txtCigarBoxPrice.Text)
        End If


        Dim SingleSaleStartDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim SingleSaleEndDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim BoxSaleStartDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim BoxSaleEndDate As Date = DateTime.Now.ToString("yyyy/MM/dd")

        If ckCigarSingleIsOnSale.Checked Then

            'make sure a valid start and end date have been set
            If Not IsDate(txtSingleSaleStartDate.Text) Then
                lblCigarMessage.Text = "Please enter a valid sale start date."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtSingleSaleStartDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SingleSaleStartDate = CDate(txtSingleSaleStartDate.Text).ToString("yyyy/MM/dd")
            End If

            If Not IsDate(txtSingleSaleEndDate.Text) Then
                lblCigarMessage.Text = "Please enter a valid sale end date."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtSingleSaleEndDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SingleSaleEndDate = CDate(txtSingleSaleEndDate.Text).ToString("yyyy/MM/dd")
            End If

        End If
        If ckCigarBoxIsOnSale.Checked Then

            'make sure a valid start and end date have been set
            If Not IsDate(txtBoxSaleStartDate.Text) Then
                lblCigarMessage.Text = "Please enter a valid sale start date."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtBoxSaleStartDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                BoxSaleStartDate = CDate(txtBoxSaleStartDate.Text).ToString("yyyy/MM/dd")
            End If

            If Not IsDate(txtBoxSaleEndDate.Text) Then
                lblCigarMessage.Text = "Please enter a valid sale end date."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtBoxSaleEndDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                BoxSaleEndDate = CDate(txtBoxSaleEndDate.Text).ToString("yyyy/MM/dd")
            End If

        End If






        'check if SKU Exists
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtCigarSKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then
            If dt.Rows(0).Item("Category") = "Cigars" Then
                If hfCigarProductID.Value = Nothing Then
                    lblCigarMessage.Text = "Failed To Save: To update a product, please make sure to have selected the item first from the list."
                    lblCigarMessage.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    storedProcedure = "sp_Update_Cigars"
                End If

            Else
                lblCigarMessage.Text = "This SKU is already being used by another product in the " & dt.Rows(0).Item("Category") & " category."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If

        Else
            storedProcedure = "sp_Insert_Cigars"
            If Not fuCigarImage.HasFile Then
                lblCigarMessage.Text = "Please upload an image for the product"
                lblCigarMessage.ForeColor = Drawing.Color.Red
                fuCigarImage.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtCigarSKU.Text)
            cmd.Parameters.AddWithValue("@Brand", txtCigarBrand.Text)
            cmd.Parameters.AddWithValue("@Name", txtCigarName.Text)
            cmd.Parameters.AddWithValue("@Length", txtCigarLength.Text)
            cmd.Parameters.AddWithValue("@Ring", txtCigarRing.Text)
            cmd.Parameters.AddWithValue("@BoxCount", CInt(txtCigarBoxCount.Text))
            cmd.Parameters.AddWithValue("@BoxQty", CInt(txtCigarBoxQty.Text))
            cmd.Parameters.AddWithValue("@SingleQty", CInt(txtCigarSingleQty.Text))
            cmd.Parameters.AddWithValue("@BoxPrice", BoxPrice)
            cmd.Parameters.AddWithValue("@SinglePrice", SinglePrice)
            cmd.Parameters.AddWithValue("@Description", txtCigarDescription.Value)
            cmd.Parameters.AddWithValue("@IsSingleSaleOnly", CByte(ckCigarIsSingleSaleOnly.Checked))
            cmd.Parameters.AddWithValue("@IsBoxSaleOnly", CInt(ckCigarIsBoxSaleOnly.Checked))
            cmd.Parameters.AddWithValue("@Image", fuCigarImage.FileBytes)
            cmd.Parameters.AddWithValue("@IsFeatured", CByte(ckCigarIsFeatured.Checked))
            cmd.Parameters.AddWithValue("@Body", txtCigarBody.Text)
            cmd.Parameters.AddWithValue("@SingleIsOnSale", CByte(ckCigarSingleIsOnSale.Checked))
            cmd.Parameters.AddWithValue("@BoxIsOnSale", CByte(ckCigarBoxIsOnSale.Checked))

            cmd.Parameters.AddWithValue("@SingleSalePrice", SingleSalePrice)
            cmd.Parameters.AddWithValue("@BoxSalePrice", BoxSalePrice)

            cmd.Parameters.AddWithValue("@MaxBoxPurchaseQty", txtMaxBoxPurchaseAmount.Text)
            cmd.Parameters.AddWithValue("@MaxSinglePurchaseQty", txtMaxSinglePurchaseAmount.Text)
            cmd.Parameters.AddWithValue("@PublishDate", PublishDate)
            cmd.Parameters.AddWithValue("@ShowInStore", CByte(ddlShowItem.SelectedValue))

            cmd.Parameters.AddWithValue("@SingleSaleStartDate", SingleSaleStartDate)
            cmd.Parameters.AddWithValue("@SingleSaleEndDate", SingleSaleEndDate)
            cmd.Parameters.AddWithValue("@BoxSaleStartDate", BoxSaleStartDate)
            cmd.Parameters.AddWithValue("@BoxSaleEndDate", BoxSaleEndDate)

            If storedProcedure = "sp_Insert_Cigars" Then
                cmd.Parameters.AddWithValue("@Category", "Cigars")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfCigarProductID.Value))
            End If

            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()



    End Sub

    Protected Sub btnDeleteCigar_Click(sender As Object, e As EventArgs) Handles btnDeleteCigar.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_Cigars"
            cmd.Parameters.AddWithValue("@ProductID", hfCigarProductID.Value)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()
    End Sub

    Public Sub ClearForm()
        txtCigarSKU.Text = " "
        txtCigarName.Text = " "
        txtCigarBrand.Text = " "
        txtCigarLength.Text = " "
        txtCigarRing.Text = " "
        txtCigarBoxCount.Text = " "
        txtCigarBoxQty.Text = " "
        txtCigarSingleQty.Text = " "
        txtCigarBoxPrice.Text = " "
        txtCigarSinglePrice.Text = " "
        lblCigarMessage.Text = " "
        txtCigarBody.Text = " "
        ckCigarIsBoxSaleOnly.Checked = False
        ckCigarIsSingleSaleOnly.Checked = False
        ckCigarIsFeatured.Checked = False
        ckCigarBoxIsOnSale.Checked = False
        ckCigarSingleIsOnSale.Checked = False
        txtSingleSalePrice.Text = " "
        txtBoxSalePrice.Text = " "
        txtCigarDescription.Value = " "
        hfCigarProductID.Value = Nothing
        txtMaxBoxPurchaseAmount.Text = " "
        txtMaxSinglePurchaseAmount.Text = " "
        txtReleaseDate.Text = " "
        txtSingleSaleStartDate.Text = " "
        txtSingleSaleEndDate.Text = " "
        txtBoxSaleStartDate.Text = " "
        txtBoxSaleEndDate.Text = " "
        'dpPubDate.Text = " "
        'dpPubTime.Text = " "
    End Sub
End Class