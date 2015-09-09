Imports System.Data.SqlClient
Public Class Configuration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
            Dim dt As New DataTable
            Using cmd As SqlCommand = con.CreateCommand
                cmd.Connection = con
                cmd.Connection.Open()
                cmd.CommandType = CommandType.Text
                cmd.CommandText = "SELECT * FROM Configuration"
                Using da As New SqlDataAdapter
                    da.SelectCommand = cmd
                    da.Fill(dt)

                End Using
                cmd.Connection.Close()
            End Using

            txtConfigurationTaxPercentage.Text = dt.Rows(0).Item("TaxRatePercentage")
            txtConfigurationShippingCost.Text = Math.Round(dt.Rows(0).Item("ShippingRate"), 2)

            'txtConfigurationDiscountCode.Text = dt.Rows(0).Item("DiscountCode")
            'ckConfigurationDiscountCodeValid.Checked = CBool(dt.Rows(0).Item("DiscountCodeIsValid"))
            'txtDiscountCodeAmount.Text = Math.Round(dt.Rows(0).Item("DiscountAmount"), 2)

        End If
    End Sub

    Protected Sub btnSaveConfig_Click(sender As Object, e As EventArgs) Handles btnSaveConfig.Click

        lblConfigMessage.Text = " "
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("connex").ConnectionString)
        Using cmd As SqlCommand = con.CreateCommand
            cmd.Connection = con
            cmd.Connection.Open()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "UPDATE Configuration SET TaxRatePercentage = " & CDec(txtConfigurationTaxPercentage.Text) & " , ShippingRate = " & CDec(txtConfigurationShippingCost.Text)
            cmd.ExecuteNonQuery()
            cmd.Connection.Close()
            lblConfigMessage.Text = "Successfully updated configuration settings!"
            lblConfigMessage.ForeColor = Drawing.Color.Green
        End Using


    End Sub
End Class