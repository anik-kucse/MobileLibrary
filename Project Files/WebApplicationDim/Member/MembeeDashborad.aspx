<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MembeeDashborad.aspx.cs" Inherits="WebApplicationDim.Member.MembeeDashborad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="min-height: 750px">
        <div class="panel col-md-5" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Your Account" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnYourAcc" OnClick="btnYourAcc_Click" />
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2" style="background-color: #8DC63F">
            <div class="form-horizontal panel-body">
                <asp:Button CssClass="btn btn-default" Text="Book History" runat="server" Width="100%" Height="100" BackColor="#8DC63F"
                    BorderColor="#8DC63F" Font-Size="25" ID="btnBookHistory" OnClick="btnBookHistory_Click" />
            </div>
        </div>
    </div>
</asp:Content>
