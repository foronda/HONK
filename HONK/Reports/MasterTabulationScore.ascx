<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MasterTabulationScore.ascx.cs" Inherits="HONK.Reports.MasterTabulationScore" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<rsweb:ReportViewer ID="MasterTabScoreRV" runat="server" Font-Names="Candara" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
    ShowFindControls="False" ShowBackButton="False" ShowZoomControl="False" SplitterBackColor="Aqua" ShowPrintButton="True"
    AsyncRendering="True" SizeToReportContent="True">
    <LocalReport ReportPath="Reports\MasterTabulationScore.rdlc">
        <DataSources>
            <rsweb:ReportDataSource DataSourceId="MasterScoreDetailsDS" Name="MasterReportDataset_Tabulation" />
            <rsweb:ReportDataSource DataSourceId="MasterScorePaluaDetailsDS" Name="MasterReportPaluaDataset_Tabulation" />
        </DataSources>
    </LocalReport>
</rsweb:ReportViewer>
<asp:LinqDataSource ID="MasterScoreDetailsDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_MasterScoreDetails" Where="entry_date == @entry_date && gender_name != @gender_name">
    <WhereParameters>
        <asp:Parameter Name="entry_date" Type="DateTime" ConvertEmptyStringToNull="true" />
        <asp:Parameter Name="gender_name" Type="String" DefaultValue="Palua" />
    </WhereParameters>
</asp:LinqDataSource>
<asp:LinqDataSource ID="MasterScorePaluaDetailsDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_MasterScoreDetails" Where="entry_date == @entry_date && gender_name == @gender_name">
    <WhereParameters>
        <asp:Parameter Name="entry_date" Type="DateTime" ConvertEmptyStringToNull="true" />
        <asp:Parameter Name="gender_name" Type="String" DefaultValue="Palua" />
    </WhereParameters>
</asp:LinqDataSource>



