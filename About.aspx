<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ESPORTS.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Background Image--%>
    <style>
        body {
            background-image: url('imgs/bg1.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
    <%--Background Image--%>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 pt-3">
                <center>
                        <h2 style="color:#ffffff;">
                        ABOUT COMSATS University Islamabad, Wah Campus</h2>
                    </center>
            </div>
        </div>
    </div>

    <div class="container-fluid pt-3">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Introduction</h4>
                        </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <p style="font-size:150%;">The COMSATS University Islamabad, Wah is a growing university. Housed in a spacious building at Wah cantonment, the campus provides state-of-the-art facilities for the acquisition of knowledge and skills</p>
                                <p>CUI, in a short span of time, has proven itself to be a world-class university dedicated to creating a knowledge base in the areas of science and technology by proactively participating in scientific research and development. CUI aims to educate and groom leaders for the 21st century by imparting quality education and training in the field of technology.</p>
                                <p>CUI is fully equipped to handle the dynamics of the fast paced industries and therefore adopts a proactive and flexible approach to anticipate and meet the challenges of future developments on the technological front. The basic function of CUI is to train the country's human resource so as to equip them to deal effectively with emerging trends. CUI focuses on the delivery of new ideas, products and services through research, development and education. </p>

                            </div>
                        </div>


                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Campus Map</h4>
                        </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d13270.271466844571!2d72.7867562!3d33.7459888!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2344c019578abeac!2sCOMSATS+Institute+of+Information+Technology+Wah!5e0!3m2!1sen!2s!4v1440413731535" width="100%" height="400" frameborder="1" style="border: 0" allowfullscreen=""></iframe>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-2 mx-auto ">
                <a href="Homepage.aspx">
                    <input class="btn btn-outline-warning " id="abc" type="button" value="Back to Home" /></a>
            </div>
        </div>
    </div>
</asp:Content>
