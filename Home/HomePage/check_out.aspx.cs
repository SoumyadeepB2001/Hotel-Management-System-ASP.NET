using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.HomePage
{
    public partial class check_out : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
                Response.Redirect("/Login/Login.aspx");

            else
            {
                Session["query"] = "SELECT b_id, guest_name, guest_address, dob, gender, email, phone, check_in, check_out, r_num, no_of_adults, no_of_children, checked_in_at FROM guest_info, bookings WHERE guest_info.g_id = bookings.g_id AND has_checked_in='YES' AND has_checked_out='NO' AND check_out = CONVERT(date, GETDATE())";

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int b_id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value.ToString());
            ConnectionClass con = new ConnectionClass();
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                DateTime now = DateTime.Now;

                con._sqlCommand.CommandText = "UPDATE bookings SET has_checked_out = 'YES', checked_out_at = '" + now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' WHERE b_id = " + b_id;

                con._sqlCommand.CommandType = CommandType.Text;

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Guest with booking id = " + b_id + " has checked-out");
                else
                    ShowAlertMessage("Error checking-out");
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