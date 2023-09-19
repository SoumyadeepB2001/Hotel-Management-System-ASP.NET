using System;
using System.Data;
using System.Data.SqlClient;

namespace HotelManagementSystemWebApp.Website.Home.Profile
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["sign-in"] as string) || (!Session["sign-in"].ToString().Equals("user")))
            {
                Response.Redirect("/Website/Home/Index.aspx");
            }

            else
            {
                if(!IsPostBack)
                    bindTextBoxes();
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

        protected void edit_Click(object sender, EventArgs e)
        {
            DOB.Enabled = true;
            name.Enabled = true;
            address.Enabled = true;
            gender.Enabled = true;
            email.Enabled = true;
            phone.Enabled = true;
            IdDoc.Enabled = true;
            IdNum.Enabled = true;
        }

        protected void update_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "edit_website_guest_info";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@g_id", Convert.ToString(Session["g_id"]));
                con._sqlCommand.Parameters.AddWithValue("@guest_name", Convert.ToString(name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@guest_address", Convert.ToString(address.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@dob", Convert.ToString(DOB.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@email", Convert.ToString(email.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@phone", Convert.ToString(phone.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@id_proof", Convert.ToString(IdDoc.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@id_num", Convert.ToString(IdNum.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@gender", Convert.ToString(gender.SelectedValue));

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                {
                    ShowAlertMessage("Details updated");
                    Response.Redirect("/Website/Sign-in/sign_in.aspx");
                }

                else
                {
                    ShowAlertMessage("Error");
                }

            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                bindTextBoxes();
            }
        }

        void bindTextBoxes()
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "SELECT * FROM guest_info WHERE g_id = " + Convert.ToString(Session["g_id"]);
                con._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    name.Text = sdr["guest_name"].ToString();
                    address.Text = sdr["guest_address"].ToString();
                    DOB.Text = Convert.ToDateTime(sdr["dob"].ToString()).ToString("yyyy-MM-dd");

                    gender.SelectedValue = sdr["gender"].ToString();
                    email.Text = sdr["email"].ToString();
                    phone.Text = sdr["phone"].ToString();
                    IdDoc.SelectedValue = sdr["id_proof"].ToString();
                    IdNum.Text = sdr["id_num"].ToString();

                    break;
                }

            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                disableTextBoxes();
            }
        }

        void disableTextBoxes()
        {
            DOB.Enabled = false;
            name.Enabled = false;
            address.Enabled = false;
            gender.Enabled= false;
            email.Enabled = false;
            phone.Enabled = false;
            IdDoc.Enabled = false;
            IdNum.Enabled = false;
        }
    }
}
