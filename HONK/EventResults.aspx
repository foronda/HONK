<%@ Page Title="Event Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventResults.aspx.cs" Inherits="HONK.EventResults" %>

<%@ Register Src="~/Reports/ContestantSCores_WUC.ascx" TagName="ConstestantTabulationScore" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <%-- CONTESTANT TABULATION REPORT POPUP --%>
    <div id="masterTabScoreReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="assRepLbl" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">Master Tabulation Score Report</h3>
        </div>
        <div class="modal-body">
            <uc1:ConstestantTabulationScore ID="ConstestantTabulationScore" runat="server"></uc1:ConstestantTabulationScore>
        </div>
    </div>

    <%-- START PAGE HEADERS --%>
    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <h1>Event Results</h1>
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
    <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#master" aria-controls="home" role="tab" data-toggle="tab">MASTER</a></li>
            <li role="presentation"><a href="#keikikane" aria-controls="profile" role="tab" data-toggle="tab">KEIKI KANE</a></li>
            <li role="presentation"><a href="#keikiwahine" aria-controls="messages" role="tab" data-toggle="tab">KEIKI WAHINE</a></li>
            <li role="presentation"><a href="#opiokane" aria-controls="settings" role="tab" data-toggle="tab">'OPIO KANE</a></li>
            <li role="presentation"><a href="#opiowahine" aria-controls="messages" role="tab" data-toggle="tab">'OPIO WAHINE</a></li>
            <li role="presentation"><a href="#costume" aria-controls="settings" role="tab" data-toggle="tab">COSTUME</a></li>
            <li role="presentation"><a href="#palua" aria-controls="settings" role="tab" data-toggle="tab">PALUA</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="master">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="MasterGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="MasterGV" runat="server" AllowPaging="True" DataSourceID="MasterDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True"
                                    DataKeyNames="id" EmptyDateText="" OnRowCommand="MasterGV_RowCommand" OnRowDataBound="MasterGV_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:UpdatePanel ID="DownloadReportUP" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ID="DownloadLB" runat="server" CausesValidation="False" CommandName="PDF" Text="PDF" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="DownloadLB" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="interview" HeaderText="Interview Score" SortExpression="interview" />
                                        <asp:BoundField DataField="interview_tie" HeaderText="Interview Tie" SortExpression="interview_tie" />
                                        <asp:BoundField DataField="overall_score" HeaderText="Overall Score" SortExpression="overall_score" />
                                        <asp:BoundField DataField="overall_break_score" HeaderText="Overall Score Tie" SortExpression="overall_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                        <asp:BoundField DataField="music" HeaderText="Music" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <%-- START KEIKI KANE --%>
            <div role="tabpanel" class="tab-pane" id="keikikane">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="KeikiKaneGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="KeikiKaneGV" runat="server" AllowPaging="True" DataSourceID="KeikiKaneDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="oli" HeaderText="Oli Score" SortExpression="oli" />
                                        <asp:BoundField DataField="combined_hula_score" HeaderText="Combined Hula Score" SortExpression="combined_hula_score" />
                                        <asp:BoundField DataField="combined_hula_break_score" HeaderText="Combined Hula Tie" SortExpression="combined_hula_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <%-- END KEIKI KANE --%>
            <%-- START KEIKI WAHINE --%>
            <div role="tabpanel" class="tab-pane" id="keikiwahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="KeikiWahineGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="KeikiWahineGV" runat="server" AllowPaging="True" DataSourceID="KeikiWahineDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="oli" HeaderText="Oli Score" SortExpression="oli" />
                                        <asp:BoundField DataField="combined_hula_score" HeaderText="Combined Hula Score" SortExpression="combined_hula_score" />
                                        <asp:BoundField DataField="combined_hula_break_score" HeaderText="Combined Hula Tie" SortExpression="combined_hula_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <%-- END KEIKI WAHINE --%>
            <%-- START OPIO KANE --%>
            <div role="tabpanel" class="tab-pane" id="opiokane">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="OpioKaneGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="OpioKaneGV" runat="server" AllowPaging="True" DataSourceID="OpioKaneDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="oli" HeaderText="Oli Score" SortExpression="oli" />
                                        <asp:BoundField DataField="combined_hula_score" HeaderText="Combined Hula Score" SortExpression="combined_hula_score" />
                                        <asp:BoundField DataField="combined_hula_break_score" HeaderText="Combined Hula Tie" SortExpression="combined_hula_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <%-- END OPIO KANE --%>
            <%-- START OPIO WAHINE --%>
            <div role="tabpanel" class="tab-pane" id="opiowahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="OpioWahineGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="OpioWahineGV" runat="server" AllowPaging="True" DataSourceID="OpioWahineDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="oli" HeaderText="Oli Score" SortExpression="oli" />
                                        <asp:BoundField DataField="combined_hula_score" HeaderText="Combined Hula Score" SortExpression="combined_hula_score" />
                                        <asp:BoundField DataField="combined_hula_break_score" HeaderText="Combined Hula Tie" SortExpression="combined_hula_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <%-- END OPIO WAHINE --%>
            <%-- START COSTUME --%>
            <div role="tabpanel" class="tab-pane" id="costume">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-primary">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Costume ('Opio)
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <asp:UpdatePanel runat="server" ID="CostumeOpioGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:GridView ID="CostumeOpioGV" runat="server" AllowPaging="True" DataSourceID="CostumeOpioDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                                    <Columns>
                                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                                        <asp:BoundField DataField="costume_auana" HeaderText="Auana Total" SortExpression="costume_auana" />
                                                        <asp:BoundField DataField="costume_auana_tie" HeaderText="Auana Total Tie" SortExpression="costume_auana_tie" />
                                                        <asp:BoundField DataField="costume_kahiko" HeaderText="Kahiko Total" SortExpression="costume_kahiko" />
                                                        <asp:BoundField DataField="costume_kahiko_tie" HeaderText="Kahiko Total Tie" SortExpression="costume_kahiko_tie" />
                                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <div class="alert alert-dismissible alert-danger">
                                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Costume (Keiki)
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <asp:UpdatePanel runat="server" ID="CostumeKeikiGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:GridView ID="CostumeKeikiGV" runat="server" AllowPaging="True" DataSourceID="CostumeKeikiDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                                    <Columns>
                                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                                        <asp:BoundField DataField="costume_auana" HeaderText="Auana Total" SortExpression="costume_auana" />
                                                        <asp:BoundField DataField="costume_auana_tie" HeaderText="Auana Total Tie" SortExpression="costume_auana_tie" />
                                                        <asp:BoundField DataField="costume_kahiko" HeaderText="Kahiko Total" SortExpression="costume_kahiko" />
                                                        <asp:BoundField DataField="costume_kahiko_tie" HeaderText="Kahiko Total Tie" SortExpression="costume_kahiko_tie" />
                                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <div class="alert alert-dismissible alert-danger">
                                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Costume (Palua)
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        <asp:UpdatePanel runat="server" ID="CostumePaluaGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                                            <ContentTemplate>
                                                <asp:GridView ID="CostumePaluaGV" runat="server" AllowPaging="True" DataSourceID="CostumePaluaDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                                    <Columns>
                                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                                        <asp:BoundField DataField="costume_palua" HeaderText="Auana Total" SortExpression="costume_palua" />
                                                        <asp:BoundField DataField="costume_palua_tie" HeaderText="Auana Total Tie" SortExpression="costume_palua_tie" />
                                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <div class="alert alert-dismissible alert-danger">
                                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- END COSTUME --%>
            <div role="tabpanel" class="tab-pane" id="palua">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="PaluaGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="PaluaGV" runat="server" AllowPaging="True" DataSourceID="PaluaDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="age_name" HeaderText="Age" SortExpression="age_name" />
                                        <asp:BoundField DataField="gender_name" HeaderText="Gender" SortExpression="gender_name" />
                                        <asp:BoundField DataField="overall_score" HeaderText="Overall Score" SortExpression="overall_score" />
                                        <asp:BoundField DataField="overall_break_score" HeaderText="Overall Score Tie" SortExpression="overall_break_score" />
                                        <asp:BoundField DataField="halau_name" HeaderText="Halau" SortExpression="halau_name" />
                                        <asp:BoundField DataField="kumu_name" HeaderText="Kumu" SortExpression="kumu_name" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="alert alert-dismissible alert-danger">
                                            <button type="button" class="close" data-dismiss="alert">×</button>
                                            <strong>Oh snap!</strong> Query yielded no results. Please check entered year and try submitting again.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- LINQ DATA SOURCES --%>
    <asp:LinqDataSource ID="MasterDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="MasterDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="KeikiKaneDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="KeikiKaneDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="KeikiWahineDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="KeikiWahineDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="OpioKaneDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="OpioKaneDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="OpioWahineDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="OpioWahineDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="CostumeOpioDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="CostumeOpioDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="CostumeKeikiDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="CostumeKeikiDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="CostumePaluaDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="CostumePaluaDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="PaluaDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="PaluaDS_Selecting"></asp:LinqDataSource>
    <%-- END OF LINQ DATASOURCES --%>
    </span>
</asp:Content>
