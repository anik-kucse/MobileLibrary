<%@ Page Title="Receive Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReCeive_Book.aspx.cs" Inherits="WebApplicationDim.Librarian.ReCeive_Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 750px">
        <div class="container">
            <div class="panel panel-success col-md-12">
                <p class="panel-heading" style="font-size: xx-large">Search</p>
                <div class="form-horizontal panel-body">
                    <div class="row">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddlSearchBy" CssClass="col-md-4 col-md-offset-0 control-label text-right">Search By</asp:Label>
                            <div class="col-md-6">
                                <asp:DropDownList runat="server" ID="ddlSearchBy" CssClass="form-control" Width="280px">
                                    <asp:ListItem Text="Member Name" Value="1" />
                                    <asp:ListItem Text="Book Name" Value="2" />
                                    <asp:ListItem Text="Member Number" Value="3" />
                                    <asp:ListItem Text="Book Number" Value="4" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="txtSearch" CssClass="col-md-4 col-md-offset-0 control-label text-right">Search Text</asp:Label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtSearch" CssClass=" form-control" runat="server" placeholder="search" />
                                <asp:RequiredFieldValidator ErrorMessage="search Text is required" CssClass="text-danger" ControlToValidate="txtSearch" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <asp:LinkButton ID="btnSearch" CssClass="btn btn-default btn-md" runat="server" OnClick="btnSearch_Click">
                            <span class="glyphicon glyphicon-search"></span> Serach
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <br />
        <div class="container">
            <div class="row">
                <div class="panel panel-success col-md-12">
                    <p class="panel-heading text-center" style="font-size: x-large">Books</p>
                    <div class="panel-body">
                        <asp:GridView runat="server" ID="gvBooks" Width="100%" CssClass="Grid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="20" OnPageIndexChanging="gvBooks_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelected" runat="server" />
                                        <asp:HiddenField runat="server" ID="hfBookRecordId" Value='<%# Eval("id") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Title" DataField="title" />
                                <asp:BoundField HeaderText="Book NO" DataField="bookNum" />
                                <asp:BoundField HeaderText="Name" DataField="memName" />
                                <asp:BoundField HeaderText="Member NO" DataField="memNUm" />
                                <asp:BoundField HeaderText="Taken Date" DataField="tDate" />
                                <asp:BoundField HeaderText="To Be Retuned" DataField="rDate" />
                            </Columns>
                        </asp:GridView>
                        <div>
                            <asp:Button Text="Received" ID="btnReceived" OnClick="btnReceived_Click" CssClass="btn btn-success col-md-2 col-md-offset-5" runat="server" CausesValidation="false" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
