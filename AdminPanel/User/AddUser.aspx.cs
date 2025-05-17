using System;
using System.Data;

namespace HotelManagementSystemWebApp.AdminPanel.User
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/User/AddUser.aspx";
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtConfirm.Text.ToString() != txtPasswordReg.Text.ToString())
            {
                ShowAlertMessage("Check passwords");
                return;
            }
               
            ConnectionClass con = new ConnectionClass();
            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "new_user";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@e_id", Convert.ToString(txtE_id.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@pass", Convert.ToString(txtPasswordReg.Text.Trim()));

                int t = 0;
                t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("New user added");
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");

                ClearControls();
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

        public void ClearControls()
        {
            txtE_id.Text = string.Empty;
            txtConfirm.Text = string.Empty;
            txtPasswordReg.Text = string.Empty;
        }
    }
}