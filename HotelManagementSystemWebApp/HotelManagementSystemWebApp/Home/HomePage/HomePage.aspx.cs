using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

namespace HotelManagementSystemWebApp.Home.HomePage
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
                Response.Redirect("/Login/Login.aspx");

            else
            {
                showDetails();
                showCheckIns();
                showCheckOuts();
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

        void showDetails()
        {
            Message1.InnerHtml = Server.HtmlEncode(Session["user_email"].ToString());
            Message2.InnerHtml = Server.HtmlEncode(DateTime.Now.ToString("dddd, dd MMMM yyyy hh:mm:ss tt"));
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            showDetails();
        }

        void showCheckIns()
        {
            ConnectionClass ob = new ConnectionClass();

            string query = "SELECT COUNT(*) FROM bookings WHERE check_in = " + "\'" + DateTime.Now.ToString("yyyy/MM/dd") + "\'";

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = query;
                ob._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = ob._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    check_in.InnerHtml = Server.HtmlEncode(sdr[0].ToString());
                }
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Error");
            }

            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }

        void showCheckOuts()
        {
            ConnectionClass ob = new ConnectionClass();

            string query = "SELECT COUNT(*) FROM bookings WHERE check_out = " + "\'" + DateTime.Now.ToString("yyyy/MM/dd") + "\'";

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = query;
                ob._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = ob._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    check_out.InnerHtml = Server.HtmlEncode(sdr[0].ToString());
                }
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Error");
            }

            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }

        protected void btn_check_in_Click(object sender, EventArgs e)
        {
            Response.Redirect("check_in.aspx");
        }

        protected void btn_check_out_Click(object sender, EventArgs e)
        {
            Response.Redirect("check_out.aspx");
        }
    }
}
