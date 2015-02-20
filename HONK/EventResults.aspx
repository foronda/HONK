<%@ Page Title="Event Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventResults.aspx.cs" Inherits="HONK.EventResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- START PAGE HEADER SECTION--%>
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
                        Panel content
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="keikikane">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        Panel content
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="keikiwahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        Panel content
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="opiokane">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        Panel content
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="opiowahine">
                <div class="panel panel-primary">
                    <div class="panel-body">
                        Panel content
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
                        Panel content
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
