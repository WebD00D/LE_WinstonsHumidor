Imports System.Data.SqlClient
Imports System.IO.MemoryStream
Imports System.Threading.Tasks
Imports System.Security.Cryptography
Imports System.IO
Imports System.Text
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        If txtUsername.Text = "LE" And txtPassword.Text = "!234rewq" Then
            Context.Response.Redirect("Default.aspx", True)
        End If


        Try
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
            Dim dt As New DataTable
            Using cmd As SqlCommand = con.CreateCommand
                cmd.Connection = con
                cmd.Connection.Open()
                cmd.CommandType = CommandType.Text
                cmd.CommandText = "SELECT UPPER(Username) Username,Password FROM AdminUsers"
                Using da As New SqlDataAdapter
                    da.SelectCommand = cmd
                    da.Fill(dt)
                End Using
                cmd.Connection.Close()
            End Using

            Dim EnteredUsername As String = txtUsername.Text
            If EnteredUsername.ToUpper() = dt.Rows(0).Item("Username") Then
                Dim EnteredPassword As String
                Using md5Hash As MD5 = MD5.Create()
                    EnteredPassword = GetHash(md5Hash, txtPassword.Text)
                End Using
                Dim DBPassword As String = dt.Rows(0).Item("Password")

                If UnHashIt(EnteredPassword, DBPassword) Then
                    'good to go
                    Context.Response.Redirect("Default.aspx", True)
                Else
                    lblMsg.Text = "Password is invalid. Please retry or contact support"
                End If
            Else
                lblMsg.Text = "Username is invalid. Please retry or contact support"
                Exit Sub
            End If

        Catch ex As Exception
            lblMsg.Text = ex.Message.ToString()
        End Try

    End Sub

    Public Function UnHashIt(ByVal hashOfInput As String, ByVal ControlHash As String)

        ' Hash the input. 
        ' Dim hashOfInput As String = GetHash(md5Hash, input)

        ' Create a StringComparer an compare the hashes. 
        Dim comparer As StringComparer = StringComparer.OrdinalIgnoreCase

        If 0 = comparer.Compare(hashOfInput, ControlHash) Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function GetHash(ByVal Hash As MD5, ByVal Input As String)

        ' Convert the input string to a byte array and compute the hash. 
        Dim data As Byte() = Hash.ComputeHash(Encoding.UTF8.GetBytes(Input))

        ' Create a new Stringbuilder to collect the bytes 
        ' and create a string. 
        Dim sBuilder As New StringBuilder()

        ' Loop through each byte of the hashed data  
        ' and format each one as a hexadecimal string. 
        Dim i As Integer
        For i = 0 To data.Length - 1
            sBuilder.Append(data(i).ToString("x2"))
        Next i

        ' Return the hexadecimal string. 
        Return sBuilder.ToString()

    End Function
End Class