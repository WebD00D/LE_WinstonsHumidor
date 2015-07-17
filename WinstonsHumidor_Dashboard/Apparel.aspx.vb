Imports System.Data.SqlClient
Public Class Apparel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSaveApprel_Click(sender As Object, e As EventArgs) Handles btnSaveApprel.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "sp_Insert_Apparel"
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
            cmd.Parameters.AddWithValue("@Category", "Apparel")
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using
        ClearApparelForm()
    End Sub

    Protected Sub btnDeleteApparel_Click(sender As Object, e As EventArgs) Handles btnDeleteApparel.Click

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
    End Sub
End Class