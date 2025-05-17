using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices;
using System.Xml.Linq;

namespace HotelManagementSystemWebApp.Home.Reports
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Reports/Inventory.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query"] = "select * from inventory";

                if (!Page.IsPostBack)
                {
                    GridViewBind(Session["query"] as string);
                }
            }
        }

        private static void ShowAlertMessage(string error)
        {
            System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
            if (page != null)
            {
                error = error.Replace("'", "\'");
                System.Web.UI.ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + error + "');", true);
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "add_inventory";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@pname", Convert.ToString(name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@pcategory", Convert.ToString(category.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@quantity", Convert.ToString(quantity.Text.Trim()));

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Record inserted successfully");
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");

                ClearControls();
                GridViewBind(Session["query"] as string);
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Record insertion failed\nCheck your input data");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        public void ClearControls()
        {
            name.Text = "";
            category.Text = "";
            quantity.Text = "";
        }

        public void GridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            int p_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM inventory WHERE product_id = " + p_id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Record Deleted");

                else
                    ShowAlertMessage("Record can't be deleted");
            }
            catch (Exception ex)
            {
                ShowAlertMessage("Error: " + ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];

                int p_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

                TextBox prod_name = (TextBox)row.Cells[1].Controls[0];
                TextBox prod_cat = (TextBox)row.Cells[2].Controls[0];
                TextBox prod_quant = (TextBox)row.Cells[3].Controls[0];

                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "edit_inventory";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@p_id", p_id);
                con._sqlCommand.Parameters.AddWithValue("@pname", prod_name.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@pcategory", prod_cat.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@quantity", prod_quant.Text.ToString());

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Details Updated");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }
    }
}