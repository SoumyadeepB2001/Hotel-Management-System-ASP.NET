using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Bookings
{
    public partial class search_update_cancel_bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Bookings/CancelBookings.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                Session["query"] = "SELECT b_id, guest_name, guest_address, dob, gender, email, phone, id_proof, id_num, check_in, check_out, r_num, total_price, deposit, no_of_adults, no_of_children FROM guest_info, bookings WHERE guest_info.g_id = bookings.g_id and has_checked_in='NO' and has_checked_out='NO' and (CONVERT(date, GETDATE()) <= check_in)";

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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            GridViewRow row = GridView1.Rows[e.RowIndex];

            int b_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "cancel_bookings";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@b_id", b_id);

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected == 2)
                    ShowAlertMessage("Booking Cancelled");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
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