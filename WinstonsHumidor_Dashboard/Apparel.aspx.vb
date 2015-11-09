Imports System.Data.SqlClient
Public Class Apparel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveApprel_Click(sender As Object, e As EventArgs) Handles btnSaveApprel.Click
        XS.BorderColor = Nothing
        SM.BorderColor = Nothing
        MD.BorderColor = Nothing
        LG.BorderColor = Nothing
        XL.BorderColor = Nothing
        XXL.BorderColor = Nothing
        XXXL.BorderColor = Nothing
        txtApparelSalePrice.BorderColor = Nothing
        fuApprelImg.BorderColor = Nothing
        txtReleaseDate.BorderColor = Nothing
        txtApparelPrice.BorderColor = Nothing
        txtApparelNames.BorderColor = Nothing
        txtApparelSKU.BorderColor = Nothing
        lblApparelMessage.Text = ""

        txtSaleStartDate.BorderColor = Nothing
        txtSaleEndDate.BorderColor = Nothing




        If Trim(txtApparelSKU.Text) = String.Empty Then
            lblApparelMessage.Text = "A unique SKU is required."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            txtApparelSKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtApparelNames.Text) = String.Empty Then
            lblApparelMessage.Text = "Accessory name is required."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            txtApparelNames.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
   
        If Not IsNumeric(XS.Text) Then
            lblApparelMessage.Text = " XS Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            XS.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(SM.Text) Then
            lblApparelMessage.Text = " SM Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            SM.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(MD.Text) Then
            lblApparelMessage.Text = "MD Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            MD.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(LG.Text) Then
            lblApparelMessage.Text = " LG Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            LG.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(XL.Text) Then
            lblApparelMessage.Text = " XL Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            XL.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(XXL.Text) Then
            lblApparelMessage.Text = " XXL Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            XXL.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Not IsNumeric(XXXL.Text) Then
            lblApparelMessage.Text = " XXXL Quantity must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            XXXL.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        If Not IsNumeric(txtApparelPrice.Text) Then
            lblApparelMessage.Text = "Price must be of numeric value."
            lblApparelMessage.ForeColor = Drawing.Color.Red
            txtApparelPrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        Dim SalePrice As Decimal = 0.0
        If ckApparelIsOnSale.Checked Then
            If Not IsNumeric(txtApparelSalePrice.Text) Then
                lblApparelMessage.Text = "Sale price must be of numeric value."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                lblApparelMessage.BorderColor = Drawing.Color.Red
                Exit Sub

            End If
        End If

        'check to make sure that Is On sale was not checked by accident by making sure 
        'there is an actual price in the txtAccessorySalePrice.text
        If ckApparelIsOnSale.Checked AndAlso IsNumeric(txtApparelSalePrice.Text) Then
            Dim CheckThePrice As Decimal = Math.Round(CDec(txtApparelSalePrice.Text), 2)
            If CheckThePrice = 0.0 Then
                ckApparelIsOnSale.BorderColor = Drawing.Color.Red
                lblApparelMessage.Text = "You've marked this item as on sale without a valid price. Please correct, or un check 'Is On Sale'."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            Else
                SalePrice = txtApparelSalePrice.Text
            End If

        End If


        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            'They are trying to set a release date for a later time. We need to make sure the date entered is a valid date.
            If Not IsDate(txtReleaseDate.Text) Then
                txtReleaseDate.BorderColor = Drawing.Color.Red
                lblApparelMessage.Text = "Release date entered is invalid."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Dim PublishDate As Date = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss")
        If Not Trim(txtReleaseDate.Text) = String.Empty Then
            If IsDate(txtReleaseDate.Text) Then
                PublishDate = CDate(txtReleaseDate.Text).ToString("yyyy/MM/dd HH:mm:ss")
            Else
                lblApparelMessage.Text = "Please enter a valid publish date."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                txtReleaseDate.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If

        Dim SaleStartDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        Dim SaleEndDate As Date = DateTime.Now.ToString("yyyy/MM/dd")
        If ckApparelIsOnSale.Checked Then

            'make sure a valid start and end date have been set
            If Not IsDate(txtSaleStartDate.Text) Then
                lblApparelMessage.Text = "Please enter a valid sale start date."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                txtSaleStartDate.BorderColor = Drawing.Color.Red
                Exit Sub
            Else
                SaleStartDate = CDate(txtSaleStartDate.Text).ToString("yyyy/MM/dd")
            End If

            If Not IsDate(txtSaleEndDate.Text) Then
                lblApparelMessage.Text = "Please enter a valid sale end date."
                lblApparelMessage.ForeColor = Drawing.Color.Red
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
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtApparelSKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then
            If dt.Rows(0).Item("Category") = "Apparel" Then
                If hfApparelProductID.Value = Nothing Then
                    lblApparelMessage.Text = "Failed To Save: To update a product, please make sure to have selected the item first from the list."
                    lblApparelMessage.ForeColor = Drawing.Color.Red
                    Exit Sub
                Else
                    storedProcedure = "sp_Update_Apparel"
                End If

            Else
                lblApparelMessage.Text = "This SKU is already being used by another product in the " & dt.Rows(0).Item("Category") & " category."
                lblApparelMessage.ForeColor = Drawing.Color.Red
                Exit Sub
            End If

        Else
            storedProcedure = "sp_Insert_Apparel"
            If Not fuApprelImg.HasFile Then
                lblApparelMessage.Text = "Please upload an image for the product"
                lblApparelMessage.ForeColor = Drawing.Color.Red
                fuApprelImg.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtApparelSKU.Text)
            cmd.Parameters.AddWithValue("@Name", txtApparelNames.Text)
            cmd.Parameters.AddWithValue("@Description", txtApprarelDescriptions.Value)
            cmd.Parameters.AddWithValue("@Price", CDec(txtApparelPrice.Text))
            cmd.Parameters.AddWithValue("@XS", CInt(XS.Text))
            cmd.Parameters.AddWithValue("@SM", CInt(SM.Text))
            cmd.Parameters.AddWithValue("@MD", CInt(MD.Text))
            cmd.Parameters.AddWithValue("@LG", CInt(LG.Text))
            cmd.Parameters.AddWithValue("@XL", CInt(XL.Text))
            cmd.Parameters.AddWithValue("@XXL", CInt(XXL.Text))
            cmd.Parameters.AddWithValue("@XXXL", CInt(XXXL.Text))
            cmd.Parameters.AddWithValue("@Img", fuApprelImg.FileBytes)
            cmd.Parameters.AddWithValue("@IsFeatured", CByte(ckApparelIsFeatured.Checked))
            cmd.Parameters.AddWithValue("@IsOnSale", CByte(ckApparelIsOnSale.Checked))
            cmd.Parameters.AddWithValue("@SalePrice", SalePrice)
            cmd.Parameters.AddWithValue("@ShowInStore", CByte(ddlShowItem.SelectedValue))
            cmd.Parameters.AddWithValue("@PublishDate", PublishDate)
            cmd.Parameters.AddWithValue("@SaleStartDate", SaleStartDate)
            cmd.Parameters.AddWithValue("@SaleEndDate", SaleEndDate)
            If storedProcedure = "sp_Insert_Apparel" Then
                cmd.Parameters.AddWithValue("@Category", "Apparel")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfApparelProductID.Value))
            End If

            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearApparelForm()
    End Sub

    Protected Sub btnDeleteApparel_Click(sender As Object, e As EventArgs) Handles btnDeleteApparel.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_Apparel"
            cmd.Parameters.AddWithValue("@ProductID", hfApparelProductID.Value)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearApparelForm()
    End Sub
    Public Sub ClearApparelForm()
        txtApparelSKU.Text = ""
        txtApparelNames.Text = ""
        txtApprarelDescriptions.Value = ""
        txtApparelPrice.Text = ""
        XS.Text = ""
        SM.Text = ""
        MD.Text = ""
        LG.Text = ""
        XL.Text = ""
        XXL.Text = ""
        XXXL.Text = ""
        ckApparelIsFeatured.Checked = False
        ckApparelIsOnSale.Checked = False
        txtApparelSalePrice.Text = " "
        hfApparelProductID.Value = Nothing
        txtReleaseDate.Text = " "
        txtSaleStartDate.Text = " "
        txtSaleEndDate.Text = " "
    End Sub
End Class