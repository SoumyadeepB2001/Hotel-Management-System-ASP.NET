using System;
using System.Data;

namespace HotelManagementSystemWebApp.Home.UserSettings
{
    public partial class DeleteAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/UserSettings/DeleteAccount.aspx";
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
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;   
            confirm_checkBox.Checked = false;
            Submit.Enabled = false;
        }

        void logOut()
        {
            Session.Contents.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Request.Cookies.Clear();
            Response.Cookies.Clear();
            Response.Redirect("/Login/login.aspx");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim().ToString();
            string pass = txtPassword.Text.Trim().ToString();

            if (!Session["user_email"].ToString().Equals(email))
            {
                ShowAlertMessage("Please enter your current email");
                ClearControls();
                return;
            }
                

            ConnectionClass con = new ConnectionClass();
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "delete_account";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@email", email);
                con._sqlCommand.Parameters.AddWithValue("@pass", pass);

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                {
                    ShowAlertMessage("Account Deleted.");
                    logOut();
                }
                    
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

        protected void confirm_checkBox_CheckedChanged(object sender, EventArgs e)
        {
            if(confirm_checkBox.Checked)          
                Submit.Enabled = true;
            
            else  Submit.Enabled = false; 
        }
    }
}