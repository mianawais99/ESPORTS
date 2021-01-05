<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewEquipments.aspx.cs" Inherits="ESPORTS.ViewEquipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 pt-3">
                <center>
                        <h3>
                        Sports Equipments List</h3>
                    </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
            </div>
        </div>

        <div class="row">

            <div class="card">
                <div class="card-body">


                    <div class="row">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:esportsDBConnectionString %>" SelectCommand="SELECT * FROM [goods_inventory_tbl]"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id" DataSourceID="SqlDataSource1" ForeColor="White" BorderColor="#DCAE34">
                                <columns>
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
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("item_name") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row p-1">
                                                                <div class="col-6">

                                                                    <span>Category:</span>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("category_name") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                                <div class="col-6 ">

                                                                    <span>Brand:</span>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("brand_name") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                            </div>

                                                            <div class="row p-1">
                                                                <div class="col-6">

                                                                    <span>Actual Stock:</span>

                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("actual_stock") %>' Font-Bold="True"></asp:Label>

                                                                </div>
                                                                <div class="col-6">

                                                                    <span>Current Stock:</span>

                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("current_stock") %>' Font-Bold="True"></asp:Label>

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
                                    <headerstyle backcolor="#0a3041" font-bold="True" forecolor="White" bordercolor="#DCAE34" />
                        <rowstyle backcolor="#ffffff" forecolor="#333333" bordercolor="#DCAE34" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
