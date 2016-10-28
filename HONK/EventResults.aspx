<%@ Page Title="Event Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventResults.aspx.cs" Inherits="HONK.EventResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- LINQ DATA SOURCES --%>
    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <h1>Event Results</h1>
            </div>
        </div>
    </div>
    <%-- END PAGE HEADER SECTION--%>

    <%-- START CONTESTANT DROPDOWN  SECTION--%>
    <div class="well well-sm">
        <div class="row form-group has-error">
            <label class="col-sm-2 control-label">Select Year:</label>
            <div class="col-sm-3">
                <div class="input-group" id="entrydatepicker">
                    <asp:TextBox ID="EntryYearTb" runat="server" CssClass="form-control" OnTextChanged="EntryYearTb_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" /></span>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $('#entrydatepicker').datetimepicker({
                            viewMode: 'years',
                            format: 'YYYY'
                        });
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
                                <asp:GridView ID="MasterGV" runat="server" AllowPaging="True" DataSourceID="MasterDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
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
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
            <div role="tabpanel" class="tab-pane" id="keikiwahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="KeikiWahineGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="KeikiWahineGV" runat="server" AllowPaging="True" DataSourceID="KeikiWahineDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
            <div role="tabpanel" class="tab-pane" id="opiokane">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="OpioKaneGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="OpioKaneGV" runat="server" AllowPaging="True" DataSourceID="OpioKaneDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
            <div role="tabpanel" class="tab-pane" id="opiowahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="OpioWahineGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="OpioWahineGV" runat="server" AllowPaging="True" DataSourceID="OpioWahineDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
            <div role="tabpanel" class="tab-pane" id="costume">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        Panel content
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="palua">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="PaluaGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:GridView ID="PaluaGV" runat="server" AllowPaging="True" DataSourceID="PaluaDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover" AllowSorting="True" DataKeyNames="id" EmptyDateText="">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Export" Text="PDF"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
    <asp:LinqDataSource ID="CostumeDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="CostumeDS_Selecting"></asp:LinqDataSource>
    <asp:LinqDataSource ID="PaluaDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OnSelecting="PaluaDS_Selecting"></asp:LinqDataSource>
    <%-- END OF LINQ DATASOURCES --%>
    </span>
</asp:Content>
