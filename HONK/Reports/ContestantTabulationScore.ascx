<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContestantTabulationScore.ascx.cs" Inherits="HONK.Reports.ContestantTabulationScore" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<rsweb:ReportViewer ID="ContestantTabScoreRV" runat="server" Font-Names="Candara" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
    ShowFindControls="False" ShowBackButton="False" ShowZoomControl="False" SplitterBackColor="Aqua" ShowPrintButton="False"
    AsyncRendering="False" SizeToReportContent="True">
    <LocalReport ReportPath="Reports\ContestantTabulationScore.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ContestantScoreDetails" Name="ContestantReportDataset_Tabulation" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:LinqDataSource ID="ContestantScoreDetails" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_ContestantDetailsAllScores" Where="entry_date == @entry_date && id == @id">
    <WhereParameters>
        <asp:Parameter Name="entry_date" Type="DateTime" />
        <asp:Parameter Name="id" Type="Int32"/>
    </WhereParameters>
</asp:LinqDataSource>
