<%@ Page Title="Register" Language="C#" MasterPageFile="~/SiteSimple.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HONK_v2.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="Content/plugins/iCheck/custom.css" rel="stylesheet">
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <img src="../img/kbh_logo.png" class="img-container" />
                <%--<h3 class="logo-name"></h3>--%>
            </div>
            <h3>HULA O NĀ KEIKI</h3>
            <p>Create account to submit an application.</p>
            <div class="form-group">
                <asp:TextBox runat="server" ID="Name" CssClass="form-control" placeholder="Name" required="" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                    CssClass="text-danger" ErrorMessage="The name field is required." />
                <%--<input type="text" class="form-control" placeholder="Name" required="">--%>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                <%--<input type="email" class="form-control" placeholder="Email" required="">--%>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" required="" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <%--<input type="password" class="form-control" placeholder="Password" required="">--%>
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password" required="" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
            <%-- <div class="form-group">
                <div class="checkbox i-checks">
                    <label>
                        <input type="checkbox"><i></i> Agree the terms and policy
                    </label>
                </div>
            </div>--%>
            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary block full-width m-b" />
            <%--<button type="submit" class="btn btn-primary block full-width m-b">Register</button>--%>

            <p class="text-muted text-center"><small>Already have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="Login.aspx">Login</a>
            <p class="m-t"><small>KĀ‘ANAPALI BEACH HOTEL &copy; 2017. All RIGHTS RESERVED.</small> </p>
        </div>
    </div>

    <!-- iCheck -->
    <script src="Scripts/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

    <%--    <h2><%: Title %>.</h2>


    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
            </div>
        </div>
    </div>--%>
</asp:Content>
