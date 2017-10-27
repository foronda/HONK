<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HonkReports.aspx.cs" Inherits="HONK.HonkReports" %>

<%@ Register Src="~/Reports/MasterTabulationScore.ascx" TagName="MasterTabulationScore" TagPrefix="uc1" %>
<%@ Register Src="~/Reports/ContestantScores_WUC.ascx" TagName="ConstestantScoresReport" TagPrefix="uc2" %>
<%@ Register Src="~/Reports/ContestantScoresPalua_WUC.ascx" TagName="ConstestantScoresPaluaReport" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- MASTER TABULATION REPORT POPUP --%>
<%--    <div id="masterTabScoreReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="assRepLbl" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">Master Tabulation Score Report</h3>
        </div>
        <div class="modal-body">
            <uc1:MasterTabulationScore ID="MasterTabulationScore1" runat="server"></uc1:MasterTabulationScore>
        </div>
    </div>--%>

    <%-- START PAGE HEADERS --%>
    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <h1>Event Reports</h1>
            </div>
        </div>
    </div>
    <%-- END PAGE HEADER SECTION--%>


    <%-- START CONTESTANT DROPDOWN  SECTION--%>
    <div class="well well-sm" style="padding-top: 20px;">
        <div class="row form-group">
            <h5 class="col-lg-2">SELECT EVENT YEAR:</h5>
            <%--<label class="col-sm-1 control-label">Select Year:</label>--%>
            <div class="col-lg-4">
                <div class="input-group" id="entrydatepicker">
                    <asp:TextBox ID="EntryYearTb" runat="server" CssClass="form-control" OnTextChanged="EntryYearTb_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" /></span>
                </div>
                <script type="text/javascript">
                    $('#entrydatepicker').datetimepicker({
                        viewMode: 'years',
                        format: 'YYYY',
                    }).on('dp.change', function (selected) {
                        __doPostBack('<%= EntryYearTb.ClientID %>', 'EntryYearTb_TextChanged');
                    });
                </script>
            </div>
        </div>
    </div>
    <%-- END CONTESTANT DROPDOWN SECTION--%>

    <%-- START REPORT EXPORT BREADCRUMB --%>
    <ul class="breadcrumb">
        <li>
            <asp:LinkButton ID="exportMasterTab" runat="server" OnClick="exportMasterTab_Click" Text="EXPORT MASTER TABULATION REPORT" />
            <%--            <asp:LinkButton ID="exportCTab" runat="server" OnClick="exportMasterTab_Click" Text="EXPORT MASTER TABULATION REPORT" />
            <asp:LinkButton ID="exportCPaluaTab" runat="server" OnClick="exportMasterTab_Click" Text="EXPORT MASTER TABULATION REPORT" />--%>
        </li>
    </ul>
    <%-- END REPORT EXPORT BREADCRUMB --%>

    <!-- Nav tabs -->
    <ul class="nav nav-pills" role="tablist">
        <li role="presentation" class="active"><a href="#master" aria-controls="home" role="tab" data-toggle="tab">MASTER TABULATION REPORT</a></li>
        <li role="presentation"><a href="#nonpalua" aria-controls="profile" role="tab" data-toggle="tab">CONTESTANT SCORE REPORTS (PĀKANI)</a></li>
        <li role="presentation"><a href="#palua" aria-controls="messages" role="tab" data-toggle="tab">CONTESTANT SCORE REPORTS (PĀLUA)</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="master">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:UpdatePanel runat="server" ID="MasterGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <uc1:MasterTabulationScore ID="MasterTabulationScore" runat="server"></uc1:MasterTabulationScore>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%-- START NON-PALUA REPORTS --%>
        <div role="tabpanel" class="tab-pane" id="nonpalua">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:UpdatePanel runat="server" ID="NonPaluaReptUP" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <uc2:ConstestantScoresReport ID="ConstestantScoresReport" runat="server"></uc2:ConstestantScoresReport>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%-- END NON-PALUA REPORTS --%>
        <%-- START PALUA REPORTS --%>
        <div role="tabpanel" class="tab-pane" id="palua">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <asp:UpdatePanel runat="server" ID="PaluaReptUP" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <uc3:ConstestantScoresPaluaReport ID="ConstestantScoresPaluaReport" runat="server"></uc3:ConstestantScoresPaluaReport>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%-- END PALUA REPORTS --%>
    </div>
    <%--    <asp:UpdatePanel ID="cReportsUP" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="panel panel-primary">
                <div class="panel-heading" role="tab" id="headingJudge">
                    <h3 class="panel-title"><a data-toggle="collapse" href="#judgeCollapse" aria-expanded="true" aria-controls="judgeCollapse">Contestant Score Reports (Non-Pālua Division)
                    </a></h3>
                </div>
                <div class="panel-body">
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading" role="tab">
                    <h3 class="panel-title"><a data-toggle="collapse" href="#judgeCollapse" aria-expanded="true" aria-controls="judgeCollapse">Contestant Score Reports (Pālua Division)
                    </a></h3>
                </div>
                <div class="panel-body">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
    </span>
</asp:Content>
