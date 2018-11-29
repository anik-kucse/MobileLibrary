<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplicationDim.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="min-height:750px">
        <div class="panel col-md-5">
            <div class="form-horizontal panel-body">
                <div class="form-group">
                    <h2><%: Title %></h2>
                    <h3></h3>
                    <address>
                        Bishwo Shahitto Kendro<br />
                        17 Kazi Nazrul Islam Avenue<br />
                        Dhaka 1000, Bangladesh<br />
                        <strong>Phone:</strong> 9660812, 86165986<br />
                        <strong>Email:</strong>   <a href="#">info@haha.org</a><br />
                    </address>
                </div>
            </div>
        </div>
        <div class="panel col-md-5 col-md-offset-2">
            <div class="form-horizontal panel-body">
                <div class="form-group">
                    <asp:Image ImageUrl="~/Images/map.PNG" runat="server" AlternateText="Map" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
