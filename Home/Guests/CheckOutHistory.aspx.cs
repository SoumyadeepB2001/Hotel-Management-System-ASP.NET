using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace HotelManagementSystemWebApp.Home.Guests
{
    public partial class CheckOutHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Guests/CheckOutHistory.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                Session["query"] = "SELECT b_id, guest_info.g_id, guest_name, guest_address, dob, gender, email, phone, id_proof, id_num, check_in, check_out, r_num, no_of_adults, no_of_children, checked_in_at, checked_out_at FROM guest_info, bookings WHERE guest_info.g_id = bookings.g_id AND has_checked_in='YES' AND has_checked_out='YES'";

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
                ShowAlertMessage("Error while fetching data");
            }

            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }
    }
}