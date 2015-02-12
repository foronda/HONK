<%@ Page Title="Contestants" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contestants.aspx.cs" Inherits="HONK.Contestants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="page-header">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Contestants</h1>
                </div>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Contestants Form</h3>
            </div>
            <div class="panel-body">
                <asp:UpdatePanel ID="ContestantsFVUP" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:FormView ID="ContestantsFV" runat="server" DataSourceID="ContestantsLDS" DefaultMode="Insert" CssClass="col-lg-12">
                            <InsertItemTemplate>
                                <div class="row form-group">
                                    <label class="col-lg-2 control-label">First Name</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                    </div>
                                    <label class="col-lg-2 control-label">Last Name</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("last_name") %>'></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-lg-2 control-label">Age</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="AgeLDS" DataTextField="name" DataValueField="age_id" SelectedValue='<%# Bind("age_age_id") %>' AppendDataBoundItems="true" CssClass="form-control">
                                            <asp:ListItem Text="Select Age" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <label class="col-lg-2 control-label">Gender</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="GenderLDS" DataTextField="name" DataValueField="gender_id" SelectedValue='<%# Bind("gender_gender_id") %>' AppendDataBoundItems="true" CssClass="form-control">
                                            <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-lg-2 control-label">Halau</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="HalauLDS" DataTextField="name" DataValueField="halua_id" SelectedValue='<%# Bind("halau_halua_id") %>' AppendDataBoundItems="True" CssClass="form-control">
                                            <asp:ListItem Text="Select Halau" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-3">
                                        <button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#halauModal">
                                            Add Halau
                                        </button>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-lg-2 control-label">Kumu</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="KumuLDS" DataTextField="full_name" DataValueField="kumu_id" SelectedValue='<%# Bind("kumu_kumu_id") %>' AppendDataBoundItems="True" CssClass="form-control">
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
                                    <label class="col-lg-2 control-label">Entry Year</label>
                                    <div class="col-md-3">
                                        <div class="input-group" id="entrydatepicker">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" type="text"></asp:TextBox>
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
                                        <%--                        <script type="text/javascript">
                            $(document).ready(function () {
                                $(function () {
                                    $('#<%=ContestantsFV.FindControl("TextBox3").ClientID%>').datetimepicker();
                                });
                            });
                        </script>--%>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                                        &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                                    </div>
                                </div>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Contestant Records</h3>
            </div>
            <div class="panel-body">
                <asp:GridView ID="ContestantGV" runat="server" AllowPaging="True" DataSourceID="ContestantsLDS" AutoGenerateColumns="false" CssClass="table table-striped table-hover">
                    <Columns>
                        <asp:BoundField DataField="Age.name" HeaderText="Age" SortExpression="Age.name" />
                        <asp:BoundField DataField="Gender.name" HeaderText="Gender" SortExpression="Gender.name" />
                        <asp:BoundField DataField="Division.name" HeaderText="Division" SortExpression="Division.name" />
                        <asp:BoundField DataField="Halau.name" HeaderText="Halau" SortExpression="Halau.name" />
                        <asp:BoundField DataField="Kumu.first_name" HeaderText="Kumu" SortExpression="Kumu.first_name" />
                        <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                        <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                        <asp:BoundField DataField="entry_date" HeaderText="Entry Year" SortExpression="entry_date" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <%-- FORMVIEW POPUPS --%>
    <!-- Modal -->
    <div class="modal fade" id="halauModal" tabindex="-1" role="dialog" aria-labelledby="haluaModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="haluaModalLabel">Add Halau</h4>
                </div>
                <div class="modal-body">
                    <asp:FormView ID="HalauFV" runat="server" DataSourceID="HalauLDS" DefaultMode="Insert" OnItemInserted="UpdateContestantsFV">
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

    <div class="modal fade" id="kumuModal" tabindex="-1" role="dialog" aria-labelledby="kumuModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="kumuModalLabel">Add kumu</h4>
                </div>
                <div class="modal-body">
                    <asp:FormView ID="KumuFV" runat="server" DataSourceID="KumuDELDS" DefaultMode="Insert" OnItemInserted="UpdateContestantsFV">
                        <InsertItemTemplate>
                            <div class="row form-group">
                                <label class="col-lg-4 control-label">First Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-4 control-label">Last Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("last_name") %>'></asp:TextBox>
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

    <asp:LinqDataSource ID="ContestantsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Contestants"></asp:LinqDataSource>
    <asp:LinqDataSource ID="KumuDELDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableInsert="True" EntityTypeName="" OrderBy="first_name" TableName="Kumus"></asp:LinqDataSource>
    <%-- LOOKUP TABLES --%>

    <asp:LinqDataSource ID="AgeLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="Ages" OrderBy="name" Select="new (name, age_id)"></asp:LinqDataSource>
    <asp:LinqDataSource ID="GenderLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="name" Select="new (gender_id, name)" TableName="Genders"></asp:LinqDataSource>
    <asp:LinqDataSource ID="HalauLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="name" TableName="Halaus" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:LinqDataSource>
    <asp:LinqDataSource ID="KumuLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="first_name" TableName="Kumus" Select='new (kumu_id, String.Concat(first_name + " " + last_name) as full_name)' EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:LinqDataSource>
</asp:Content>
