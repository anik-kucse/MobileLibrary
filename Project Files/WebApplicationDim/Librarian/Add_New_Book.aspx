<%@ Page Title="Add New Book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_New_Book.aspx.cs" Inherits="WebApplicationDim.Librarian.Add_New_Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="min-height: 750px">
        <asp:MultiView ID="multiView1" runat="server">
            <asp:View runat="server" ID="viewCatagory">
                <div class="row">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8; height: 400px">
                        <p class="panel-heading" style="font-size: x-large">Book Catagory</p>
                        <div class="form-horizontal panel-body">
                            <br />
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlCategory" CssClass="col-md-5 col-md-offset-0 control-label text-right">Select category</asp:Label>
                                <div class="col-md-6 ">
                                    <asp:DropDownList runat="server" ID="ddlCategory" Style="max-width: 280px" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label Text="Add or Delate Category" AssociatedControlID="btnAddDeleteCatagory" runat="server" CssClass="col-md-5 control-label text-right" />
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnAddDeleteCatagory" Text="Add/Delate" CssClass="btn btn-success" Style="width: 100px" OnClick="btnAddDeleteCatagory_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-8">
                                    <asp:Button runat="server" ID="btnCategoryNext" Text="Next >>" CssClass="btn btn-success" Style="width: 100px" OnClick="btnCategoryNext_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewBookDetail">
                <div class="row">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8">
                        <p class="panel-heading" style="font-size: x-large">Book Detail</p>
                        <div class="form-horizontal panel-body">
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtBookTitle" CssClass="col-md-4 col-md-offset-0 control-label text-right">Title</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtBookTitle" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Book Name field is required"
                                        CssClass="text-danger" ControlToValidate="txtBookTitle" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtBookNumber" CssClass="col-md-4 col-md-offset-0 control-label text-right">Book Number</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtBookNumber" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Book Number field is required"
                                        CssClass="text-danger" ControlToValidate="txtBookNumber" runat="server" />
                                    <asp:Label ID="lblWarnnig" CssClass="text-danger" Text="!!!...Book Number Aready Exists...!!!" runat="server" Visible="false" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtBookPrice" CssClass="col-md-4 col-md-offset-0 control-label text-right">Price</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtBookPrice" Style="max-width: 280px" CssClass="form-control" TextMode="Number" />
                                    <asp:RequiredFieldValidator ErrorMessage="Price field is required"
                                        CssClass="text-danger" ControlToValidate="txtBookPrice" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtBookLanguage" CssClass="col-md-4 col-md-offset-0 control-label text-right">Language</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtBookLanguage" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Language field is required"
                                        CssClass="text-danger" ControlToValidate="txtBookLanguage" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtBookEdition" CssClass="col-md-4 col-md-offset-0 control-label text-right">Edition</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtBookEdition" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Edition field is required"
                                        CssClass="text-danger" ControlToValidate="txtBookEdition" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-1">
                                    <asp:Button runat="server" ID="btnBookDetailPrevious" Text="<< Previous" CssClass="btn btn-success" Style="width: 100px" CausesValidation="false" OnClick="btnBookDetailPrevious_Click" />
                                </div>
                                <div class="col-md-4 col-md-offset-3">
                                    <asp:Button runat="server" ID="btnBookDetailNext" Text="Next >>" CssClass="btn btn-success" Style="width: 100px" OnClick="btnBookDetailNext_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewAuthor">
                <div class="row">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8; height: 400px">
                        <p class="panel-heading" style="font-size: x-large">Author</p>
                        <div class="form-horizontal panel-body">
                            <br />
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlAuthor" CssClass="col-md-5 col-md-offset-0 control-label text-right">Select Author</asp:Label>
                                <div class="col-md-6 ">
                                    <asp:DropDownList runat="server" ID="ddlAuthor" Style="max-width: 280px" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label Text="Add or Delate Author" AssociatedControlID="btnAddDelateAuthor" runat="server" CssClass="col-md-5 control-label text-right" />
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnAddDelateAuthor" Text="Add/Delate" CssClass="btn btn-success" Style="width: 100px" OnClick="btnAddDelateAuthor_Click" />
                                </div>
                            </div>
                            <br />
                            <br />
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-1">
                                    <asp:Button runat="server" ID="btnAuthorPrevious" Text="<< Previous" CssClass="btn btn-success" Style="width: 100px" OnClick="btnAuthorPrevious_Click" />
                                </div>
                                <div class="col-md-4 col-md-offset-3">
                                    <asp:Button runat="server" ID="BtnAuthorFinish" Text="Finish" CssClass="btn btn-success" Style="width: 100px" OnClick="BtnAuthorFinish_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewSuccess">
                <div class="row text-center">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8">
                        <div class="panel-body">
                            <h2>Book Addition Successfull</h2>
                            <br />
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-4">
                                    <asp:Button runat="server" ID="btnAddNewBook" Text="Add New Book" CssClass="btn btn-success btn-lg" CausesValidation="false" OnClick="btnAddNewBook_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewAddDelateCatagory">
                <div class="row">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8">
                        <p class="panel-heading" style="font-size: x-large">Add/Delate Book Catagory</p>
                        <div class="form-horizontal panel-body">
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtCategoryName" CssClass="col-md-5 col-md-offset-0 control-label text-right">Category Name</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtCategoryName" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Catagory Name field is required"
                                        CssClass="text-danger" ControlToValidate="txtCategoryName" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-5 col-md-6">
                                    <asp:Button runat="server" ID="btnCatagoryAddSuccess" Text="Add" CssClass="btn btn-success" Style="width: 100px" OnClick="btnCatagoryAddSuccess_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlDelateCategory" CssClass="col-md-5 col-md-offset-0 control-label text-right">Select category</asp:Label>
                                <div class="col-md-6 ">
                                    <asp:DropDownList runat="server" ID="ddlDelateCategory" Style="max-width: 280px" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="col-md-offset-5 col-md-6">
                                    <asp:Button runat="server" ID="btnCategoryDelate" Text="Delate" CssClass="btn btn-danger" Style="width: 100px" CausesValidation="false" OnClick="btnCategoryDelate_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label Text="Go Back to Catagory Page" AssociatedControlID="btnBackCatagory" runat="server" CssClass="col-md-5 control-label text-right" />
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnBackCatagory" Text="Go back" CssClass="btn btn-success" Style="width: 100px" CausesValidation="false" OnClick="btnBackCatagory_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="viewAddDelateAuthor">
                <div class="row">
                    <div class="panel panel-success col-md-6 col-md-offset-3" style="background-color: #F8F8F8">
                        <p class="panel-heading" style="font-size: x-large">Add/Delate Author</p>
                        <div class="form-horizontal panel-body">
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-5 col-md-offset-0 control-label text-right">First Name</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtFirstName" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="First Name field is required"
                                        CssClass="text-danger" ControlToValidate="txtFirstName" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-5 col-md-offset-0 control-label text-right">Last Name</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtLastName" Style="max-width: 280px" CssClass="form-control" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator ErrorMessage="Last Name field is required"
                                        CssClass="text-danger" ControlToValidate="txtLastName" runat="server" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-5 col-md-6">
                                    <asp:Button runat="server" ID="btnAddAuthor" Text="Add" CssClass="btn btn-success" Style="width: 100px" OnClick="btnAddAuthor_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlDelateAuthor" CssClass="col-md-5 col-md-offset-0 control-label text-right">Select Author</asp:Label>
                                <div class="col-md-6 ">
                                    <asp:DropDownList runat="server" ID="ddlDelateAuthor" Style="max-width: 280px" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="col-md-offset-5 col-md-6">
                                    <asp:Button runat="server" ID="btnDelateAuthor" Text="Delate" CssClass="btn btn-danger" Style="width: 100px" CausesValidation="false" OnClick="btnDelateAuthor_Click" />
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <asp:Label Text="Go Back to Author Page" AssociatedControlID="btnBackCatagory" runat="server" CssClass="col-md-5 control-label text-right" />
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="btnBackAuthor" Text="Go back" CssClass="btn btn-success" Style="width: 100px" CausesValidation="false" OnClick="btnBackAuthor_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
