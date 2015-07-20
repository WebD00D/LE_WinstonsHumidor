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
       
        If ckCigarIsSingleSaleOnly.Checked = False Then
            If Trim(txtCigarBoxPrice.Text) = String.Empty Or Not IsNumeric(txtCigarBoxPrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for box price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarBoxPrice.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If
        If ckCigarIsBoxSaleOnly.Checked = False Then
            If Trim(txtCigarSinglePrice.Text) = String.Empty Or Not IsNumeric(txtCigarSinglePrice.Text) Then
                lblCigarMessage.Text = "A numeric value is required for single price."
                lblCigarMessage.ForeColor = Drawing.Color.Red
                txtCigarSinglePrice.BorderColor = Drawing.Color.Red
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




    End Sub

    Protected Sub btnDeleteCigar_Click(sender As Object, e As EventArgs) Handles btnDeleteCigar.Click

    End Sub
End Class