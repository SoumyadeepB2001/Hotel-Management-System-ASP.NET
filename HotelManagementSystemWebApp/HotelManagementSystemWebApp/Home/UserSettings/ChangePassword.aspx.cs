using System;
using System.Data;

namespace HotelManagementSystemWebApp.Home.UserSettings
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/UserSettings/ChangePassword.aspx";
                Response.Redirect("/Login/login.aspx");
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

        void ClearControls()
        {
            txtemail.Text = string.Empty;
            txtcurrent_pass.Text = string.Empty;
            txtnew_pass.Text = string.Empty;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string email = txtemail.Text.Trim().ToString();
            string current_pass = txtcurrent_pass.Text.Trim().ToString();
            string new_pass = txtnew_pass.Text.Trim().ToString();

            if (!email.Equals(Session["user_email"].ToString()))
            {
                ShowAlertMessage("Please enter your current email");
                return;
            }

            ConnectionClass con = new ConnectionClass();
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "change_password";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@email", email);
                con._sqlCommand.Parameters.AddWithValue("@old_pass", current_pass);
                con._sqlCommand.Parameters.AddWithValue("@new_pass", new_pass);

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Password Changed");
                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                ClearControls();
            }
        }
    }
}