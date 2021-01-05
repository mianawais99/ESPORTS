<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GoodsInventory.aspx.cs" Inherits="ESPORTS.GoodsInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                pageLength: 3,
                lengthMenu: [[3, 10, 20, -1], [3, 10, 20, 25]]
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

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

    <div class="container-fluid pt-3">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Item Details</h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <img id="#imgview" Width="100px" src="GoodsImages/logo.png" />
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col ">
                                <asp:FileUpload onchange="readURL(this);" class="form-control " ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div class="row pt-3">
                            <div class="col-md-4">
                                <label>Item ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Item ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary form-control" ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <%--<asp:Button class="btn btn-primary fas fa-check-circle" ID="Button4" runat="server"  OnClick="LinkButton4_Click"  />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label>Item Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Item Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Category Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Brand Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Items</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Issued Items" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Item Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Item Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Goods Inventory List</h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:esportsDBConnectionString %>" SelectCommand="SELECT * FROM [goods_inventory_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id" DataSourceID="SqlDataSource1" ForeColor="White" BorderColor="#DCAE34">
                                    <Columns>
                                        <asp:BoundField DataField="item_id" HeaderText="ID" ReadOnly="True" SortExpression="item_id" >

                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("item_name") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row p-1">
                                                                <div class="col-6">

                                                                    <span>Category:</span>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("category_name") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                                <div class="col-6 ">

                                                                    <span>Brand:</span>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("brand_name") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row p-1">
                                                                <div class="col-6">

                                                                    <span>Actual Stock:</span>

                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                                <div class="col-6">

                                                                    <span>Current Stock:</span>

                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row p-1">
                                                                <div class="col-12">
                                                                    <span>Description: </span>
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("item_des") %>'></asp:Label>
                                                                </div>
                                                            </div>


                                                        </div>


                                                        <div class="col-lg-3">
                                                            <asp:Image class="img-fluid " ID="Image1" runat="server" ImageUrl='<%# Eval("item_img") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
