using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.AdminPanel.User
{
    public partial class EditUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/User/EditUsers.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query"] = "SELECT * FROM users";

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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int u_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = GridView1.Rows[e.RowIndex];
           
            TextBox txtPass = (TextBox)row.Cells[3].Controls[0];
            DropDownList status = (DropDownList)row.FindControl("ddl_status");

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "edit_user";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@u_id", u_id);
                con._sqlCommand.Parameters.AddWithValue("@pass", txtPass.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@u_status", status.SelectedValue.ToString());

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("User details updated");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write("<br><br><br>Error:" + ex.ToString());
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int u_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            try
            {

                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "DELETE FROM users WHERE u_id=" + u_id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("User deleted");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write("<br><br><br>Error:" + ex.ToString());
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        public void GridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = query;
                ob._sqlCommand.CommandType = CommandType.Text;

                SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }
    }
}