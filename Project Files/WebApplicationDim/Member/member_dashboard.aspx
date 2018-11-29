<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member_dashboard.aspx.cs" Inherits="WebApplicationDim.Member.Member_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Your Account" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnMemAcc" OnClick="btnMemAcc_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Reading History" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnReadingHistory" OnClick="btnReadingHistory_Click" />
            </div>
        </div>

        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Payment/Due" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnFees" OnClick="btnFees_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="text" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" />
            </div>
        </div>
    </div>
</asp:Content>
