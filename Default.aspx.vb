Imports System.Net
Imports System.IO
Imports System.Net.ServicePointManager
Imports System.Web.Script.Serialization
Imports System.Runtime.Serialization.Json
Imports System.Globalization

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ServicePointManager.SecurityProtocol = 3072

        If Not Page.IsPostBack = True Then
            PanelResult.Visible = False
            PanelQry.Visible = True
            PanelMessage.Visible = False
            ' Display starting yr n month
            Me.DDLMonth.Items.Clear()
            Me.DDLMonth.AppendDataBoundItems = False
            Me.DDLMonth.Items.Add("JAN")
            Me.DDLMonth.Items.Add("FEB")
            Me.DDLMonth.Items.Add("MAR")
            Me.DDLMonth.Items.Add("APR")
            Me.DDLMonth.Items.Add("MAY")
            Me.DDLMonth.Items.Add("JUN")
            Me.DDLMonth.Items.Add("JUL")
            Me.DDLMonth.Items.Add("AUG")
            Me.DDLMonth.Items.Add("SEP")
            Me.DDLMonth.Items.Add("OCT")
            Me.DDLMonth.Items.Add("NOV")
            Me.DDLMonth.Items.Add("DEC")

            Me.DDLYear.Items.Clear()
            Me.DDLYear.AppendDataBoundItems = False
            For i As UInt16 = Year(CDate("01/01/1983")) To Year(Now)
                Me.DDLYear.Items.Add(CInt(i))
            Next
            Me.DDLYear.SelectedValue = CInt(Year(Now()))

            ' Display ending yr n month
            Me.DDLEMonth.Items.Clear()
            Me.DDLEMonth.AppendDataBoundItems = False
            Me.DDLEMonth.Items.Add("JAN")
            Me.DDLEMonth.Items.Add("FEB")
            Me.DDLEMonth.Items.Add("MAR")
            Me.DDLEMonth.Items.Add("APR")
            Me.DDLEMonth.Items.Add("MAY")
            Me.DDLEMonth.Items.Add("JUN")
            Me.DDLEMonth.Items.Add("JUL")
            Me.DDLEMonth.Items.Add("AUG")
            Me.DDLEMonth.Items.Add("SEP")
            Me.DDLEMonth.Items.Add("OCT")
            Me.DDLEMonth.Items.Add("NOV")
            Me.DDLEMonth.Items.Add("DEC")

            Me.DDLEYear.Items.Clear()
            Me.DDLEYear.AppendDataBoundItems = False
            For i As UInt16 = Year(CDate("01/01/1983")) To Year(Now)
                Me.DDLEYear.Items.Add(CInt(i))
            Next
            Me.DDLEYear.SelectedValue = CInt(Year(Now()))

        End If
    End Sub

    Private Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If ChkCriteria.SelectedValue = Nothing Then

            PanelResult.Visible = False
            PanelMessage.Visible = True
            PanelQry.Visible = True
            lblMessage.Text = "Please select atleast one criteria to view the results"
            Exit Sub
        End If

        PanelResult.Visible = False
        Dim sMonth As String = DDLMonth.SelectedValue.ToString.Trim
        Dim esMonth As String = DDLEMonth.SelectedValue.ToString.Trim
        Dim nMonth As String = ""
        Dim enMonth As String = ""
        Select Case sMonth
            Case "JAN"
                nMonth = "01"
            Case "FEB"
                nMonth = "02"
            Case "MAR"
                nMonth = "03"
            Case "APR"
                nMonth = "04"
            Case "MAY"
                nMonth = "05"
            Case "JUN"
                nMonth = "06"
            Case "JUL"
                nMonth = "07"
            Case "AUG"
                nMonth = "08"
            Case "SEP"
                nMonth = "09"
            Case "OCT"
                nMonth = "10"
            Case "NOV"
                nMonth = "11"
            Case "DEC"
                nMonth = "12"
        End Select
        Select Case esMonth
            Case "JAN"
                enMonth = "01"
            Case "FEB"
                enMonth = "02"
            Case "MAR"
                enMonth = "03"
            Case "APR"
                enMonth = "04"
            Case "MAY"
                enMonth = "05"
            Case "JUN"
                enMonth = "06"
            Case "JUL"
                enMonth = "07"
            Case "AUG"
                enMonth = "08"
            Case "SEP"
                enMonth = "09"
            Case "OCT"
                enMonth = "10"
            Case "NOV"
                enMonth = "11"
            Case "DEC"
                enMonth = "12"
        End Select
        Dim nYear As Int32 = DDLYear.SelectedValue
        Dim enYear As Int32 = DDLEYear.SelectedValue
        If nYear > enYear Then
            PanelResult.Visible = False
            PanelQry.Visible = True
            PanelMessage.Visible = True
            lblMessage.Text = "Start Year cannot be greater than End Year"
            Exit Sub
        ElseIf nYear = enYear Then
            If Int16.Parse(nMonth) > Int16.Parse(enMonth) Then
                PanelResult.Visible = False
                PanelQry.Visible = True
                PanelMessage.Visible = True
                lblMessage.Text = "Start Period cannot be greater than End Period"
                Exit Sub
            End If
        End If

        Dim eom As String = nYear.ToString.Trim & "-" & nMonth.ToString.Trim
        Dim eeom As String = enYear.ToString.Trim & "-" & enMonth.ToString.Trim

        Dim strChk As String = "end_of_month"

        For Each li As ListItem In ChkCriteria.Items
            If li.Selected = True Then
                strChk = strChk & "," & li.Value.ToString
            End If
        Next
        'Page.Response.Write(strChk)
        'Page.Response.End()
        Dim request As HttpWebRequest = Nothing
        Dim response As HttpWebResponse = Nothing
        Dim reader As StreamReader = Nothing
        Dim json As String = Nothing
        Dim vURIString As String = Nothing

        Dim sStr As String = Nothing
        'lblTotal.Text = eom.ToString
        Try
            'Create web request   
            vURIString &= "https://eservices.mas.gov.sg/api/action/datastore/search.json"
            vURIString &= "?resource_id=5f2b18a8-0883-4769-a635-879c63d3caac"
            vURIString &= "&limit=100"
            vURIString &= "&fields=" & strChk
            If eom.ToString <> "" Then
                vURIString &= "&between[end_of_month]=" & eom & "," & eeom

                request = DirectCast(WebRequest.Create("https://eservices.mas.gov.sg/api/action/datastore/search.json?resource_id=5f2b18a8-0883-4769-a635-879c63d3caac&limit=1"), HttpWebRequest)
                request = DirectCast(WebRequest.Create(vURIString), HttpWebRequest)
                response = DirectCast(request.GetResponse(), HttpWebResponse)

                'Get response stream into a reader   
                reader = New StreamReader(response.GetResponseStream())
                json = reader.ReadToEnd()
                'lblTotal.Text = json.Trim
                response.Close()
                Dim jss As New JavaScriptSerializer()

                Dim myData As MASData.RootData = jss.Deserialize(Of MASData.RootData)(json)
                If myData.success = True Then
                    Dim dataRecords = myData.result.records.ToList

                    gvReportTA.DataSource = dataRecords

                    gvReportTA.DataBind()
                    PanelResult.Visible = True
                    PanelQry.Visible = False
                    PanelMessage.Visible = False

                Else
                    ' show any related message
                End If

            Else
                ' action for no end_of_month
            End If

        Catch wex As System.Net.WebException
            Dim wMessage As String = "Net Exception Error: " & wex.ToString()
            lblMessage.Text = wMessage.Trim
            PanelMessage.Visible = True
        Catch ex As Exception
            Dim Message As String = "Error: " & ex.ToString()
            lblMessage.Text = Message.Trim
            PanelMessage.Visible = True
        Finally
            If (response IsNot Nothing) Then
                response.Close()
            End If
        End Try
    End Sub

    Protected Sub cbSelectAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbSelectAll.CheckedChanged
        If cbSelectAll.Checked = True Then
            cbClearAll.Checked = False
            For Each li As ListItem In ChkCriteria.Items
                li.Selected = True
            Next
        End If
    End Sub

    Protected Sub cbClearAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbClearAll.CheckedChanged
        If cbClearAll.Checked = True Then
            cbSelectAll.Checked = False
            For Each li As ListItem In ChkCriteria.Items
                li.Selected = False
            Next
        End If
    End Sub
End Class

