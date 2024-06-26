﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preview_POM.aspx.cs" Inherits="VW_POM.Preview_POM" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.2.Web.WebForms, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Visualización POM</title>
    <link runat="server" rel="shortcut icon" href="logo_heds_Puz_icon.ico" type="logo_heds_Puz_icon" />
    <link runat="server" rel="icon" href="logo_heds_Puz_icon.ico" type="logo_heds_Puz_icon" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- <a>Session timeout:&nbsp;<asp:Label ID="lblSessionTime" runat="server" Text="Session" CssClass="mr-2 d-none d-lg-inline text-gray-600 small" Font-Size="Medium"></asp:Label>minutes</a>--%>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <dx:ASPxDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ReportTypeName="VW_POM.XtraPOM2" Theme="iOS">
                <SettingsReportViewer PrintUsingAdobePlugIn="False" />
                <ToolbarItems>
                    <dx:ReportToolbarButton ItemKind="Search" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="PrintReport" />
                    <dx:ReportToolbarButton ItemKind="PrintPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                    <dx:ReportToolbarLabel ItemKind="PageLabel" />
                    <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                    </dx:ReportToolbarComboBox>
                    <dx:ReportToolbarLabel ItemKind="OfLabel" />
                    <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
                    <dx:ReportToolbarButton ItemKind="NextPage" />
                    <dx:ReportToolbarButton ItemKind="LastPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                    <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                    <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                        <Elements>
                            <dx:ListElement Value="pdf" />
                            <dx:ListElement Value="xls" />
                            <dx:ListElement Value="xlsx" />
                            <dx:ListElement Value="rtf" />
                            <dx:ListElement Value="docx" />
                            <dx:ListElement Value="mht" />
                            <dx:ListElement Value="html" />
                            <dx:ListElement Value="txt" />
                            <dx:ListElement Value="csv" />
                            <dx:ListElement Value="png" />
                        </Elements>
                    </dx:ReportToolbarComboBox>
                </ToolbarItems>
            </dx:ASPxDocumentViewer>
        </div>
        <script type="text/javascript">
            var sessionTimeout = "<%= Session.Timeout %>";
            function DisplaySessionTimeout() {
                //assigning minutes left to session timeout to Label
                document.getElementById("<%= HiddenField1.ClientID %>").innerText =
                    sessionTimeout;
                sessionTimeout = sessionTimeout - 1;

                //if session is not less than 0
                if (sessionTimeout >= 0)
                    //call the function again after 1 minute delay
                    window.setTimeout("DisplaySessionTimeout()", 900000);
                else {
                    //show message box
                    //alert("Your current Session is over.");
                    window.close();
                }
            }
        </script>
    </form>
</body>
</html>
