using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Guests
{
    public partial class Guest_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Guests/Guest_info.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                Session["query"] = "SELECT * FROM guest_info";

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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string g_id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            TextBox txtName = (TextBox)row.Cells[1].Controls[0];
            TextBox txtAddress = (TextBox)row.Cells[2].Controls[0];
            TextBox txtDOB = (TextBox)row.FindControl("txtDob");
            DropDownList gender_ddl = (DropDownList)row.FindControl("Gender_ddl");
            TextBox txtEmail = (TextBox)row.Cells[5].Controls[0];
            TextBox txtPhone = (TextBox)row.Cells[6].Controls[0];
            DropDownList document_ddl = (DropDownList)row.FindControl("Id_ddl");
            TextBox txtIdNum = (TextBox)row.Cells[8].Controls[0];

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "edit_guest_info";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@g_id", g_id.ToString());
                con._sqlCommand.Parameters.AddWithValue("@name", txtName.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@address", txtAddress.Text.ToString());

                if (txtDOB.Text.ToString().Length > 0)
                    con._sqlCommand.Parameters.AddWithValue("@dob", txtDOB.Text.ToString());

                con._sqlCommand.Parameters.AddWithValue("@gender", gender_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@email", txtEmail.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@phone", txtPhone.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@id_proof", document_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@id_num", txtIdNum.Text.ToString());

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Guest details updated");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "See Bookings")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                Session["guest_id"] = GridView1.DataKeys[rowIndex].Value.ToString();
                Response.Redirect("/Home/Guests/BookingHistory.aspx");
            }
        }
    }
}
