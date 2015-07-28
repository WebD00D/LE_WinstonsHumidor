Imports System.Data.SqlClient
Imports System.IO
Imports System.IO.MemoryStream
Public Class News
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    
    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs) Handles btnSavePost.Click
        Dim StoredProcedure = Nothing
        If hfPostID.Value = Nothing Then
            StoredProcedure = "sp_Insert_NewsPosts"
        Else
            StoredProcedure = "sp_Update_NewsPost"
        End If

            Dim mStream As New MemoryStream()
            ASPxHtmlEditor1.Export(DevExpress.Web.ASPxHtmlEditor.HtmlEditorExportFormat.Txt, mStream)
            Dim PlainText = System.Text.Encoding.UTF8.GetString(mStream.ToArray())


            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
            Using cmd As SqlCommand = con.CreateCommand
                cmd.Connection = con
                cmd.Connection.Open()
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = StoredProcedure
                cmd.Parameters.AddWithValue("@PostedBy", "Developer")
            cmd.Parameters.AddWithValue("@HTML", ASPxHtmlEditor1.Html)
                cmd.Parameters.AddWithValue("@PostImage", fuPostImage.FileBytes)
                cmd.Parameters.AddWithValue("@PostTitle", txtPostTitle.Text)
            cmd.Parameters.AddWithValue("@PlainText", PlainText)
            cmd.Parameters.AddWithValue("@PostType", ddlPostType.SelectedValue.ToString())
                If StoredProcedure = "sp_Update_NewsPost" Then
                    cmd.Parameters.AddWithValue("@PostID", hfPostID.Value)
                End If
                cmd.ExecuteNonQuery()
                cmd.Connection.Close()

            End Using

            lblPostMessage.Text = "Post successfully saved!"
            lblPostMessage.ForeColor = Drawing.Color.Green

    End Sub

    Protected Sub btnLoadPostHTML_Click(sender As Object, e As EventArgs) Handles btnLoadPostHTML.Click

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "SELECT * FROM NewsPosts WHERE PostID = " & hfPostID.Value
            Using da As New SqlDataAdapter
                da.SelectCommand = cmd
                da.Fill(dt)
            End Using
            cmd.Connection.Close()
        End Using



        txtPostTitle.Text = dt.Rows(0).Item("PostTitle")
        ASPxHtmlEditor1.Html = dt.Rows(0).Item("HTML")
        hfPostID.Value = dt.Rows(0).Item("PostID")
        ddlPostType.SelectedValue = dt.Rows(0).Item("PostType")


    End Sub

    Protected Sub btnClearForm_Click(sender As Object, e As EventArgs) Handles btnClearForm.Click
        txtPostTitle.Text = ""
        ASPxHtmlEditor1.Html = ""
        hfPostID.Value = Nothing
    End Sub

    Protected Sub btnDeletePost_Click(sender As Object, e As EventArgs) Handles btnDeletePost.Click
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Dim dt As New DataTable
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "DELETE FROM NewsPosts WHERE PostID = " & hfPostID.Value
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
        End Using

        txtPostTitle.Text = ""
        ASPxHtmlEditor1.Html = ""
        hfPostID.Value = Nothing
        lblPostMessage.Text = "Post Deleted."
    End Sub
End Class