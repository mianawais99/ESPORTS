<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ESPORTS.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

        });
    </script>
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
    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-5">
                <div class="card ">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Your Profile</h3>
                                    <span> Account Status - </span>
<asp:Label class=" p-1 badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Password" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Reg Num</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Registeration No(i.e 083)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="select" />
                                        <asp:ListItem Text="Balochistan" Value="Balochistan" />
                                        <asp:ListItem Text="Gilgit-Baltistan" Value="Gilgit-Baltistan" />
                                        <asp:ListItem Text="Islamabad Capital Territory" Value="Islamabad Capital Territory" />
                                        <asp:ListItem Text="Khyber-Pakhtunkhwa" Value="Khyber-Pakhtunkhwa" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Sindh" Value="Sindh" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="City"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Postal Code</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Postal Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                           <span class=" p-1 badge badge-pill badge-warning">Login Credentials</span>
                        </center>
                            </div>
                        </div>

                        <div class="row pt-2">
                            <div class="col-md-4">
                                <label>Student ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Student ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox2" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row pt-3">
                            <div class="col-6 mx-auto">

                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <%--Issued Goods Details--%>
            <div class="col-md-7">
                <div class="card ">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <img width="100px" src="imgs/logo.png"/>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <h3>Your Issued Goods</h3>
                                   <span class=" p-1 badge badge-pill badge-info">Your Goods Info</span>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" ForeColor="White" BorderColor="#DCAE34">
                                    <HeaderStyle BackColor="#0a3041" Font-Bold="True" ForeColor="White" BorderColor="#DCAE34" />
                                    <RowStyle BackColor="#ffffff" ForeColor="#333333" BorderColor="#DCAE34" />
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%--Issued Goods Details--%>
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

