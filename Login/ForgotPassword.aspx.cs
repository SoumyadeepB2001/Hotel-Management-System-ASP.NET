using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace HotelManagementSystemWebApp.Login
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = "";
            int flag = 0;
            ConnectionClass con = new ConnectionClass();

            try
            {
                string query = "SELECT email FROM users WHERE e_id = " + txtEId.Text.ToString();
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = query;
                con._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    flag++;
                    email = sdr["email"].ToString();
                }

                if (flag == 1)
                {
                    Session["user_email"] = email.Trim();
                    send_OTP(email.Trim());
                }
                    

                else
                    ShowAlertMessage("Error");
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Error");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                txtEId.Visible = false;
                btnSubmit.Visible = false;
                txt_new_pass.Visible = true;
                txt_OTP.Visible = true;
                change_password.Visible = true;
                resend_password.Visible = true;
                lbl_info.Text = "Enter the OTP sent to your registered Email ID. and your new password";
            }
        }

        protected void change_password_Click(object sender, EventArgs e)
        {
            if (Session["otp"].ToString().Equals(txt_OTP.Text.ToString()))
            {
                string pass = txt_new_pass.Text.ToString();
                ConnectionClass con = new ConnectionClass();

                try
                {
                    con.CreateConnection();
                    con.OpenConnection();
                    con._sqlCommand.CommandText = "forgot_password";
                    con._sqlCommand.CommandType = CommandType.StoredProcedure;

                    con._sqlCommand.Parameters.AddWithValue("@email", Session["user_email"].ToString().Trim());
                    con._sqlCommand.Parameters.AddWithValue("@pass", txt_new_pass.Text.ToString());

                    int t = con._sqlCommand.ExecuteNonQuery();

                    if (t > 0)
                    {
                        ShowAlertMessage("Password Changed");
                        Response.Redirect("/Login/login.aspx");
                        Response.Close();
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
                }
            }
        }

        protected void resend_Click(object sender, EventArgs e)
        {
            Session["otp"] = string.Empty;
            btnSubmit_Click(null, null);
        }

        void send_OTP(string email)
        {           
            string to = email;
            string from = "support@crystalsprings.com";
            string otp = "";

            Random rnd = new Random();
            otp = rnd.Next().ToString();

            Session["otp"] = otp;

            try
            {
                MailMessage message = new MailMessage(from, to);

                string mailbody = "Your OTP is: " + otp;
                string subject = "OTP for password change";
                message.Subject = subject;
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("mail.crystalsprings.in", 587);
                System.Net.NetworkCredential basicCredential1 = new System.Net.NetworkCredential("support@crystalsprings.com", "password123");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                client.Send(message);
            }

            catch (Exception ex)
            {
                ShowAlertMessage(ex.ToString());
            }
        }
    }
}
