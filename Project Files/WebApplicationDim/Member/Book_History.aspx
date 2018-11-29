<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Book_History.aspx.cs" Inherits="WebApplicationDim.Member.Book_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="min-height: 750px">
        <div class="panel panel-success">
            <p class="panel-heading" style="font-size: xx-large">Book History</p>
            <div class="panel-body">
                <asp:GridView runat="server" ID="gvBooks" CssClass="Grid" Width="100%" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Book Number" DataField="title" />
                        <asp:BoundField HeaderText="Book Title" DataField="num" />
                        <asp:BoundField HeaderText="Date Taken" DataField="date" />
                        <asp:BoundField HeaderText="Has Returned" DataField="has" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
