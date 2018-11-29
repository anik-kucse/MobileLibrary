<%@ Page Title="Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="WebApplicationDim.Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 750px">
        <div class="cointainer text-center">
            <div class="row">
                <div class="col-md-2 col-md-offset-3 ">
                    <asp:DropDownList runat="server" ID="ddlSearchBy" CssClass="form-control">
                        <asp:ListItem Text="Search By" Value="0" />
                        <asp:ListItem Text="Title/Language" Value="1" />
                        <asp:ListItem Text="Author" Value="2" />
                        <asp:ListItem Text="Catagory" Value="3" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSerach" CssClass=" form-control" runat="server" placeholder="search" />
                </div>
                <div class="col-md-1">
                    <asp:LinkButton ID="btnSearch" CssClass="btn btn-default btn-md" runat="server" OnClick="btnSearch_Click">
                    <span class="glyphicon glyphicon-search"></span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
        <hr />
        <br />
        <div class="container">
            <div class="row">
                <div class="panel panel-success col-md-12" style="height: 700px">
                    <p class="panel-heading text-center" style="font-size: x-large">Books</p>
                    <div class="panel-body">
                        <asp:GridView runat="server" ID="gvBooks" Width="100%" CssClass="Grid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvBooks_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Title" DataField="title" />
                                <asp:BoundField HeaderText="Author" DataField="author" />
                                <asp:BoundField HeaderText="Category" DataField="category" />
                                <asp:BoundField HeaderText="Language" DataField="language" />
                                <asp:BoundField HeaderText="Price" DataField="price" />
                                <asp:BoundField HeaderText="Count" DataField="count" />
                                <%-- <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label Text="Action" runat="server" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton Text="Detail" runat="server" ID="btnDetail" />
                                    <asp:HiddenField runat="server" ID="hfUid" Value='<%# Eval("uid") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
