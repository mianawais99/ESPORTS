<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="ESPORTS.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
    </script>
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
            <div class="col-md-6">
 
                <div class="card">
                    <div class="card-body">
 
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h4>Categeory Details</h4>
                                    </center>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col">
                                <center>
                                        <img width="100px" src="imgs/logo.png" />
                                       
                                    </center>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col-md-4">
                                <label>Category ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
 
                            <div class="col-md-8">
                                <label>Category Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Category Name"></asp:TextBox>
 
                                </div>
                            </div>
                        </div>
 
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button4" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button4_Click" />
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
                                        <h4>Categories List</h4>
                                    </center>
                            </div>
                        </div>
 
                       
 
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
 
                        <div class="row ">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:esportsDBConnectionString %>" SelectCommand="SELECT * FROM [category_tbl]"></asp:SqlDataSource>
                            <div class="col ">
                                <asp:GridView class="table table-striped table-bordered grid" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="category_id" DataSourceID="SqlDataSource1" ForeColor="#ffffff" BorderColor="#DCAE34">
                                    
                                    <Columns>
                                        <asp:BoundField DataField="category_id" HeaderText="category_id" ReadOnly="True" SortExpression="category_id"  />
                                        <asp:BoundField DataField="category_name" HeaderText="category_name" SortExpression="category_name" />
                                    </Columns>
                                    <HeaderStyle BackColor="#0a3041" Font-Bold="True" ForeColor="White" BorderColor="#DCAE34" />
            <RowStyle BackColor="#ffffff" ForeColor="#333333" BorderColor="#DCAE34" />
                                </asp:GridView>
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
