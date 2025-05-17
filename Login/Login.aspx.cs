using System;
using System.Data.SqlClient;
using System.Data;

namespace HotelManagementSystemWebApp.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userPassword"] != null && Request.Cookies["userEmail"] != null)                
                    log_in(Request.Cookies["userEmail"].Value, Request.Cookies["userPassword"].Value);                
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

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            log_in(txtEmail.Text,  txtPassword.Text);
        }       
        
        void log_in(string email, string password)
        {
            ConnectionClass con = new ConnectionClass();
            int flag = 0;
            String status = "";
            String user_email = "";
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "validate_users";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@email", email);
                con._sqlCommand.Parameters.AddWithValue("@user_password", password);

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();
                while (sdr.Read())
                {
                    flag++;
                    status = sdr["u_status"].ToString();
                    user_email = sdr["email"].ToString();
                    Session["user_image_link"] = sdr["image_link"].ToString();
                }

                if (flag == 1)
                {                  
                    Session["status"] = status;
                    Session["user_email"] = user_email;   

                    if (cbRemember.Checked)
                    {
                        Response.Cookies["userEmail"].Value = email;
                        Response.Cookies["userPassword"].Value = password;

                        Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(60);
                        Response.Cookies["userEmail"].Expires = DateTime.Now.AddDays(60);
                    }

                    if (string.IsNullOrEmpty(Session["link"] as string))
                    {
                        Response.Redirect("/Home/HomePage/HomePage.aspx");
                    }
                    else
                    {
                        string link = Session["link"].ToString();
                        Response.Redirect(link);
                    }

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
