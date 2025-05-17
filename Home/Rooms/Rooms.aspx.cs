using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Rooms
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Rooms/Rooms.aspx";
                Response.Redirect("/Login/login.aspx");
            } 
                

            else
            {
                Session["query"] = "SELECT * FROM rooms";

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

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string room_num = GridView1.DataKeys[e.RowIndex].Value.ToString();

            DropDownList cleaning_ddl = (DropDownList)row.FindControl("DropDownList2");

            string cleaning = cleaning_ddl.SelectedValue.ToString();

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "UPDATE rooms SET cleaning_status = '" + cleaning + "' WHERE r_num = '" + room_num + "'";
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Record Updated");

                else
                    ShowAlertMessage("Record can't be updated");
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Error: " + ex.ToString());
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