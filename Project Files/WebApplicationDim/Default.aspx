<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationDim._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Set black background color, white text and some padding */
        /*footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }*/
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 100%;
            height: 450px;
        }
    </style>
    <div class="container text-center">
        <div class="row">
            <div class="col-md-12">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Images/slider3.jpg" alt="Reading">
                        </div>

                        <div class="item">
                            <img src="Images/slider4.jpg" alt="Inside Mobile LIbrary">
                        </div>

                        <div class="item">
                            <img src="Images/slider6.jpg" alt="Bus">
                        </div>

                        <div class="item">
                            <img src="Images/slider7.jpg" alt="Bus">
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <div class="container text-center">
        <div class="row">

            <div class="col-md-6">
                <div class="panel panel-success">
                    <p class="panel-heading" style="font-size: x-large;">About The Founder</p>
                    <div class="panel-body row" style="text-align: justify">
                        <div class="col-md-8">
                            <p>
                                Professor Abdullah Abu Sayeed – a multi-dimensional personality – was born on July 25, 1939 in Kolkata. His father, Azimuddin Ahmed,
                                was an outstanding educationist and a well-known playwright.<br />
                                After receiving his M.A in Bangla Language and Literature from Dhaka University in 1961, 
                                Prof. 
                            </p>
                        </div>
                        <div class="col-md-4">
                            <asp:Image ImageUrl="~/Images/AASayeed-web.jpg" AlternateText="A. A. Sayeed" runat="server" />
                        </div>
                        <div class="col-md-12">
                            <p>
                                Sayeed started his career as a teacher that lasted over thirty years (1961-92) and brought him spectacular success and nation-wide recognition.
                                <a href="Others/Founder.aspx">More</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="panel panel-success">
                    <p class="panel-heading" style="font-size: x-large;">About BSK</p>
                    <div class="panel-body" style="text-align: justify">
                        <p>
                            Bishwo Shahitto Kendro today is not a mere institution. It is today a nation-wide movement, a humble assurance of an 
                            enlightened national psyche – a lively world meant for flourishing into a higher power and humanity through comprehensive 
                            practice and exercise of human knowledge along with enrichment of mind and diverse activities of life.
                            <br />
                            <br />
                            17 December 1978 saw the coming together of a small reading circle initiated by Bishwo Sahitto Kendro. The fifteen member 
                            of the circle gathered at the small auditorium of the Education Extension Centre (now known as NAEM) behind Dhaka College. 
                            They decided to hold a meeting once every week
                            <a href="Others/BSK_history.aspx">More</a>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
