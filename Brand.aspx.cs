using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESPORTS
{
    public partial class Brand : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getCategoryByID();
        }
        //Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfBrandExists())
            {
                Response.Write("<script>alert('Brand with this ID already Exist. You cannot add another Brand with the same Brand ID');</script>");
            }
            else
            {
                addNewBrand();
            }
        }
        //Update Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfBrandExists())
            {
                updateBrand();

            }
            else
            {
                Response.Write("<script>alert('Category does not exist');</script>");
            }
        }
        //Delete Button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfBrandExists())
            {
                deleteBrand();

            }
            else
            {
                Response.Write("<script>alert('Brand does not exist');</script>");
            }
        }


        //User Defined Functions
        //Go Button Method
        void getCategoryByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from brand_tbl where brand_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Brand ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        //Delete Brand Method
        void deleteBrand()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from brand_tbl WHERE brand_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Brand Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Update Brand Method
        void updateBrand()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE brand_tbl SET brand_name=@brand_name WHERE brand_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@brand_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Brand Updated Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Add Brand Method
        void addNewBrand()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO brand_tbl(brand_id,brand_name) values(@brand_id,@brand_name)", con);

                cmd.Parameters.AddWithValue("@brand_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@brand_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Brand added Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //If Brand already exist
        bool checkIfBrandExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from brand_tbl where brand_id='" + TextBox1.Text.Trim() + "';", con);
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

        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}