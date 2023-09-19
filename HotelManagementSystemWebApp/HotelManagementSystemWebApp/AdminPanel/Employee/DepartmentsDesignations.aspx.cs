using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace HotelManagementSystemWebApp.AdminPanel.Employee
{
    public partial class DepartmentsDesignations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/Employee/DepartmentsDesignations.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query1"] = "SELECT * FROM departments";
                Session["query2"] = "SELECT * FROM designations";

                if (!Page.IsPostBack)
                {
                    DeptGridViewBind(Session["query1"] as string);
                    DesGridViewBind(Session["query2"] as string);
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

        protected void btnDept_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "INSERT INTO departments VALUES(@value)";

                    SqlParameter value = new SqlParameter("@value", SqlDbType.Text, 100);

                    value.Value = txtDept.Text.ToString();
                    command.Parameters.Add(value);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("New department added");
                    else
                        ShowAlertMessage("An error occured");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    DeptGridView.EditIndex = -1;
                    DeptGridViewBind(Session["query1"] as string);
                    txtDept.Text = "";
                }
            }
        }

        protected void btnDes_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "INSERT INTO designations VALUES(@value)";

                    SqlParameter value = new SqlParameter("@value", SqlDbType.Text, 100);

                    value.Value = txtDes.Text.ToString();
                    command.Parameters.Add(value);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("New department added");
                    else
                        ShowAlertMessage("An error occured");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    DesGridView.EditIndex = -1;
                    DesGridViewBind(Session["query2"] as string);
                    txtDes.Text = "";
                }
            }
        }

        protected void DeptGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DeptGridView.EditIndex = e.NewEditIndex;
            DeptGridViewBind(Session["query1"] as string);
        }

        protected void DeptGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;

            GridViewRow row = DeptGridView.Rows[e.RowIndex];

            int id = Convert.ToInt32(DeptGridView.DataKeys[e.RowIndex].Value.ToString());
            TextBox txt_name = (TextBox)row.Cells[1].Controls[0];

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "UPDATE departments SET d_name = @d_name WHERE d_id = @d_id";

                    SqlParameter d_name = new SqlParameter("@d_name", SqlDbType.Text, 100);
                    SqlParameter d_id = new SqlParameter("@d_id", SqlDbType.BigInt, 0);

                    d_name.Value = txt_name.Text.ToString();
                    d_id.Value = id;

                    command.Parameters.Add(d_name);
                    command.Parameters.Add(d_id);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("Department name edited");
                    else
                        ShowAlertMessage("An error occured");
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    DeptGridView.EditIndex = -1;
                    DeptGridViewBind(Session["query1"] as string);
                }
            }
        }

        protected void DeptGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DeptGridView.EditIndex = -1;
            DeptGridViewBind(Session["query1"] as string);
        }

        protected void DesGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DesGridView.EditIndex = -1;
            DesGridViewBind(Session["query2"] as string);
        }

        protected void DesGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;

            GridViewRow row = DesGridView.Rows[e.RowIndex];

            int id = Convert.ToInt32(DesGridView.DataKeys[e.RowIndex].Value.ToString());
            TextBox txt_name = (TextBox)row.Cells[1].Controls[0];

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "UPDATE designations SET des_name = @des_name WHERE des_id = @des_id";

                    SqlParameter des_name = new SqlParameter("@des_name", SqlDbType.Text, 100);
                    SqlParameter des_id = new SqlParameter("@des_id", SqlDbType.BigInt, 0);

                    des_name.Value = txt_name.Text.ToString();
                    des_id.Value = id;

                    command.Parameters.Add(des_name);
                    command.Parameters.Add(des_id);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("Designation name edited");
                    else
                        ShowAlertMessage("An error occured");
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    DesGridView.EditIndex = -1;
                    DesGridViewBind(Session["query2"] as string);
                }
            }
        }

        protected void DesGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            DesGridView.EditIndex = e.NewEditIndex;
            DesGridViewBind(Session["query2"] as string);
        }

        public void DeptGridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DeptGridView.DataSource = ds;
            DeptGridView.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }

        public void DesGridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DesGridView.DataSource = ds;
            DesGridView.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }

        protected void DesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            GridViewRow row = DesGridView.Rows[e.RowIndex];

            int id = Convert.ToInt32(DesGridView.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM designations WHERE des_id = " + id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Record deleted");

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
                DesGridView.EditIndex = -1;
                DesGridViewBind(Session["query2"] as string);
            }
        }

        protected void DeptGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            GridViewRow row = DeptGridView.Rows[e.RowIndex];

            int id = Convert.ToInt32(DeptGridView.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM departments WHERE d_id = " + id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Record deleted");

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
                DeptGridView.EditIndex = -1;
                DeptGridViewBind(Session["query1"] as string);
            }
        }
    }
}