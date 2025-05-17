using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Bookings
{
    public partial class AllBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Bookings/AllBookings.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                Session["query"] = "SELECT b_id, guest_info.g_id, guest_name, guest_address, dob, gender, email, phone, id_proof, id_num, check_in, check_out, r_num, room_price, total_price, deposit, no_of_adults, no_of_children, has_checked_in, checked_in_at, has_checked_out, checked_out_at FROM guest_info, bookings WHERE guest_info.g_id = bookings.g_id";

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

            string b_id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            TextBox txtRoomPrice = (TextBox)row.Cells[13].Controls[0];
            TextBox txtTotalPrice = (TextBox)row.Cells[14].Controls[0];
            TextBox txtDeposit = (TextBox)row.Cells[15].Controls[0];
            DropDownList ddl_check_in = (DropDownList)row.FindControl("hasCheckedInDdl");
            DropDownList ddl_check_out = (DropDownList)row.FindControl("hasCheckedOutDdl");
            TextBox txtCheckedInAt = (TextBox)row.Cells[19].Controls[0];
            TextBox txtCheckedOutAt= (TextBox)row.Cells[21].Controls[0];

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "edit_bookings";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@b_id", b_id);
                con._sqlCommand.Parameters.AddWithValue("@room_price", Convert.ToString(txtRoomPrice.Text));
                con._sqlCommand.Parameters.AddWithValue("@total_price", Convert.ToString(txtTotalPrice.Text));
                con._sqlCommand.Parameters.AddWithValue("@deposit", Convert.ToString(txtDeposit.Text));
                con._sqlCommand.Parameters.AddWithValue("@has_checked_in", Convert.ToString(ddl_check_in.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@has_checked_out", Convert.ToString(ddl_check_out.SelectedValue));

                if(txtCheckedInAt.Text.ToString().Length > 0)
                    con._sqlCommand.Parameters.AddWithValue("@check_in_time", Convert.ToString(txtCheckedInAt.Text));

                if (txtCheckedOutAt.Text.ToString().Length > 0)
                    con._sqlCommand.Parameters.AddWithValue("@check_out_time", Convert.ToString(txtCheckedOutAt.Text));

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Details updated");
                else
                    ShowAlertMessage("Error");
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
    }
}