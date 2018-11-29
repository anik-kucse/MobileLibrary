<%@ Page Title="Take Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TakeAttendence.aspx.cs" Inherits="WebApplicationDim.Teacher.TakeAttendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <hr />
        <div class="panel panel-primary col-md-8 col-md-offset-2">
            <p class="panel-heading" style="font-size: xx-large">Take Attendance</p>
            <div class="panel-body">
                <div class="form-horizontal">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <asp:Label Text="Select Course" AssociatedControlID="ddlSelectCourse" CssClass="col-md-4 control-label" runat="server" />
                                <div class="col-md-4">
                                    <asp:DropDownList runat="server" ID="ddlSelectCourse" Style="max-width: 280px" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <asp:ImageButton ID="Calendar1Button" CssClass="btn btn-default" runat="server" Height="36px" ImageUrl="~/Images/calendar_icon.png" OnClick="Calendar1Button_Click" Width="50px" />
                            </div>
                            <div class="form-group">
                                <asp:RadioButtonList runat="server" ID="cblCalssNumber">
                                    <asp:ListItem Text="Single class" Value="1" Selected="True" />
                                    <asp:ListItem Text="Double class" Value="2" />
                                </asp:RadioButtonList>
                            </div>
                            <div class="form-group">
                                <asp:Calendar ID="Calendar1" runat="server" FirstDayOfWeek="Saturday" BackColor="White" CellSpacing="5"
                                    NextPrevFormat="ShortMonth" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="DayWeek" SelectMonthText="&gt;&gt;" SelectWeekText="Select Week" ShowNextPrevMonth="False">
                                    <DayHeaderStyle BackColor="#99CCFF" Font-Bold="True" Font-Italic="False" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <DayStyle BackColor="White" />
                                    <NextPrevStyle BackColor="#5698D1" Font-Bold="True" ForeColor="White" />
                                    <OtherMonthDayStyle BackColor="#CCCCCC" />
                                    <SelectedDayStyle BackColor="#999999" />
                                    <TitleStyle BackColor="#428BCA" Font-Bold="True" ForeColor="White" />
                                    <TodayDayStyle BackColor="Gray" />
                                </asp:Calendar>
                            </div>
                            <div class="form-group">
                                <div class="table-responsive" runat="server" style="max-height: 600px; overflow-y: auto">
                                    <asp:GridView runat="server" ID="gvTakeAttendence" CssClass="table table-striped" AutoGenerateColumns="false" 
                                        OnRowDataBound="gvTakeAttendence_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="Student ID" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%--<asp:Label Text='<%# Eval("Courses") %>' runat="server" />--%>
                                                    <asp:Label Text="text" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="Name" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <%--<asp:Label Text='<%# Eval("Students") %>' runat="server" />--%>
                                                    <asp:Label Text="text" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label Text="date" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="form-group">
                        <div>
                            <asp:Button Text="Save" CssClass="btn btn-default" runat="server" />
                        </div>
                    </div>
                    <br />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
