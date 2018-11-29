<%@ Page Title="Manage Schedule And Fees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageScheduleFees.aspx.cs" Inherits="WebApplicationDim.Librarian.ManageSheduleFees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var successMsg = $('#<%:successMsg.ClientID %>');
            successMsg.delay(5000).fadeOut(1000);
        });
    </script>
    <div class="row">
        <div class="form-horizontal">
            <asp:Panel runat="server">
                <div class="row col-md-6">
                    <asp:Panel runat="server">
                        <div class="panel panel-success " style="background-color: #F8F8F8">
                            <p class="panel-heading" style="font-size: x-large">Add new place to the Schedule</p>
                            <div class="form-horizontal panel-body">
                                <br />
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="ddlDays" CssClass="col-md-3 control-label text-right">Select Day</asp:Label>
                                    <div class="col-md-6 ">
                                        <asp:DropDownList runat="server" ID="ddlDays" Style="max-width: 280px" CssClass="form-control">
                                            <asp:ListItem Text="Friday" Value="1" />
                                            <asp:ListItem Text="Saturday" Value="2" />
                                            <asp:ListItem Text="Sunday" Value="3" />
                                            <asp:ListItem Text="Monday" Value="4" />
                                            <asp:ListItem Text="Tuesday" Value="5" />
                                            <asp:ListItem Text="Wednesday" Value="6" />
                                            <asp:ListItem Text="Thursday" Value="7" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ErrorMessage="select something :P" ControlToValidate="ddlDays" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="placeName" CssClass="col-md-3 control-label text-right">Place Name*</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="placeName" CssClass="form-control" TextMode="SingleLine" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="PlaceName"
                                            CssClass="text-danger" ErrorMessage="The Place Name field is required." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="placeAddress" CssClass="col-md-3 control-label text-right">Address*</asp:Label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="placeAddress" CssClass="form-control" TextMode="SingleLine" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="placeAddress"
                                            CssClass="text-danger" ErrorMessage="The Address field is required." />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="Arrive Time*" AssociatedControlID="arriveTime" runat="server" CssClass="col-md-3 control-label text-right" />
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="arriveTime" Style="max-width: 280px" CssClass="form-control" TextMode="Time" />
                                        <asp:RequiredFieldValidator ErrorMessage="Arrive Time field is required"
                                            CssClass="text-danger" ControlToValidate="arriveTime" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label Text="Leaving Time*" AssociatedControlID="leaveTime" runat="server" CssClass="col-md-3 control-label text-right" />
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="leaveTime" Style="max-width: 280px" CssClass="form-control" TextMode="Time" />
                                        <asp:RequiredFieldValidator ErrorMessage="Leaving Time field is required"
                                            CssClass="text-danger" ControlToValidate="leaveTime" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-offset-3 col-md-6">
                                        <asp:Button runat="server" ID="AddShedule" Text="Add" CssClass="btn btn-success" Style="width: 100px" OnClick="AddShedule_Click" />
                                    </div>
                                </div>
                                <div>
                                    <div class="col-md-offset-2 col-md-8">
                                        <h3 class="text-success text-centre" runat="server" id="successMsg">Added to the Schedule</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-success " style="background-color: #F8F8F8">
                            <p class="panel-heading" style="font-size: x-large">Current Fees</p>
                            <div class="form-horizontal panel-body">
                                <div class="form-group">
                                    <asp:GridView runat="server" ID="gvFees" CssClass="Grid" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="SelecteAll" runat="server" AutoPostBack="true" OnCheckedChanged="SelecteAll_CheckedChanged"/>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="Selected" runat="server" />
                                                    <asp:HiddenField runat="server" ID="hfFeeId" Value='<%# Eval("feeId") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="Fee Type" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txtFeeType" Text='<%# Eval("type") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="BDT" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" CssClass="form-control" TextMode="Number" ID="txtBdt" Text='<%# Eval("bdt") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <div class="form-group">
                                        <div class="col-md-3 col-md-offset-1">
                                            <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-success" Style="width: 100px"
                                                CausesValidation="false" OnClick="btnSave_Click" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button runat="server" ID="btnFeeAdd" Text="Add" CssClass="btn btn-success" Style="width: 100px"
                                                CausesValidation="false" OnClick="btnFeeAdd_Click" />
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button runat="server" ID="btnFeeDelete" Text="Delete" CssClass="btn btn-success" Style="width: 100px"
                                                CausesValidation="false" OnClick="btnFeeDelete_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row col-md-5 col-md-offset-1 ">
                    <asp:Panel runat="server">
                        <div class="panel panel-success " style="background-color: #F8F8F8">
                            <p class="panel-heading" style="font-size: x-large">Current Schedule</p>
                            <div class="form-horizontal panel-body">
                                <br />
                                <div class="form-group">
                                    <asp:GridView runat="server" ID="gvShedule" Width="100%" CssClass="Grid" AutoGenerateColumns="false" AllowPaging="true"
                                        PageSize="10" OnPageIndexChanging="gvShedule_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="cbSelecteAll" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelecteAll_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbSelected" runat="server" />
                                                    <asp:HiddenField runat="server" ID="hfSchedulId" Value='<%# Eval("sheduleId") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Day" DataField="day" />
                                            <asp:BoundField HeaderText="Area" DataField="area" />
                                            <asp:BoundField HeaderText="Address" DataField="address" />
                                            <asp:BoundField HeaderText="Time" DataField="time" />
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                    <div class="form-group">
                                        <div class="col-md-6 col-md-offset-1">
                                            <asp:Button runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-success" Style="width: 100px"
                                                OnClick="btnDelete_Click" CausesValidation="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
