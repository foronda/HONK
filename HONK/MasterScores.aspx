<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MasterScores.aspx.cs" Inherits="HONK.MasterScores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <Br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="MasterScoreDetailsLDS" CssClass="table table-striped table-hover" AllowPaging="True" AllowSorting="True" >
        <Columns>
            <asp:BoundField DataField="entry_num_fri" HeaderText="Fri" SortExpression="entry_num_fri" />
            <asp:BoundField DataField="entry_num_sat" HeaderText="Sat" SortExpression="entry_num_sat" />
            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
            <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
            <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
            <asp:BoundField DataField="interview" HeaderText="Interview Score" SortExpression="interview" />
            <asp:BoundField DataField="interview_tie" HeaderText="Interview Tie" SortExpression="interview_tie" />
            <asp:BoundField DataField="overall_score" HeaderText="Overall Score" SortExpression="overall_score" DataFormatString="{0:0.0}" />
            <asp:BoundField DataField="overall_break_score" HeaderText="Overall Score Tie" SortExpression="overall_break_score" DataFormatString="{0:0.0}" />
            <asp:BoundField DataField="music" HeaderText="Saturday Music" SortExpression="music" />
            <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
            <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="MasterScoreDetailsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="overall_score desc" TableName="vw_MasterScoreDetails"></asp:LinqDataSource>
</asp:Content>
