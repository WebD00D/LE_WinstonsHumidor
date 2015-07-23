Imports System.Data.SqlClient
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
        lblCoffeeMessage.Text = String.Empty

        If Trim(txtCoffeeSKU.Text) = String.Empty Then
            lblCoffeeMessage.Text = "A unique SKU is required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeSKU.BorderColor = Drawing.Color.Red
        End If
        If Trim(txtCoffeeName.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee name required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeName.BorderColor = Drawing.Color.Red
        End If
        If Trim(txtCoffeeBrand.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee brand required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeBrand.BorderColor = Drawing.Color.Red
        End If
        If Trim(txtCoffeeRoast.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee roast required."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeRoast.BorderColor = Drawing.Color.Red
        End If
        If Trim(txtCoffeeBody.Text) = String.Empty Then
            lblCoffeeMessage.Text = "Coffee body required"
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeBody.BorderColor = Drawing.Color.Red
        End If
        If Not IsNumeric(txtCoffeeQty.Text) Then
            lblCoffeeMessage.Text = "Quantity must be of numeric value."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeeQty.BorderColor = Drawing.Color.Red
        End If
        If Not IsNumeric(txtCoffeePrice.Text) Then
            lblCoffeeMessage.Text = "Price must be of numeric value."
            lblCoffeeMessage.ForeColor = Drawing.Color.Red
            txtCoffeePrice.BorderColor = Drawing.Color.Red
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
            storedProcedure = "sp_Update_Coffee"
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
    End Sub
End Class