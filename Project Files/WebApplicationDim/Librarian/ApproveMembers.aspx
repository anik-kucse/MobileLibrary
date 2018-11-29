<%@ Page Title="Approve Members" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApproveMembers.aspx.cs" Inherits="WebApplicationDim.Librarian.ApproveMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="min-height: 750px">
        <div class="cointainer text-center">
            <div class="row">
                <div class="col-md-2 col-md-offset-1">
                    <asp:DropDownList ID="ddlMemberType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMemberType_SelectedIndexChanged"
                        AutoPostBack="true">
                        <asp:ListItem Text="Approved member" Value="1" />
                        <asp:ListItem Text="Not approved member" Value="2" />
                    </asp:DropDownList>
                </div>
                <div class="col-md-2 col-md-offset-3 ">
                    <asp:DropDownList runat="server" ID="ddlSearchBy" CssClass="form-control">
                        <asp:ListItem Text="Search By" Value="0" />
                        <asp:ListItem Text="Member Number" Value="1" />
                        <asp:ListItem Text="User Name" Value="2" />
                        <asp:ListItem Text="Email" Value="3" />
                        <asp:ListItem Text="Phone" Value="4" />
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
                <div class="panel panel-success col-md-12">
                    <p class="panel-heading" style="font-size: x-large">Members</p>
                    <div class="panel-body">
                        <asp:GridView runat="server" ID="gvApprovedMembers" Width="100%" CssClass="Grid" AutoGenerateColumns="false" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvApprovedMembers_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Member Number" DataField="memberNumber" />
                                <asp:BoundField HeaderText="User Name" DataField="userName" />
                                <asp:BoundField HeaderText="Email" DataField="email" />
                                <asp:BoundField HeaderText="Phone" DataField="phone" />
                                <asp:BoundField HeaderText="Type" DataField="memberType" />
                                <asp:BoundField HeaderText="Date of registration" DataField="DateRegister" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label Text="Action" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton Text="Detail" runat="server" ID="btnDetail" OnClick="btnDetail_Click" />
                                        <asp:HiddenField runat="server" ID="hfUid" Value='<%# Eval("uid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:GridView runat="server" ID="gvNotApprovedMember" Width="100%" CssClass="Grid" AutoGenerateColumns="false" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvNotApprovedMember_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="User Name" DataField="userName" />
                                <asp:BoundField HeaderText="Email" DataField="email" />
                                <asp:BoundField HeaderText="Phone" DataField="phone" />
                                <asp:BoundField HeaderText="Type" DataField="memberType" />
                                <asp:BoundField HeaderText="Date of registration" DataField="DateRegister" />
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:Label Text="Action" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton Text="Approve" ID="btnApprove" runat="server" OnClick="btnApprove_Click" />
                                        <asp:HiddenField runat="server" ID="hfUid" Value='<%# Eval("uid") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
