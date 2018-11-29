<%@ Page Title="Member Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotApproveMemberDetail.aspx.cs" Inherits="WebApplicationDim.Librarian.NotApproveMemberDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Account Details</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label Text="User Name" AssociatedControlID="txtUserName" CssClass="col-md-2 control-label" runat="server" />
            <div class="col-md-10">
                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFirstname" CssClass="col-md-2 control-label">First name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFirstname" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtLastname" CssClass="col-md-2 control-label">Last name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtLastname" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtFatherName" CssClass="col-md-2 control-label">Father's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtFatherName" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMotherName" CssClass="col-md-2 control-label">Mother's Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMotherName" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPhoneNumber" CssClass="col-md-2 control-label">Phone Number</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtPhoneNumber" CssClass="form-control" TextMode="Number" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlGender" CssClass="col-md-2 control-label pad">Gender</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="ddlGender" CssClass="form-control" Style="max-width: 280px">
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtCurrentAddress" CssClass="col-md-2 control-label">Current Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtCurrentAddress" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtParmanetAddress" CssClass="col-md-2 control-label">Parmanet Address</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtParmanetAddress" CssClass="form-control" TextMode="MultiLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBirthDay" CssClass="col-md-2 control-label">Date of birth</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtBirthDay" CssClass="form-control" TextMode="Date" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEducation" CssClass="col-md-2 control-label">Education</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtEducation" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtBloodGroup" CssClass="col-md-2 control-label">Blood Group</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtBloodGroup" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtOccupation" CssClass="col-md-2 control-label">Occupation</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtOccupation" CssClass="form-control" TextMode="SingleLine" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMemberId" CssClass="col-md-2 control-label">Member ID</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtMemberId" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator ErrorMessage="Member ID is reQuired" CssClass="text-danger" ControlToValidate="txtMemberId" runat="server" />
            </div>
            <asp:Label runat="server" id="txtWarrningMemberId" CssClass=" col-md-offset-2 col-md-2 control-label text-danger">Member ID already Exists</asp:Label>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtDateRegistered" CssClass="col-md-2 control-label">Date Of Registration</asp:Label>
            <div class="col-md-10" style="max-width: 310px">
                <asp:TextBox runat="server" ID="txtDateRegistered" CssClass="form-control" TextMode="Date" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlMembertype" CssClass="col-md-2 control-label">Member Type</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList runat="server" ID="ddlMembertype" CssClass="form-control" Style="max-width: 280px">
                    <asp:ListItem Text="General" Value="1" />
                    <asp:ListItem Text="Special" Value="2" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1 col-md-offset-2 ">
                <asp:Button runat="server" Text="Update" CssClass="btn btn-success" ID="btnUpdate" OnClick="btnUpdate_Click"/>
            </div>
            <div class="col-md-1">
                <asp:Button runat="server" Text="Approve" CssClass="btn btn-success" ID="btnApprove" onclick="btnApprove_Click"/>
            </div>
        </div>
        <br />
    </div>
</asp:Content>
