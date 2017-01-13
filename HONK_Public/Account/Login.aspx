<%@ Page Title="Log in" Language="C#" MasterPageFile="~/SiteSimple.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HONK_v2.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <img src="../img/kbh_logo.png" class="img-container" />
            </div>
            <h3>HULA O NĀ KEIKI</h3>
            <p>
                Applicants, please login to continue.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <%--<p>Login in. To see it in action.</p>--%>
            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                <p class="text-danger">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
            </asp:PlaceHolder>
            <div class="form-group">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
            <div class="form-group">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
            <div class="form-group">
                <asp:CheckBox runat="server" ID="RememberMe" CssClass="y" />
                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
            </div>
            <asp:Button runat="server" OnClick="LogIn" Text="Login" CssClass="btn btn-primary block full-width m-b" />
            <%--<button type="submit" class="btn btn-primary block full-width m-b">Login</button>--%>

            <a href="#"><small>Forgot password?</small></a>
            <p class="text-muted text-center"><small>Do not have an account?</small></p>
            <a class="btn btn-sm btn-white btn-block" href="Register">Create an account</a>
            <p class="m-t"><small>KĀ‘ANAPALI BEACH HOTEL &copy; 2017. All RIGHTS RESERVED.</small> </p>
        </div>
    </div>

    <%--<asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>--%>

    <%--<div class="col-md-4">
        <section id="socialLoginForm">
            <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
        </section>
    </div>--%>
</asp:Content>
