<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="ESPORTS.UserLoginaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Background Image--%>
    <style>
        body {
            background-image: url('imgs/bgslogin.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
    <%--Background Image--%>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 mx-auto my-auto">
                <div class="card ">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="150px" src="imgs/generaluser.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Student Login</h3>
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
                                <label>Student ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Student ID"></asp:TextBox>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="Signup.aspx">
                                        <input class="btn btn-info btn-block btn-lg" id="Button2" type="button" value="Sign Up" /></a>
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
    </div>

</asp:Content>
