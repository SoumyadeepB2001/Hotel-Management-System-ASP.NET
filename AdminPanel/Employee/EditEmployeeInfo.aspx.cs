using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HotelManagementSystemWebApp.AdminPanel.Employee
{
    public partial class EditEmployeeInfo : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/Employee/EditEmployeeInfo.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query"] = "SELECT * FROM employees WHERE is_terminated = 'NO'";

                if (!Page.IsPostBack)
                {
                    GridViewBind(Session["query"] as string);
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

        public void GridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();

            try
            {
                ob.CreateConnection();
                ob.OpenConnection();
                ob._sqlCommand.CommandText = query;
                ob._sqlCommand.CommandType = CommandType.Text;

                SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Session["old_designation"] = Convert.ToString(GridView1.Rows[e.NewEditIndex].Cells[11].Text);
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridViewBind(Session["query"] as string);
        }

        string upload_photo(string old_link, FileUpload photo, string phone)
        {
            //First delete the existing photo if it exists
            string old_path = Server.MapPath("~" + old_link);
            FileInfo file = new FileInfo(old_path);

            if (file.Exists)//check photo exsit or not             
                file.Delete();

            //Now upload the new photo

            string fileExtension = System.IO.Path.GetExtension(photo.FileName);

            string fileName = "pic_" + phone;
            photo.SaveAs(Server.MapPath("~/Images/Employees/" + fileName + fileExtension));

            string path = "/Images/Employees/" + fileName + fileExtension;

            return path;
        }

        void delete_photo(string link)
        {
            string old_path = Server.MapPath("~" + link);
            FileInfo file = new FileInfo(old_path);

            if (file.Exists)//check photo exsit or not             
                file.Delete();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int e_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = GridView1.Rows[e.RowIndex];

            TextBox txtName = (TextBox)row.Cells[1].Controls[0];
            TextBox txtAddress = (TextBox)row.Cells[2].Controls[0];
            TextBox txtDOB = (TextBox)row.FindControl("txtDob");
            DropDownList gender_ddl = (DropDownList)row.FindControl("Gender_ddl");
            TextBox txtEmail = (TextBox)row.Cells[5].Controls[0];
            TextBox txtPhone = (TextBox)row.Cells[6].Controls[0];
            DropDownList document_ddl = (DropDownList)row.FindControl("Document_ddl");
            TextBox txtDocId = (TextBox)row.Cells[8].Controls[0];
            TextBox txtJoiningDate = (TextBox)row.FindControl("txtJoiningDate");
            TextBox txtSalary = (TextBox)row.Cells[10].Controls[0];
            DropDownList designation_ddl = (DropDownList)row.FindControl("Designation_ddl");
            DropDownList department_ddl = (DropDownList)row.FindControl("Department_ddl");
            DropDownList manager_ddl = (DropDownList)row.FindControl("Manager_ddl");                  
            FileUpload photoUpload = (FileUpload)row.Cells[16].FindControl("photo_upload");
            HiddenField image_link = (HiddenField)row.Cells[17].FindControl("hidden_image_link1");

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "edit_employee";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@e_id", e_id);
                con._sqlCommand.Parameters.AddWithValue("@name", txtName.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@address", txtAddress.Text.ToString());

                if (txtDOB.Text.ToString().Length > 0)
                    con._sqlCommand.Parameters.AddWithValue("@dob", txtDOB.Text.ToString());

                con._sqlCommand.Parameters.AddWithValue("@gender", gender_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@email", txtEmail.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@phone", txtPhone.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@document", document_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@docId", txtDocId.Text.ToString());

                if (txtJoiningDate.Text.ToString().Length > 0)
                    con._sqlCommand.Parameters.AddWithValue("@joining_date", txtJoiningDate.Text.ToString());

                con._sqlCommand.Parameters.AddWithValue("@salary", txtSalary.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@new_designation", designation_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@old_designation", Session["old_designation"].ToString());
                con._sqlCommand.Parameters.AddWithValue("@department", department_ddl.SelectedValue.ToString());

                if (manager_ddl.SelectedIndex == 0)
                    con._sqlCommand.Parameters.AddWithValue("@manager_id", DBNull.Value);
                else
                    con._sqlCommand.Parameters.AddWithValue("@manager_id", manager_ddl.SelectedValue.ToString());                

                if (photoUpload.HasFile)
                    con._sqlCommand.Parameters.AddWithValue("@image_link", upload_photo(image_link.Value.ToString(), photoUpload, txtPhone.Text.ToString()));

                else
                    con._sqlCommand.Parameters.AddWithValue("@image_link", image_link.Value.ToString());

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Employee details updated");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write("<br><br><br>Error:" + ex.ToString());
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int e_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());

            //For deleting the photo from server
            GridViewRow row = GridView1.Rows[e.RowIndex];
            HiddenField image_link = (HiddenField)row.Cells[17].FindControl("hidden_image_link2");
            delete_photo(image_link.Value.ToString());

            try
            {

                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "UPDATE employees SET manager_id = null WHERE manager_id = "+ e_id +" DELETE FROM employees WHERE e_id = " + e_id + " DELETE FROM users WHERE e_id = " + e_id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Employee Deleted");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write("An error occured");
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }
    }
}
