<%@ Page Title="Contestant Scores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContestantScores.aspx.cs" Inherits="HONK.ContestantScores" %>

<%@ Register Src="~/Reports/MasterTabulationScore.ascx" TagName="MasterTabulationScore" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- MASTER TABULATION REPORT POPUP --%>
    <div id="masterTabScoreReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="assRepLbl" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">Master Tabulation Score Report</h3>
        </div>
        <div class="modal-body">
            <uc1:MasterTabulationScore ID="MasterTabulationScore" runat="server"></uc1:MasterTabulationScore>
        </div>
    </div>

    <%-- START PAGE HEADER SECTION--%>
    <div class="jumbotron">
        <h1 style="text-align: center"><strong>CONTESTANT SCORES</strong></h1>
    </div>
    <%-- END PAGE HEADER SECTION--%>

    <%-- START CONTESTANT DROPDOWN  SECTION--%>
    <div class="col-lg-8 col-lg-offset-2">
        <div class="well well-sm" style="padding-top: 20px;">
            <div class="row form-group">
                <label class="col-sm-2 control-label">Select Contestant: </label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="ContestantDDL" runat="server" DataSourceID="ContestantLDS" DataTextField="full_name" DataValueField="id" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control Col-sm-3" OnSelectedIndexChanged="ContestantDDL_SelectedIndexChanged">
                        <asp:ListItem Text="Select Contestant" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label class="col-sm-2 control-label">Entry Year:</label>
                <div class="col-sm-3">
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
    </div>
    <%-- END CONTESTANT DROPDOWN SECTION--%>

    <%-- START REPORT EXPORT BREADCRUMB --%>
    <div class="col-lg-10 col-lg-offset-1" style="padding-bottom:20px;">
        <ul class="breadcrumb">
            <li>
                <asp:LinkButton ID="exportMasterTab" runat="server" OnClick="exportMasterTab_Click" Text="EXPORT MASTER TABULATION REPORT" />
            </li>
        </ul>
    </div>

    <%-- END REPORT EXPORT BREADCRUMB --%>

    <%-- JUDGES SCORES SECTION --%>
    <div class="col-lg-10 col-lg-offset-1">
        <div runat="server" id="divJudgeScores" class="panel panel-primary" visible="false">
            <div class="panel-heading" role="tab" id="headingJudge">
                <h3 class="panel-title"><a data-toggle="collapse" href="#judgeCollapse" aria-expanded="true" aria-controls="judgeCollapse">Judges Scores
                </a></h3>
            </div>
            <div id="judgeCollapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingJudge">
                <div class="panel-body">
                    <asp:UpdatePanel ID="ContestantScoresFVUP" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:FormView ID="ContestantScoresFV" runat="server" DataSourceID="ContestantScoreDetailsLDS" CssClass="col-lg-12" DataKeyNames="id">
                                <EditItemTemplate>
                                    <div class="container" id="isPalua" runat="server" visible="false">
                                        <div class="row form-group">
                                            <label class="col-sm-1 col-sm-offset-2">Score 1</label>
                                            <label class="col-sm-1">Score 2</label>
                                            <label class="col-sm-1">Score 3</label>
                                            <label class="col-sm-1">Score 4</label>
                                            <label class="col-sm-1">Score 5</label>
                                            <label class="col-sm-1">Score 6</label>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Hula Palua: </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaP6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Costume (Palua): </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeP6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" runat="server" id="isNotPalua">
                                        <div class="row form-group">
                                            <label class="col-sm-1 col-sm-offset-2">Score 1</label>
                                            <label class="col-sm-1">Score 2</label>
                                            <label class="col-sm-1">Score 3</label>
                                            <label class="col-sm-1">Score 4</label>
                                            <label class="col-sm-1">Score 5</label>
                                            <label class="col-sm-1">Score 6</label>
                                            <label class="col-sm-1">Score 7</label>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Interview: </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeInterview7" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Costume (Auana): </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeA6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Costume (Kahiko): </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeCostumeK6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Hula (Auana): </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaA6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Hula (Kahiko): </label>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK1" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK2" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK3" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK4" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK5" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:TextBox ID="judgeHulaK6" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <%-- END JUDGES SCORES SECTION --%>
    <div class="col-lg-10 col-lg-offset-1">
        <%-- MASTER SCORES SECTION --%>
        <div runat="server" id="divMasterScores" class="panel panel-primary" visible="false">
            <div class="panel-heading" role="tab" id="headingMaster">
                <h3 class="panel-title"><a data-toggle="collapse" href="#masterCollapse" aria-expanded="true" aria-controls="masterCollapse">Master Scores
                </a></h3>
            </div>
            <div id="masterCollapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingMaster">
                <div class="panel-body">
                    <asp:UpdatePanel ID="ContesantMasterScoreFVUP" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:FormView ID="ContestantMasterScoreFV" runat="server" DataSourceID="MasterScoresLDS" DefaultMode="ReadOnly" DataKeyNames="id" CssClass="col-lg-12"
                                OnItemInserting="ContestantMasterScoreFV_ItemInserting">
                                <InsertItemTemplate>
                                    <div class="container" id="isPaluaMS" runat="server" visible="false">
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula Palua: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaP" runat="server" class="form-control" Text='<%# Bind("hula_palua") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaPTie" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Palua Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaPDed" runat="server" class="form-control" Text='<%# Bind("hula_palua_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="Label2" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Palua Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Costume: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeP" runat="server" class="form-control" Text='<%# Bind("costume_palua") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumePTie" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Costume Palua Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" id="isNotPaluaMS" runat="server">
                                        <div class="row form-group" runat="server">
                                            <label class="col-sm-2 control-label">Total Interview: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterInterviewTie" CssClass="control-label" Text='<%# InterviewTie %>' ToolTip="Interview Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Oli: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Costume (Auana): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumeATie" CssClass="control-label" Text='<%# CostmeAuanaTie %>' ToolTip="Costume (Auana) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Total Costume (Kahiko): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumeKTie" CssClass="control-label" Text='<%# CostmeKahikoTie %>' ToolTip="Costume (Kahiko) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula (Auana): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaATie" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula (Auana) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaANet" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Auana Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula (Kahiko): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaKTie" CssClass="control-label" Text='<%# HulaKahikoTie %>' ToolTip="Hula (Kahiko) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaKNet" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Kahiko Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Palapala: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2 control-label">Music: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Out of Order Deduction: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%# Bind("out_of_order_deduction") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-sm-3 col-sm-offset-2" title="Please ensure that Judges Scores are filled out completely to reflect correct scores.">
                                                <asp:Button ID="CalcMasterScores" runat="server" OnClick="CalculateHiLow_MasterScores" CssClass="form-control btn btn-sm btn-primary" Text="Calculate Master Scores" />
                                                <div class="checkbox">
                                                    <label class="">
                                                        <asp:CheckBox ID="HiLow" runat="server" Checked="true" />
                                                        Drop High & Low Scores?
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <div class="container" id="isPaluaMS" runat="server" visible="false">
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula Palua: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaP" runat="server" class="form-control" Text='<%# Bind("hula_palua") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaPTie" CssClass="control-label" Text='<%# HulaPaluaTie %>' ToolTip="Hula Palua Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaPDed" runat="server" class="form-control" Text='<%# Bind("hula_palua_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="Label2" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Palua Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Costume: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeP" runat="server" class="form-control" Text='<%# Bind("costume_palua") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumePTie" CssClass="control-label" Text='<%# CostumePaluaTie %>' ToolTip="Costume Palua Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" id="isNotPaluaMS" runat="server">
                                        <div class="row form-group" runat="server">
                                            <label class="col-sm-2 control-label">Total Interview: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterInterviewTie" CssClass="control-label" Text='<%# InterviewTie %>' ToolTip="Interview Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Oli: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Costume (Auana): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumeATie" CssClass="control-label" Text='<%# CostmeAuanaTie %>' ToolTip="Costume (Auana) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Total Costume (Kahiko): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterCostumeKTie" CssClass="control-label" Text='<%# CostmeKahikoTie %>' ToolTip="Costume (Kahiko) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula (Auana): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaATie" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula (Auana) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaANet" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Auana Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Total Hula (Kahiko): </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaKTie" CssClass="control-label" Text='<%# HulaKahikoTie %>' ToolTip="Hula (Kahiko) Breaking Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                            <label class="col-sm-2 control-label">Deduction for Overtime: </label>
                                            <div class="col-sm-3">
                                                <div class="input-group">
                                                    <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                                                    <span class="input-group-addon"><span class="badge" />
                                                        <asp:Label runat="server" ID="masterHulaKNet" CssClass="control-label" Text='<%# HulaAuanaTie %>' ToolTip="Hula Kahiko Net Score" data-toggle="tooltip"></asp:Label></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Palapala: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2 control-label">Music: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-sm-2 control-label">Out of Order Deduction: </label>
                                            <div class="col-sm-3">
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%# Bind("out_of_order_deduction") %>'></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-sm-3 col-sm-offset-2" title="Please ensure that Judges Scores are filled out completely to reflect correct scores.">
                                                <asp:Button ID="CalcMasterScores" runat="server" OnClick="CalculateHiLow_MasterScores" CssClass="form-control btn btn-sm btn-primary" Text="Calculate Master Scores" />
                                                <div class="checkbox">
                                                    <label class="">
                                                        <asp:CheckBox ID="HiLow" runat="server" Checked="true" />
                                                        Drop High & Low Scores?
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="SubmitBtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <%-- END MASTER SCORES SECTION --%>

        <%-- UPDATE SCORES SECTION --%>

        <div id="submitAlert" class="alert alert-dismissible alert-success" style="display: none;">
            <button type="button" class="close" onclick='$(".alert").hide();'>×</button>
            <strong>Well done!</strong> Scores has been updated <a href="#" class="alert-link">this important alert message</a>.
        </div>
        <a id="SubmitBtn" runat="server" href="#" class="btn btn-lg btn-primary btn-block btn-outline" onserverclick="SubmitBtn_ServerClick" visible="false" onclick='$(".alert").show();'><i class="fa fa-check"></i>&nbsp;Submit Contestant Scores</a>
        <br />
        <%-- END UPDATE SCORES SECTION --%>
    </div>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <%-- START OF LINQ DECLARATIONS --%>
    <asp:LinqDataSource ID="ContestantScoreDetailsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_ContestantDetailsAllScores" EnableInsert="True" EnableUpdate="True" Where="id == @id">
        <WhereParameters>
            <asp:ControlParameter ControlID="ContestantDDL" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="MasterScoresLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="MasterScores" Where="contestant_id == @contestant_id" OnSelected="MasterScoresLDS_Selected">
        <WhereParameters>
            <asp:ControlParameter ControlID="ContestantDDL" DefaultValue="0" Name="contestant_id" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
        <InsertParameters>
            <asp:Parameter Name="interview" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="oli" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="out_of_order_deduction" ConvertEmptyStringToNull="true" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="interview" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="oli" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="out_of_order_deduction" ConvertEmptyStringToNull="true" />
        </UpdateParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ContestantLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="ContestantLDS_Selecting">
    </asp:LinqDataSource>
    <%-- END OF LINQ DECLARATIONS --%>
    <span></span>
</asp:Content>
