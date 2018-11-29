<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member_Manage.aspx.cs" Inherits="WebApplicationDim.Member.Member_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>View info of your account here</h4>
        <hr />
        <div class="form-group">
            <asp:Label Text="User Name" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-10">
                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-2 control-label">Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFatherName" CssClass="col-md-2 control-label">Father's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFatherName" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMotherName" CssClass="col-md-2 control-label">Mother's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMotherName" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtPhoneNumber" CssClass="form-control" TextMode="Number" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtGender" CssClass="col-md-2 control-label pad">Gender</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtGender" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCurrentAddress" CssClass="col-md-2 control-label">Current Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtCurrentAddress" CssClass="form-control" TextMode="MultiLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtParmanetAddress" CssClass="col-md-2 control-label">Parmanet Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtParmanetAddress" CssClass="form-control" TextMode="MultiLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBirthDay" CssClass="col-md-2 control-label">Date of birth</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtBirthDay" CssClass="form-control" TextMode="Date" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEducation" CssClass="col-md-2 control-label">Education</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEducation" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBloodGroup" CssClass="col-md-2 control-label">Blood Group</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBloodGroup" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtOccupation" CssClass="col-md-2 control-label">Occupation</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtOccupation" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMemberId" CssClass="col-md-2 control-label">Member ID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMemberId" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtDateRegistered" CssClass="col-md-2 control-label">Date Of Registration</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtDateRegistered" CssClass="form-control" TextMode="Date" ReadOnly="true" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMembertype" CssClass="col-md-2 control-label">Member Type</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtMembertype" CssClass="form-control" TextMode="SingleLine" ReadOnly="true" />

            </div>
        </div>
        <div class="form-horizontal">
            <h4>Change your password</h4>
            <hr />
            <dl class="dl-horizontal">
                <dt>Password</dt>
                <dd>
                    <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="true" ID="ChangePassword" runat="server" />
                </dd>
            </dl>
        </div>
    </div>
</asp:Content>
