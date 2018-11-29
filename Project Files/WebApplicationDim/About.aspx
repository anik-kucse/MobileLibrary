<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplicationDim.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>Us</h2>
    <div class="row" style="min-height:750px">
        <div class="panel col-md-12">
            <h3>Nationwide Mobile Library (ML)</h3>
            <div class="form-horizontal panel-body">
                <div class="form-group">
                    <p style="text-align: justify" class="col-md-5 col-md-offest-1">
                        Library system in the country is virtually non-existent. Libraries are few in number, inefficiently managed, morose with worn-out and poor quality collections. 
                        To fill up this vacuum in the library sector of the country BSK has set up a nation-wide mobile library network. Under the ML, 
                        books reach the doorsteps of all sorts of readers as the libraries-on-wheels travel to both rural and urban areas. The specific objectives of the program are:
                        Expand book-lending facilities in different locations of the country with special emphasis on children, the underprivileged, school dropouts and female readers
                        Develop reading habits of the people and instill moral values in them
                        Promote cultural, social and environmental activities among the young generation
                    </p>
                    <asp:Image ImageUrl="~/Images/bus.jpg" runat="server" AlternateText="Bus" CssClass="col-md-offset-1"/>
                    <br />
                    <br />
                    <br />
                    <p class="col-md-12" style="text-align: justify">
                        Mobile library units visit selected spots/localities on fixed date and time every week and remain in each spot for 1-2 hours. Enrolled members return books and borrow new ones. 
                        At present the Mobile Library Program covers as many as 130,000 readers in 1900 localities of 250 Upazilas of 58 out of 64 districts of Bangladesh. Under Mobile Library Program 
                        alongside book reading program socio-cultural groups are formed in most localities that take part in various types of cultural programs regularly and work as activists in social and 
                        environmental issues in the localities.BSK uses seventypes of mobile library vehicles–46 vehicles in total at this moment–small, small-mid, mid, mid-large, large etc. carrying 
                        4000-17000 books. Each unit, on an average, serves 40 communities every week in rural areas and towns.The ML also promotes and helps creating cultural groups with the objective 
                        of mobilizing readers and local people, especially youths, to take partin cultural, social and environmental activities.
                    </p>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
