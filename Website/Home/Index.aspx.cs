using System;
using System.Data;
using System.Xml.Linq;

namespace HotelManagementSystemWebApp.Website.Home
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["sign-in"] as string) || (!Session["sign-in"].ToString().Equals("user")))
            {
                sign_in.Visible = true;
            }

            else if (Session["sign-in"].ToString().Equals("user"))
            {
                subMenu.Visible = true;
                user_profile.InnerHtml = Convert.ToString(Session["user_email"]);
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

        protected void btn_avail_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["sign-in"] as string) || (!Session["sign-in"].ToString().Equals("user")))
            {
                ShowAlertMessage("Please sign-in or register before continuing");
                return;
            }
            if ((txt_check_in.Text == "") || (txt_check_out.Text == ""))
            {
                ShowAlertMessage("Please enter correct Check-in and Check-out dates");
                return;
            }

            DateTime currentDate = DateTime.Now;
            DateTime check_in_date = Convert.ToDateTime(txt_check_in.Text.Trim());
            DateTime check_out_date = Convert.ToDateTime(txt_check_out.Text.Trim());

            if (check_in_date.Date >= check_out_date.Date || check_in_date.Date < currentDate.Date || check_out_date.Date <= currentDate.Date)
            {
                ShowAlertMessage("Please check the check-in and check-out dates");
                return;
            }

            Session["check_in"] = txt_check_in.Text;
            Session["check_out"] = txt_check_out.Text;
            Session["adults"] = ddl_adults.SelectedValue;
            Session["children"] = ddl_children.SelectedValue;
            Session["check"] = "True";

            Response.Redirect("Booking/BookRoom.aspx");
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "sent_message";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@first_name", Convert.ToString(txt_f_name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@last_name", Convert.ToString(txt_l_name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@email", Convert.ToString(txt_email.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@phone", Convert.ToString(txt_mobile.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@txt_message", Convert.ToString(txt_message.Text.Trim()));

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Message Sent");
                else
                    ShowAlertMessage("Error");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                txt_f_name.Text = string.Empty;
                txt_l_name.Text = string.Empty;
                txt_email.Text = string.Empty;
                txt_mobile.Text = string.Empty;
                txt_message.Text = string.Empty;
            }
        }

        protected void sign_out_ServerClick(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Request.Cookies.Clear();
            Response.Cookies.Clear();
            Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["userEmail"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Index.aspx");
        }
    }
}