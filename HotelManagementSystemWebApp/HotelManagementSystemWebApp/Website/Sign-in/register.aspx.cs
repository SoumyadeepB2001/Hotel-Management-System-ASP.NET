using System;
using System.Data;

namespace HotelManagementSystemWebApp.Website.Sign_in
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clear_Click(object sender, EventArgs e)
        {
            clear_controls();
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

        protected void submit_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "new_guest_registration";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@guest_name", Convert.ToString(name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@guest_address", Convert.ToString(address.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@dob", Convert.ToString(DOB.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@email", Convert.ToString(email.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@phone", Convert.ToString(phone.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@id_proof", Convert.ToString(IdDoc.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@id_num", Convert.ToString(IdNum.Text.Trim()));

                if (male.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Male");
                else if (female.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Female");
                else if (other.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Other");

                con._sqlCommand.Parameters.AddWithValue("@pass", txt_pass.Text.ToString().Trim());

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t == 2)
                {
                    ShowAlertMessage("New registration complete");
                    Response.Redirect("/Website/Sign-in/sign_in.aspx");
                }

                else if (t == 1)
                    ShowAlertMessage("Email already exists. New account created.");

                else
                    ShowAlertMessage("An error occurred. Check your data.");

                clear_controls();
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

        void clear_controls()
        {
            name.Text = string.Empty;
            address.Text = string.Empty;
            DOB.Text = string.Empty;
            male.Checked = false;
            female.Checked = false;
            other.Checked = false;
            email.Text = string.Empty;
            phone.Text = string.Empty;
            IdNum.Text = string.Empty;
            IdDoc.SelectedIndex = 0;
        }
    }
}
