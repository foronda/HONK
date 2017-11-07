<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kumu.aspx.cs" Inherits="HONK.Kumu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 style="text-align: center"><strong>KUMU'S</strong></h1>
    </div>

    <div class="col-lg-10 col-lg-offset-1">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-primary">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Add/Edit Kumu's
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <asp:UpdatePanel ID="KumuFVUP" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:FormView ID="KumuFV" runat="server" DataSourceID="AEKumuDS" DefaultMode="Insert" CssClass="col-lg-12" DataKeyNames="id" OnItemUpdated="KumuFV_ItemUpdated" OnItemInserted="KumuFV_ItemInserted">
                                    <InsertItemTemplate>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Name</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("full_name") %>' placeholder="Kumu Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-lg-6 col-lg-offset-1">
                                                <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Kumu" CssClass="btn btn-block btn-primary" />
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-block btn-outline btn-danger" />
                                            </div>
                                        </div>
                                    </InsertItemTemplate>
                                    <EditItemTemplate>
                                        <div class="row form-group required">
                                            <label class="col-lg-2 control-label">Name</label>
                                            <div class="col-lg-4">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("full_name") %>' placeholder="Kumu Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-lg-6 col-lg-offset-1">
                                                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update Kumu" CssClass="btn btn-block btn-primary" />
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-block btn-danger btn-outline" />
                                            </div>
                                        </div>
                                        <%--  <div class="row form-group required ">
                                            <label class="col-lg-3 col-sm-offset-1 control-label">Indicates required field</label>
                                        </div>--%>
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
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Kumu Records
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <asp:UpdatePanel runat="server" ID="KumuGVUP" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="ibox-content">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="input-group">
                                                <asp:TextBox ID="searchTB" runat="server" CssClass="form-control" data-provide="typeahead" placeholder="Search kumu..." AutoPostBack="true" OnTextChanged="searchTB_TextChanged"></asp:TextBox>
                                                <span class="input-group-btn">
                                                    <asp:Button ID="clrSearchBtn" runat="server" class="btn btn-primary" Text="Clear" OnClick="clrSearchBtn_Click"></asp:Button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="ibox-content">
                                    <asp:GridView ID="KumuGV" runat="server" AllowPaging="True" DataSourceID="KumuDS" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover"
                                        AllowSorting="True" DataKeyNames="id" OnRowCommand="KumuGV_RowCommand" OnRowDataBound="KumuGV_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Actions" ShowHeader="False" HeaderStyle-Width="50px">
                                                <ItemTemplate>
                                                    <asp:UpdatePanel ID="EditHalauUP" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:LinkButton ID="EditLB" runat="server" CausesValidation="False" CommandName="AsyncEdit" CommandArgument='<%# Eval("id")%>'><i class="fa fa-pencil"></i> </asp:LinkButton>&nbsp; &nbsp;
                                                        <asp:LinkButton ID="DeleteLB" runat="server" CausesValidation="False" CommandName="CascadeDelete" Text="Delete" CommandArgument='<%# Eval("id")%>' CssClass="has-popover-warning"><i class="fa fa-trash"></i></asp:LinkButton>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="EditLB" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    <%--<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        </Columns>

                                        <PagerStyle BackColor="#f9f9f9" HorizontalAlign="Center" />
                                        <%--<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />--%>
                                        <EmptyDataTemplate>
                                            <div class="alert alert-dismissible alert-default">
                                                <button type="button" class="close" data-dismiss="alert">×</button>
                                                <strong>Oh snap!</strong> Search yielded no results. Please check entered text and try submitting again.
                                            </div>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function ShowKumu() {
            $('#collapseOne').collapse('show');
            if ($('#collapseTwo').is(":visible")) {
                $('#collapseTwo').collapse('hide');
            }
        }

        function ShowKumuGV() {
            $('#collapseTwo').collapse('show');
            if ($('#collapseOne').is(":visible")) {
                $('#collapseOne').collapse('hide');
            }
        }


        // Upon successful insert, show confirmation. Triggered from code behind.
        function KumuUpdateSuccess(kumu) {
            BootstrapDialog.show({
                type: BootstrapDialog.TYPE_SUCCESS,
                title: 'Success!',
                cssClass: 'confirm-dialog',
                message: 'Kumu <b>' + kumu + '</b> has been updated.'
            });
        };

        function KumuInsSuccess(kumu) {
            BootstrapDialog.show({
                type: BootstrapDialog.TYPE_SUCCESS,
                title: 'Success!',
                cssClass: 'confirm-dialog',
                message: 'Kumu <b>' + kumu + '</b> has been added to the database.'
            });
        };

    </script>

    <asp:LinqDataSource ID="AEKumuDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Kumus" Where="id == @id">
        <WhereParameters>
            <asp:Parameter DefaultValue="0" Name="id" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="KumuDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Kumus" OnSelecting="KumuDS_Selecting"></asp:LinqDataSource>
</asp:Content>
