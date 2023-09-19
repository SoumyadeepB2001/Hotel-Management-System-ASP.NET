using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.AdminPanel.Employee
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/Employee/NewEmployee.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                if (!IsPostBack)
                {                   
                    getManagers();
                    getDesignations();
                    getDepartments();
                    DataBind();
                }
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

        public void ClearControls()
        {
            name.Text = string.Empty;
            address.Text = string.Empty;
            DOB.Text = string.Empty;
            email.Text = string.Empty;
            phone.Text = string.Empty;
            IdNum.Text = string.Empty;
            salary.Text = string.Empty;
            joining_date.Text = string.Empty;
            male.Checked = false;
            female.Checked = false;
            other.Checked = false;
            m_id.SelectedIndex = 0;
            designation.SelectedIndex = 0;
            department.SelectedIndex = 0;
        }

        public void getManagers()
        {
            m_id.Items.Clear();

            ListItem li = new ListItem();
            li.Text = "Select Manager ID";
            li.Value = null;
            m_id.Items.Add(li);

            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "SELECT e_id, name, department FROM employees WHERE (designation='Manager' OR designation='General Manager') and is_terminated = 'NO'";
                con._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();

                m_id.Items.Add(new ListItem("No Manager", null));

                while (sdr.Read())
                {
                    string text = Convert.ToString(sdr["name"]) + " - " + Convert.ToString(sdr["department"]);
                    string value = Convert.ToString(sdr["e_id"]);
                    m_id.Items.Add(new ListItem(text, value));
                }
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Can't fetch Manager names");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        public void getDesignations()
        {
            designation.Items.Clear();

            ListItem li = new ListItem();
            li.Text = "Select designation";
            li.Value = null;
            designation.Items.Add(li);

            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "SELECT des_name FROM designations";
                con._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    string text = Convert.ToString(sdr["des_name"]);
                    designation.Items.Add(new ListItem(text, text));
                }
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Can't fetch designations");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        public void getDepartments()
        {
            department.Items.Clear();

            ListItem li = new ListItem();
            li.Text = "Select department";
            li.Value = null;
            department.Items.Add(li);

            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "SELECT d_name FROM departments";
                con._sqlCommand.CommandType = CommandType.Text;

                SqlDataReader sdr = con._sqlCommand.ExecuteReader();

                while (sdr.Read())
                {
                    string text = Convert.ToString(sdr["d_name"]);
                    department.Items.Add(new ListItem(text, text));
                }
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Can't fetch department names");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        string photo_upload_function()
        {
            string fileExtension = System.IO.Path.GetExtension(photo_upload.FileName);

            string fileName = "pic_" + Convert.ToString(phone.Text.Trim());
            photo_upload.SaveAs(Server.MapPath("~/Images/Employees/" + fileName + fileExtension));

            string path = "/Images/Employees/" + fileName + fileExtension;
            return path;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string image_link = "";

            if (photo_upload.HasFile)
            {
                image_link = photo_upload_function();
            }

            else
            {
                ShowAlertMessage("Please upload your photo in .jpg or .jpeg formats");
                return;
            }

            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "new_employee";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@name", Convert.ToString(name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@address", Convert.ToString(address.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@dob", Convert.ToString(DOB.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@email", Convert.ToString(email.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@phone", Convert.ToString(phone.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@document", Convert.ToString(IdDoc.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@docId", Convert.ToString(IdNum.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@joining_date", Convert.ToString(joining_date.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@salary", Convert.ToString(salary.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@designation", Convert.ToString(designation.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@department", Convert.ToString(department.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@image_link", image_link);

                if (m_id.SelectedIndex == 1 || m_id.SelectedIndex == 0)
                    con._sqlCommand.Parameters.AddWithValue("@manager_id", DBNull.Value);
                else
                    con._sqlCommand.Parameters.AddWithValue("@manager_id", Convert.ToString(m_id.SelectedValue));

                if (male.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Male");
                else if (female.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Female");
                else if (other.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Other");

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("New employee added");
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");

                ClearControls();
                getManagers();
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
}
