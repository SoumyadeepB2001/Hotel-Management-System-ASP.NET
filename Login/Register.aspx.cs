using System;
using System.Data;
using System.Web.UI;

namespace HotelManagementSystemWebApp.Login
{
    public partial class Register : System.Web.UI.Page
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            try
            {          
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "new_user";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                
                con._sqlCommand.Parameters.AddWithValue("@e_id", Convert.ToInt32(txtE_id.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@pass", Convert.ToString(txtPasswordReg.Text.Trim()));

                int t = 0;
                t = con._sqlCommand.ExecuteNonQuery();
                
                if (t > 0)
                    ShowAlertMessage("Registration successful");
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");

                ClearControls();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('/Login/Login.aspx');", true);


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
            txtPasswordReg.Text = string.Empty;
        }
    }
}
