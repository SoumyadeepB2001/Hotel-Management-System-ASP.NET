using System;
using System.Data.SqlClient;
using System.Data;

namespace HotelManagementSystemWebApp.Website.Sign_in
{
    public partial class sign_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userPassword"] != null && Request.Cookies["userEmail"] != null)
                    user_sign_in(Request.Cookies["userEmail"].Value, Request.Cookies["userPassword"].Value);
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

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            user_sign_in(txtEmail.Text, txtPassword.Text);
        }

        void user_sign_in(string email, string password)
        {
            ConnectionClass con = new ConnectionClass();
            int flag = 0;
            String user_email = "";
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "validate_website_users";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@email", email);
                con._sqlCommand.Parameters.AddWithValue("@user_password", password);

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();
                while (sdr.Read())
                {
                    flag++;
                    user_email = sdr["email"].ToString();
                    Session["g_id"] = sdr["g_id"].ToString();
                }

                if (flag == 1)
                {
                    Session["user_email"] = user_email;
                    Session["sign-in"] = "user";

                    if (cbRemember.Checked)
                    {
                        Response.Cookies["userEmail"].Value = email;
                        Response.Cookies["userPassword"].Value = password;

                        Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(60);
                        Response.Cookies["userEmail"].Expires = DateTime.Now.AddDays(60);
                    }

                    Response.Redirect("/Website/Home/Index.aspx");

                }

                else
                    ShowAlertMessage("Invalid Credentials");

            }

            catch (Exception ex)
            {
                ShowAlertMessage("An error occured");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                txtEmail.Text = "";
            }
        }
    }
}