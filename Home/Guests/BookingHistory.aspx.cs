using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace HotelManagementSystemWebApp.Home.Guests
{
    public partial class BookingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Guests/Guest_info.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                int g_id = Convert.ToInt32(Session["guest_id"]);

                Session["query"] = "SELECT b_id, guest_name, email, phone, check_in, check_out, r_num, total_price, no_of_adults, no_of_children, has_checked_in, checked_in_at, has_checked_out, checked_out_at FROM bookings, guest_info WHERE bookings.g_id = guest_info.g_id AND bookings.g_id = " + g_id;

                if (!Page.IsPostBack)
                {
                    GridViewBind(Session["query"] as string);
                }
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