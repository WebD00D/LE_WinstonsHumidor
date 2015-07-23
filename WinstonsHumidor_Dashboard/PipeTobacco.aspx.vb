Imports System.Data.SqlClient
Public Class PipeTobacco
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSavePipeTobacco_Click(sender As Object, e As EventArgs) Handles btnSavePipeTobacco.Click

        txtPipeTobaccoSKU.BorderColor = Nothing
        txtPipeTobaccoBrand.BorderColor = Nothing
        txtPipeTobacco.BorderColor = Nothing
        txtPipeTobaccoStrength.BorderColor = Nothing
        txtPipeTobaccoCut.BorderColor = Nothing
        txtPipeTobaccoStyle.BorderColor = Nothing
        txtPipeTobaccoPrice.BorderColor = Nothing
        fuPipeTobaccoImage.BorderColor = Nothing
        txtPipeTobaccoQty.BorderColor = Nothing
        lblPipeTobaccoMessage.Text = " "

        If Trim(txtPipeTobaccoSKU.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "SKU is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoSKU.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobaccoBrand.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "Brand is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoBrand.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobacco.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "Tobacco name is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobacco.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobaccoStyle.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "Tobacco style is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoStyle.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobaccoCut.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "Tobacco cut is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoCut.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobaccoStrength.Text) = String.Empty Then
            lblPipeTobaccoMessage.Text = "Tobacco strength is required"
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoStrength.BorderColor = Drawing.Color.Red
            Exit Sub
        End If
        If Trim(txtPipeTobaccoQty.Text) = String.Empty Or Not IsNumeric(txtPipeTobaccoQty.Text) Then
            lblPipeTobaccoMessage.Text = "A numeric value is required for tobacco quantity."
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoQty.BorderColor = Drawing.Color.Red
            Exit Sub
        End If

        If Trim(txtPipeTobaccoPrice.Text) = String.Empty Or Not IsNumeric(txtPipeTobaccoPrice.Text) Then
            lblPipeTobaccoMessage.Text = "A numeric value is required for tobacco price."
            lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
            txtPipeTobaccoPrice.BorderColor = Drawing.Color.Red
            Exit Sub
        End If


        'check if SKU Exists
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM Products WHERE SKU = '" & txtPipeTobaccoSKU.Text & "'"
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using

        Dim storedProcedure As String = String.Empty

        If dt.Rows().Count > 0 Then
            storedProcedure = "sp_Update_PipeTobacco"
        Else
            storedProcedure = "sp_Insert_PipeTobacco"
            If Not fuPipeTobaccoImage.HasFile Then
                lblPipeTobaccoMessage.Text = "Please upload an image for the product"
                lblPipeTobaccoMessage.ForeColor = Drawing.Color.Red
                fuPipeTobaccoImage.BorderColor = Drawing.Color.Red
                Exit Sub
            End If
        End If


        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = storedProcedure
            cmd.Parameters.AddWithValue("@SKU", txtPipeTobaccoSKU.Text)
            cmd.Parameters.AddWithValue("@Brand", txtPipeTobaccoBrand.Text)
            cmd.Parameters.AddWithValue("@Tobacco", txtPipeTobacco.Text)
            cmd.Parameters.AddWithValue("@Style", txtPipeTobaccoStyle.Text)
            cmd.Parameters.AddWithValue("@Cut", txtPipeTobaccoCut.Text)
            cmd.Parameters.AddWithValue("@Strength", txtPipeTobaccoStrength.Text)
            cmd.Parameters.AddWithValue("@Qty", CInt(txtPipeTobaccoQty.Text))
            cmd.Parameters.AddWithValue("@Price", CDec(txtPipeTobaccoPrice.Text))
            cmd.Parameters.AddWithValue("@Description", txtPipeTobaccoDescription.Value)
            cmd.Parameters.AddWithValue("@Image", fuPipeTobaccoImage.FileBytes)
            cmd.Parameters.AddWithValue("@IsFeatured", CByte(ckPipeTobaccoIsFeatured.Checked))


            If storedProcedure = "sp_Insert_PipeTobacco" Then
                cmd.Parameters.AddWithValue("@Category", "Pipe Tobacco")

            Else
                cmd.Parameters.AddWithValue("@ProductID", CInt(hfPipeTobaccoProductID.Value))
            End If

            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()


    End Sub

    Protected Sub btnDeletePipeTobacco_Click(sender As Object, e As EventArgs) Handles btnDeletePipeTobacco.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Delete_PipeTobacco"
            cmd.Parameters.AddWithValue("@ProductID", hfPipeTobaccoProductID.Value)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearForm()
    End Sub

    Private Sub ClearForm()
        txtPipeTobaccoSKU.Text = ""
        txtPipeTobaccoBrand.Text = ""
        txtPipeTobacco.Text = ""
        txtPipeTobaccoStrength.Text = ""
        txtPipeTobaccoCut.Text = ""
        txtPipeTobaccoStyle.Text = ""
        txtPipeTobaccoPrice.Text = ""
        txtPipeTobaccoQty.Text = ""
        lblPipeTobaccoMessage.Text = " "
        txtPipeTobaccoDescription.Value = ""
        txtPipeTobaccoSKU.BorderColor = Nothing
        txtPipeTobaccoBrand.BorderColor = Nothing
        txtPipeTobacco.BorderColor = Nothing
        txtPipeTobaccoStrength.BorderColor = Nothing
        txtPipeTobaccoCut.BorderColor = Nothing
        txtPipeTobaccoStyle.BorderColor = Nothing
        txtPipeTobaccoPrice.BorderColor = Nothing
        fuPipeTobaccoImage.BorderColor = Nothing
        txtPipeTobaccoQty.BorderColor = Nothing
        ckPipeTobaccoIsFeatured.Checked = False
    End Sub
End Class