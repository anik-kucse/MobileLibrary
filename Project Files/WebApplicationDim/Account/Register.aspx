<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WebApplicationDim.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="username" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="username" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="username"
                    CssClass="text-danger" ErrorMessage="The Username field is required." />
            </div>
        </div>
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
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="PhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10" style="max-width:310px">
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
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CurrentAddress" CssClass="col-md-2 control-label">Current Address</asp:Label>
            <div class="col-md-10" style="max-width:310px">
                <asp:TextBox runat="server" ID="CurrentAddress" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentAddress"
                    CssClass="text-danger" ErrorMessage="The Current Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ParmanetAddress" CssClass="col-md-2 control-label">Parmanet Address</asp:Label>
            <div class="col-md-10" style="max-width:310px">
                <asp:TextBox runat="server" ID="ParmanetAddress" CssClass="form-control" TextMode="MultiLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ParmanetAddress"
                    CssClass="text-danger" ErrorMessage="The Parmanet Address field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="BirthDay" CssClass="col-md-2 control-label">Date of birth</asp:Label>
            <div class="col-md-10" style="max-width:310px">
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
            <asp:Label runat="server" AssociatedControlID="Occupation" CssClass="col-md-2 control-label">Occupation</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Occupation" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Occupation"
                    CssClass="text-danger" ErrorMessage="The Occupation field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="MemberType" CssClass="col-md-2 control-label pad">Member Type</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="MemberType" CssClass="form-control" Style="max-width: 280px">
                    <asp:ListItem Text="General (Fee 100 TK)" Value="1" />
                    <asp:ListItem Text="Special (Fee 200 TK)" Value="2" />
                </asp:DropDownList>
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
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
