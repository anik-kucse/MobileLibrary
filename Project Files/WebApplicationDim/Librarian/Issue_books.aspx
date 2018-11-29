<%@ Page Title="Issue Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Issue_books.aspx.cs" Inherits="WebApplicationDim.Librarian.Issue_books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var h3 = $('#<%:h3Success.ClientID %>');

            h3.delay(5000).fadeOut(1000);
        });
    </script>
    <div style="min-height: 750px">
        <div class="container">
            <div class="panel panel-success col-md-6" style="min-height: 345px">
                <p class="panel-heading" style="font-size: xx-large">Issue Books</p>
                <div class="form-horizontal panel-body">
                    <div>
                        <div class="col-md-offset-4 col-md-8">
                            <h3 class="text-success text-centre" runat="server" id="h3Success">Book Issued</h3>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtMemberNumber" CssClass="col-md-4 col-md-offset-0 control-label text-right">member Number</asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtMemberNumber" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator ErrorMessage="Member Number field is required"
                                CssClass="text-danger" ControlToValidate="txtMemberNumber" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtBookNumber" CssClass="col-md-4 col-md-offset-0 control-label text-right">Book Number</asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txtBookNumber" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator ErrorMessage="Book Number field is required"
                                CssClass="text-danger" ControlToValidate="txtBookNumber" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddlWeek" CssClass="col-md-4 col-md-offset-0 control-label text-right">Borrowed for</asp:Label>
                        <div class="col-md-6">
                            <asp:DropDownList runat="server" ID="ddlWeek" Style="max-width: 280px" CssClass="form-control">
                                <asp:ListItem Text="One Week" Value="1" />
                                <asp:ListItem Text="Two Weeks" Value="2" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4 col-md-offset-4">
                            <asp:Button runat="server" ID="btnIssue" Text="Issue" CssClass="btn btn-success" Style="width: 100px" OnClick="btnIssue_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-success col-md-6" style="min-height: 345px">
                <p class="panel-heading" style="font-size: xx-large">Search</p>
                <div class="form-horizontal panel-body">
                    <div class="row">
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ddlSearchBy" CssClass="col-md-4 col-md-offset-0 control-label text-right">Search By</asp:Label>
                            <div class="col-md-6">
                                <asp:DropDownList runat="server" ID="ddlSearchBy" CssClass="form-control">
                                    <asp:ListItem Text="Member Name" Value="1" />
                                    <asp:ListItem Text="Book Name" Value="2" />
                                    <asp:ListItem Text="Member Number" Value="3" />
                                    <asp:ListItem Text="Book Number" Value="4" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="txtSearch" CssClass="col-md-4 col-md-offset-0 control-label text-right">Search Text</asp:Label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtSearch" CssClass=" form-control" runat="server" placeholder="search" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <asp:LinkButton ID="btnSearch" CssClass="btn btn-default btn-md" runat="server" CausesValidation="false" OnClick="btnSearch_Click">
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
                            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvBooks_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderText="Title" DataField="title" />
                                <asp:BoundField HeaderText="Book NO" DataField="bookNum" />
                                <asp:BoundField HeaderText="Name" DataField="memName" />
                                <asp:BoundField HeaderText="Member NO" DataField="memNUm" />
                                <asp:BoundField HeaderText="Taken Date" DataField="tDate" />
                                <asp:BoundField HeaderText="To Be Retuned" DataField="rDate" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
