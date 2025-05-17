using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Website.Home.Profile
{
    public partial class bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["sign-in"] as string) || (!Session["sign-in"].ToString().Equals("user")))
            {
                Response.Redirect("/Website/Home/Index.aspx");
            }

            else
            {
                if (!IsPostBack)
                {
                    GridViewBind1();
                    GridViewBind2();
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

        public void GridViewBind1()
        {
            ConnectionClass ob = new ConnectionClass();

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = "SELECT b_id, check_in, check_out, r_num, room_price, total_price, no_of_adults, no_of_children FROM bookings WHERE (check_out <= GETDATE()) and g_id = " + Convert.ToString(Session["g_id"]);
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

        public void GridViewBind2()
        {
            ConnectionClass ob = new ConnectionClass();

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = "SELECT b_id, check_in, check_out, r_num, room_price, total_price, no_of_adults, no_of_children FROM bookings WHERE (check_out > GETDATE()) and g_id = " + Convert.ToString(Session["g_id"]);
                ob._sqlCommand.CommandType = CommandType.Text;

                SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
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

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            int b_id = Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString());

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
                GridViewBind2();
                con.CloseConnection();
                con.DisposeConnection();
            }
        }
    }
}