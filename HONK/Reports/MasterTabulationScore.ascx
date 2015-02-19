<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MasterTabulationScore.ascx.cs" Inherits="HONK.Reports.MasterTabulationScore" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<rsweb:ReportViewer ID="MasterTabScoreRV" runat="server" Font-Names="Candara" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
    ShowFindControls="False" ShowBackButton="False" ShowZoomControl="False" SplitterBackColor="Aqua" ShowPrintButton="False"
    AsyncRendering="False" SizeToReportContent="True">
    <LocalReport ReportPath="Reports\MasterTabulationScore.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="MasterScoreDetailsDS" Name="MasterReportDateset_Tabulation" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:LinqDataSource ID="MasterScoreDetailsDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_MasterScoreDetails" Where="entry_date == @entry_date">
    <WhereParameters>
        <asp:Parameter Name="entry_date" Type="DateTime" />
    </WhereParameters>
</asp:LinqDataSource>

