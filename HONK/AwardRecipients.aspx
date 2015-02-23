<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AwardRecipients.aspx.cs" Inherits="HONK.AwardRecipients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <ItemSeparatorTemplate>
            <br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <ul class="list-group">
                <li class="list-group-item">
                    <asp:Label ID="full_nameLabel" runat="server" Text='<%# Eval("full_name") %>' />
                    <span class="badge">14</span>
                    Cras justo odio
                </li>
                <li class="list-group-item">
                    <span class="badge">2</span>
                    Dapibus ac facilisis in
                </li>
                <li class="list-group-item">
                    <span class="badge">1</span>
                    Morbi leo risus
                </li>
            </ul>
            <li style="">contestant_id:
                <asp:Label ID="contestant_idLabel" runat="server" Text='<%# Eval("contestant_id") %>' />
                <br />
                full_name:
               
                <br />
                age_name:
               
                <br />
                gender_name:
                <asp:Label ID="gender_nameLabel" runat="server" Text='<%# Eval("gender_name") %>' />
                <br />
                halau_name:
                <asp:Label ID="halau_nameLabel" runat="server" Text='<%# Eval("halau_name") %>' />
                <br />
                kumu_name:
                <asp:Label ID="kumu_nameLabel" runat="server" Text='<%# Eval("kumu_name") %>' />
                <br />
                entry_date:
                <asp:Label ID="entry_dateLabel" runat="server" Text='<%# Eval("entry_date") %>' />
                <br />
                interview:
                <asp:Label ID="interviewLabel" runat="server" Text='<%# Eval("interview") %>' />
                <br />
                interview_tie:
                <asp:Label ID="interview_tieLabel" runat="server" Text='<%# Eval("interview_tie") %>' />
                <br />
                costume_auana:
                <asp:Label ID="costume_auanaLabel" runat="server" Text='<%# Eval("costume_auana") %>' />
                <br />
                costume_auana_tie:
                <asp:Label ID="costume_auana_tieLabel" runat="server" Text='<%# Eval("costume_auana_tie") %>' />
                <br />
                costume_kahiko:
                <asp:Label ID="costume_kahikoLabel" runat="server" Text='<%# Eval("costume_kahiko") %>' />
                <br />
                costume_kahiko_tie:
                <asp:Label ID="costume_kahiko_tieLabel" runat="server" Text='<%# Eval("costume_kahiko_tie") %>' />
                <br />
                costume_palua:
                <asp:Label ID="costume_paluaLabel" runat="server" Text='<%# Eval("costume_palua") %>' />
                <br />
                costume_palua_tie:
                <asp:Label ID="costume_palua_tieLabel" runat="server" Text='<%# Eval("costume_palua_tie") %>' />
                <br />
                hula_auana_net:
                <asp:Label ID="hula_auana_netLabel" runat="server" Text='<%# Eval("hula_auana_net") %>' />
                <br />
                hula_auana_tie:
                <asp:Label ID="hula_auana_tieLabel" runat="server" Text='<%# Eval("hula_auana_tie") %>' />
                <br />
                hula_kahiko_net:
                <asp:Label ID="hula_kahiko_netLabel" runat="server" Text='<%# Eval("hula_kahiko_net") %>' />
                <br />
                hula_kahiko_tie:
                <asp:Label ID="hula_kahiko_tieLabel" runat="server" Text='<%# Eval("hula_kahiko_tie") %>' />
                <br />
                hula_palua_net:
                <asp:Label ID="hula_palua_netLabel" runat="server" Text='<%# Eval("hula_palua_net") %>' />
                <br />
                hula_palua_tie:
                <asp:Label ID="hula_palua_tieLabel" runat="server" Text='<%# Eval("hula_palua_tie") %>' />
                <br />
                combined_hula_score:
                <asp:Label ID="combined_hula_scoreLabel" runat="server" Text='<%# Eval("combined_hula_score") %>' />
                <br />
                combined_hula_break_score:
                <asp:Label ID="combined_hula_break_scoreLabel" runat="server" Text='<%# Eval("combined_hula_break_score") %>' />
                <br />
                overall_score:
                <asp:Label ID="overall_scoreLabel" runat="server" Text='<%# Eval("overall_score") %>' />
                <br />
                overall_break_score:
                <asp:Label ID="overall_break_scoreLabel" runat="server" Text='<%# Eval("overall_break_score") %>' />
                <br />
                music:
                <asp:Label ID="musicLabel" runat="server" Text='<%# Eval("music") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>


    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_ContestantAwardScores"></asp:LinqDataSource>
</asp:Content>
