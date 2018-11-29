<%@ Page Title="Account Manage Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Librarian_manage.aspx.cs" Inherits="WebApplicationDim.Librarian.Librarian_manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Update info of your account here</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label Text="User Name" AssociatedControlID="UserName" CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-10">
                <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Firstname" CssClass="col-md-2 control-label">First name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Firstname" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Firstname"
                    CssClass="text-danger" ErrorMessage="The Firstname field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Lastname" CssClass="col-md-2 control-label">Last name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Lastname" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Lastname"
                    CssClass="text-danger" ErrorMessage="The Lastname field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FatherName" CssClass="col-md-2 control-label">Father's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FatherName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FatherName"
                    CssClass="text-danger" ErrorMessage="The Father's Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MotherName" CssClass="col-md-2 control-label">Mother's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="MotherName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MotherName"
                    CssClass="text-danger" ErrorMessage="The Mother's Name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber"
                    CssClass="text-danger" ErrorMessage="The PhoneNumber field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Sex" CssClass="col-md-2 control-label pad">Gender</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="Sex" CssClass="form-control" Style="max-width: 280px">
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CurrentAddress" CssClass="col-md-2 control-label">Current Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="CurrentAddress" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentAddress"
                    CssClass="text-danger" ErrorMessage="The Current Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ParmanetAddress" CssClass="col-md-2 control-label">Parmanet Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="ParmanetAddress" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ParmanetAddress"
                    CssClass="text-danger" ErrorMessage="The Parmanet Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BirthDay" CssClass="col-md-2 control-label">Date of birth</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="BirthDay" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="BirthDay"
                    CssClass="text-danger" ErrorMessage="The Date of birth field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Education" CssClass="col-md-2 control-label">Education</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Education" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Education"
                    CssClass="text-danger" ErrorMessage="The Education field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BloodGroup" CssClass="col-md-2 control-label">Blood Group</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="BloodGroup" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="BloodGroup"
                    CssClass="text-danger" ErrorMessage="The Blood Group field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Update" CssClass="btn btn-success" ID="btnUpdate" OnClick="btnUpdate_Click" />
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
