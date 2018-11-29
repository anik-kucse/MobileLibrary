<%@ Page Title="Schedule" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="WebApplicationDim.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="min-height:750px">
        <div class="panel panel-success col-md-10 col-md-offset-1" style="background-color: #f4f4f4">
            <p class="panel-heading" style="font-size: x-large">Current Schedule</p>
            <div class="form-horizontal panel-body">
                <br />
                <div class="form-group">
                    <asp:GridView runat="server" ID="gvShedule" CssClass="Grid" Width="100%" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField HeaderText="Day" DataField="day" />
                            <asp:BoundField HeaderText="Area" DataField="area" />
                            <asp:BoundField HeaderText="Address" DataField="address" />
                            <asp:BoundField HeaderText="Time" DataField="time" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
