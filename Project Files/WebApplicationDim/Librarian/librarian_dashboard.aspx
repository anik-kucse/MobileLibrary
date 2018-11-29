<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="librarian_dashboard.aspx.cs" Inherits="WebApplicationDim.Librarian.librarian_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="min-height: 750px" >
        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Your Account" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnYourAcc" OnClick="btnYourAcc_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Shedule And fees" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnSheduleFees" OnClick="btnSheduleFees_Click" />
            </div>
        </div>

        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Approve Members" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnApproveMembers" OnClick="btnApproveMembers_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Add New Books" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnAddNewBooks" OnClick="btnAddNewBooks_Click" />
            </div>
        </div>

        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Issue Books" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnIssueBooks" OnClick="btnIssueBooks_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Receive Books" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnReceive" OnClick="btnReceive_Click" />
            </div>
        </div>
    </div>

</asp:Content>
