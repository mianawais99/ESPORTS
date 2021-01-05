using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESPORTS
{
    public partial class GoodsInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_items;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillBrandCategoryValues();
            }
            GridView1.DataBind();
        }
        //Go Button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }
        //Add Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (checkIfItemExists())
            {
                Response.Write("<script>alert('Item Already Exists, try some other Item ID');</script>");
            }
            else
            {
                addNewItem();
            }
        }
        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateItemByID();
        }
        //Delete Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteItemByID();
        }

        //User Defined Functions

        //Delete Button Function
        void deleteItemByID()
        {
            if (checkIfItemExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from goods_inventory_tbl WHERE item_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Item Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }


        //Update Item Funtion
        void updateItemByID()
        {

            if (checkIfItemExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_items)
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_items;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    string filepath = "~/GoodsImages/logo";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("GoodsImages/" + filename));
                        filepath = "~/GoodsImages/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE goods_inventory_tbl set item_name=@item_name,  category_name=@category_name, brand_name=@brand_name, item_des=@item_des, actual_stock=@actual_stock, current_stock=@current_stock, item_img=@item_img where item_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@item_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@category_name", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@brand_name", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@item_des", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@item_img", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Item Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Item ID');</script>");
            }
        }

        //Get Item By ID
        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from goods_inventory_tbl WHERE item_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["item_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["item_des"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    
                    DropDownList2.SelectedValue = dt.Rows[0]["brand_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["category_name"].ToString().Trim();

                    

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_items = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["item_img"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Item ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Check if Item Exists
        bool checkIfItemExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from goods_inventory_tbl where item_id='" + TextBox1.Text.Trim() + "' OR item_name='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        //Add Item
        void addNewItem()
        {
            try
            {
                
                string filepath = "~/GoodsImages/logo.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("GoodsImages/" + filename));
                filepath = "~/GoodsImages/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO goods_inventory_tbl(item_id,item_name,category_name,brand_name,item_des,actual_stock,current_stock,item_img) values(@item_id,@item_name,@category_name,@brand_name,@item_des,@actual_stock,@current_stock,@item_img)", con);

                cmd.Parameters.AddWithValue("@item_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@item_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@category_name", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@brand_name", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@item_des", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@item_img", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Get Brands and Categories into Dropdown from Respective Database Tables
        void fillBrandCategoryValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT category_name from category_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "category_name";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT brand_name from brand_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "brand_name";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}