Imports System.Data.SqlClient
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
        If Trim(txtCigarLength.Text) = String.Empty Or Not IsNumeric(txtCigarLength.Text) Then
            lblCigarMessage.Text = "A numeric value is required for cigar length."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarLength.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtCigarRing.Text) = String.Empty Or Not IsNumeric(txtCigarRing.Text) Then
            lblCigarMessage.Text = "A numeric value is required for cigar ring."
            lblCigarMessage.ForeColor = Drawing.Color.Red
            txtCigarRing.BorderColor = Drawing.Color.Red
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
        'End Validation



        Dim SinglePrice As Decimal = 0
        Dim BoxPrice As Decimal = 0

        If Not Trim(txtCigarSinglePrice.Text) = String.Empty Then
            SinglePrice = CDec(txtCigarSinglePrice.Text)
        End If
        If Not Trim(txtCigarBoxPrice.Text) = String.Empty Then
            BoxPrice = CDec(txtCigarBoxPrice.Text)
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
            storedProcedure = "sp_Update_Cigars"
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
            cmd.Parameters.AddWithValue("@Length", CInt(txtCigarLength.Text))
            cmd.Parameters.AddWithValue("@Ring", CInt(txtCigarRing.Text))
            cmd.Parameters.AddWithValue("@BoxCount", CInt(txtCigarBoxCount.Text))
            cmd.Parameters.AddWithValue("@BoxQty", CInt(txtCigarBoxQty.Text))
            cmd.Parameters.AddWithValue("@SingleQty", CInt(txtCigarSingleQty.Text))
            cmd.Parameters.AddWithValue("@BoxPrice", BoxPrice)
            cmd.Parameters.AddWithValue("@SinglePrice", SinglePrice)
            cmd.Parameters.AddWithValue("@Description", txtCigarDescription.Value)
            cmd.Parameters.AddWithValue("@IsSingleSaleOnly", CByte(ckCigarIsSingleSaleOnly.Checked))
            cmd.Parameters.AddWithValue("@IsBoxSaleOnly", CInt(ckCigarIsBoxSaleOnly.Checked))
            cmd.Parameters.AddWithValue("@Image", fuCigarImage.FileBytes)

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
        ckCigarIsBoxSaleOnly.Checked = False
        ckCigarIsSingleSaleOnly.Checked = False
    End Sub
End Class