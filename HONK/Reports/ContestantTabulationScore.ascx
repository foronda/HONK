<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContestantTabulationScore.ascx.cs" Inherits="HONK.Reports.ContestantTabulationScore" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<rsweb:ReportViewer ID="CompleteContestantTabScoreRV" runat="server" Font-Names="Candara" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
    ShowFindControls="False" ShowBackButton="False" ShowZoomControl="False" SplitterBackColor="Aqua" ShowPrintButton="False"
    AsyncRendering="False" SizeToReportContent="True">
    <LocalReport ReportPath="Reports\CompleteContestantTabulationScores.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="ContestantScoreDetails" Name="CompleteContestantReportDataset_Tabulation" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:LinqDataSource ID="ContestantScoreDetails" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Contestants" Where="entry_date == @entry_date && id == @id">
    <WhereParameters>
        <asp:Parameter Name="entry_date" Type="DateTime" DefaultValue="01-01-2013" />
        <asp:Parameter Name="id" Type="Int32" DefaultValue="21"/>
    </WhereParameters>
</asp:LinqDataSource>
