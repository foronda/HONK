<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AwardRecipients.aspx.cs" Inherits="HONK.AwardRecipients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" CssClass="table table-striped table-hover" >
        <Columns>
            <asp:BoundField DataField="EntryDate" HeaderText="entry_date" SortExpression="EntryDate" DataFormatString="{0:yyyy}" />
            <asp:BoundField DataField="AwardName" HeaderText="Award Name" SortExpression="AwardName" />
            <asp:BoundField DataField="Name" HeaderText="Winner" SortExpression="Name" />
            <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
            <asp:BoundField DataField="ScoreTie" HeaderText="Tie Breaker Score" SortExpression="ScoreTie" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="LinqDataSource1_Selecting"></asp:LinqDataSource>
</asp:Content>
