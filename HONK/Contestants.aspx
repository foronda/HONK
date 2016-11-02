﻿<%@ Page Title="Contestants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contestants.aspx.cs" Inherits="HONK.Contestants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ShowContestants() {
            $('#collapseOne').collapse('show');
            if ($('#collapseTwo').is(":visible")) {
                $('#collapseTwo').collapse('hide');
            }
        }

        function ShowContestantGV() {
            $('#collapseTwo').collapse('show');
            if ($('#collapseOne').is(":visible")) {
                $('#collapseOne').collapse('hide');
            }
        }
    </script>

    <div class="container">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-8">
                    <h1>Contestants</h1>
                </div>
                <div class="col-lg-3" style="padding-top:25px;">
                <asp:UpdatePanel ID="SearchUP" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="input-group search">
                            <asp:TextBox ID="searchTB" runat="server" CssClass="form-control" Width="300px" data-provide="typeahead" placeholder="Search contestants by name or year..." AutoPostBack="true" OnTextChanged="searchTB_TextChanged"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:Button ID="clrSearchBtn" runat="server" class="btn btn-default" Text="Clear" OnClick="clrSearchBtn_Click"></asp:Button>
                            </span>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="clrSearchBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            </div>
        </div>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-primary">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Contestants Form
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <asp:UpdatePanel ID="ContestantFVUP" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:FormView ID="ContestantFV" runat="server" DataSourceID="AEContestantsLDS" DefaultMode="Insert" CssClass="col-lg-12"
                                    OnItemInserting="ContestantFV_ItemInserting" OnItemUpdating="ContestantFV_ItemUpdating" OnItemUpdated="ContestantFV_ItemUpdated">
                                    <InsertItemTemplate>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Name</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("full_name") %>' placeholder="Full Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Age</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AgeLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("age_id") %>' AppendDataBoundItems="true" CssClass="form-control" OnSelectedIndexChanged="CalculateDivision" AutoPostBack="true">
                                                    <asp:ListItem Text="Select Age" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-lg-2 control-label">Gender</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="GenderLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("gender_id") %>' AppendDataBoundItems="true" CssClass="form-control" OnSelectedIndexChanged="CalculateDivision" AutoPostBack="true">
                                                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Division</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DivisionLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("division_id") %>' AppendDataBoundItems="true" CssClass="form-control" Enabled="false">
                                                    <asp:ListItem Text="Select Division" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Halau</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="HalauLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("halau_id") %>' AppendDataBoundItems="True" CssClass="form-control">
                                                    <asp:ListItem Text="Select Halau" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#halauModal">
                                                    Add Halau
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Kumu</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="KumuLDS" DataTextField="full_name" DataValueField="id" SelectedValue='<%# Bind("kumu_id") %>' AppendDataBoundItems="True" CssClass="form-control">
                                                    <asp:ListItem Text="Select Kumu" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#kumuModal">
                                                    Add Kumu
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-lg-2 control-label">Friday Entry No.</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("entry_num_fri") %>' placeholder="Entry No. (e.g. 1)"></asp:TextBox>
                                            </div>
                                            <label class="col-lg-2 control-label">Saturday Entry No.</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("entry_num_sat") %>' placeholder="Entry No. (e.g. 1)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Entry Year</label>
                                            <div class="col-md-3">
                                                <div class="input-group" id="entrydatepicker">
                                                    <asp:TextBox ID="entryDateTb" runat="server" CssClass="form-control" Text='<%# Bind("entry_date") %>' placeholder="HONK Entry Year"></asp:TextBox>
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
                                        <div class="row form-group">
                                            <div class="col-lg-10 col-lg-offset-2">
                                                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Contestant" CssClass="btn btn-primary" />
                                                &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        <div class="row form-group required ">
                                            <label class="col-lg-3 col-sm-offset-1 control-label">Indicates required field</label>
                                        </div>
                                    </InsertItemTemplate>
                                    <EditItemTemplate>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Name</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("full_name") %>' placeholder="Full Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Age</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AgeLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("age_id") %>' AppendDataBoundItems="true" CssClass="form-control" OnSelectedIndexChanged="CalculateDivision" AutoPostBack="true">
                                                    <asp:ListItem Text="Select Age" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-lg-2 control-label">Gender</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="GenderLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("gender_id") %>' AppendDataBoundItems="true" CssClass="form-control" OnSelectedIndexChanged="CalculateDivision" AutoPostBack="true">
                                                    <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Division</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="DivisionLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("division_id") %>' AppendDataBoundItems="true" CssClass="form-control" Enabled="false">
                                                    <asp:ListItem Text="Select Division" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Halau</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="HalauLDS" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("halau_id") %>' AppendDataBoundItems="True" CssClass="form-control">
                                                    <asp:ListItem Text="Select Halau" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#halauModal">
                                                    Add Halau
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Kumu</label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="KumuLDS" DataTextField="full_name" DataValueField="id" SelectedValue='<%# Bind("kumu_id") %>' AppendDataBoundItems="True" CssClass="form-control">
                                                    <asp:ListItem Text="Select Kumu" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-3">
                                                <button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#kumuModal">
                                                    Add Kumu
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <label class="col-lg-2 control-label">Friday Entry No.</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("entry_num_fri") %>' placeholder="Entry No. (e.g. 1)"></asp:TextBox>
                                            </div>
                                            <label class="col-lg-2 control-label">Saturday Entry No.</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("entry_num_sat") %>' placeholder="Entry No. (e.g. 1)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Entry Year</label>
                                            <div class="col-md-3">
                                                <div class="input-group" id="entrydatepicker">
                                                    <asp:TextBox ID="entryDateTb" runat="server" CssClass="form-control" Text='<%# String.Format(Eval("entry_date", "{0:yyyy}")) %>' placeholder="HONK Entry Year"></asp:TextBox>
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
                                        <div class="row form-group">
                                            <div class="col-lg-10 col-lg-offset-2">
                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update Contestant" CssClass="btn btn-primary" />
                                                &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        <div class="row form-group required ">
                                            <label class="col-lg-3 col-sm-offset-1 control-label">Indicates required field</label>
                                        </div>
                                    </EditItemTemplate>
                                </asp:FormView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Contestant Records
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="ContestantGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                
                                <asp:GridView ID="ContestantGV" runat="server" AllowPaging="True" DataSourceID="ContestantsLDS" AutoGenerateColumns="False" CssClass="table table-striped table-hover table-condensed"
                                    AllowSorting="True" DataKeyNames="id" OnRowCommand="ContestantGV_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions" ShowHeader="False" HeaderStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:UpdatePanel ID="EditContestantUP" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:LinkButton ID="EditLB" runat="server" CausesValidation="False" CommandName="AsyncEdit" Text="Edit" CommandArgument='<%# Eval("id")%>'></asp:LinkButton>
                                                        <asp:LinkButton ID="DeleteLB" runat="server" CausesValidation="False" CommandName="CascadeDelete" Text="Delete" CommandArgument='<%# Eval("id")%>'></asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="EditLB" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <%--<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="Age.name" HeaderText="Age" SortExpression="Age.name" />
                                        <asp:BoundField DataField="Gender.name" HeaderText="Gender" SortExpression="Gender.name" />
                                        <asp:BoundField DataField="Division.name" HeaderText="Division" SortExpression="Division.name" />
                                        <asp:BoundField DataField="Halau.name" HeaderText="Halau" SortExpression="Halau.name" />
                                        <asp:BoundField DataField="Kumu.full_name" HeaderText="Kumu" SortExpression="Kumu.full_name" />
                                        <asp:BoundField DataField="entry_date" HeaderText="Entry Year" SortExpression="entry_date" DataFormatString="{0:yyyy}" />
                                        <asp:BoundField DataField="entry_num_fri" HeaderText="Fri Entry No." SortExpression="entry_num_fri" />
                                        <asp:BoundField DataField="entry_num_sat" HeaderText="Sat Entry No." SortExpression="entry_num_sat" />
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- MODAL FORMVIEWS -->
    <div class="modal fade" id="halauModal" tabindex="-1" role="dialog" aria-labelledby="haluaModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="haluaModalLabel">Add Halau</h4>
                </div>
                <div class="modal-body">
                    <asp:FormView ID="HalauFV" runat="server" DataSourceID="HalauLDS" DefaultMode="Insert" OnItemInserted="UpdateContestantFV">
                        <InsertItemTemplate>
                            <div class="row form-group">
                                <label class="col-lg-4 control-label">Halau</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("name") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-8 col-lg-offset-4">
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </div>
    <%-- KUMU FORMVEW MODAL POPUP --%>
    <div class="modal fade" id="kumuModal" tabindex="-1" role="dialog" aria-labelledby="kumuModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="kumuModalLabel">Add kumu</h4>
                </div>
                <div class="modal-body">
                    <asp:FormView ID="KumuFV" runat="server" DataSourceID="KumuLDS" DefaultMode="Insert" OnItemInserted="UpdateContestantFV">
                        <InsertItemTemplate>
                            <div class="row form-group">
                                <label class="col-lg-4 control-label">Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("full_name") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-lg-8 col-lg-offset-4">
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </div>
    <%-- END OF MODAL FORMVIEWS --%>

    <%-- LINQ DATA SOURCES --%>
    <asp:LinqDataSource ID="ContestantsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Contestants" EnableInsert="True" EnableUpdate="True" OnSelecting="ContestantsLDS_Selecting">
        <InsertParameters>
            <asp:Parameter Name="entry_num_fri" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="entry_num_sat" ConvertEmptyStringToNull="true" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="entry_num_fri" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="entry_num_sat" ConvertEmptyStringToNull="true" />
        </UpdateParameters>
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="AEContestantsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Contestants" EnableInsert="True" EnableUpdate="True" Where="id == @id">
        <WhereParameters>
            <asp:Parameter DefaultValue="0" Name="id" Type="Int32" />
        </WhereParameters>
        <InsertParameters>
            <asp:Parameter Name="entry_num_fri" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="entry_num_sat" ConvertEmptyStringToNull="true" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="entry_num_fri" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="entry_num_sat" ConvertEmptyStringToNull="true" />
        </UpdateParameters>
    </asp:LinqDataSource>

    <%-- LOOKUP TABLES --%>
    <asp:LinqDataSource ID="AgeLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Ages" OrderBy="name" Select="new (name, id)"></asp:LinqDataSource>
    <asp:LinqDataSource ID="GenderLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="name" Select="new (id, name)" TableName="Genders"></asp:LinqDataSource>
    <asp:LinqDataSource ID="DivisionLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="name" TableName="Divisions"></asp:LinqDataSource>
    <asp:LinqDataSource ID="HalauLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="name" TableName="Halaus" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:LinqDataSource>
    <asp:LinqDataSource ID="KumuLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="full_name" TableName="Kumus" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:LinqDataSource>
</asp:Content>
