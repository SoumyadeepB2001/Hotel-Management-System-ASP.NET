using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Guests
{
    public partial class Check_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Guests/Check_in.aspx";
                Response.Redirect("/Login/Login.aspx");
            }

            else
            {
                Session["query"] = "SELECT b_id, guest_info.g_id, guest_name, guest_address, dob, gender, email, phone, id_proof, id_num, check_in, check_out, r_num, room_price, total_price, deposit, no_of_adults, no_of_children FROM guest_info, bookings WHERE guest_info.g_id = bookings.g_id AND has_checked_in='NO' AND has_checked_out='NO' AND (CONVERT(date, GETDATE())BETWEEN check_in AND check_out)";

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Check-in")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int b_id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value.ToString());

                GridViewRow row = GridView1.Rows[rowIndex];
                double deposit = Convert.ToDouble(row.Cells[14].Text);

                double toBePaid = Convert.ToDouble(row.Cells[13].Text);

                if (deposit != toBePaid)
                {
                    double balance = (toBePaid - deposit);
                    ShowAlertMessage("Please pay only ₹" + toBePaid.ToString() + "   Balance = ₹" + balance.ToString());
                    return;
                }

                else
                {
                    ConnectionClass con = new ConnectionClass();

                    try
                    {
                        con.CreateConnection();
                        con.OpenConnection();

                        DateTime now = DateTime.Now;

                        con._sqlCommand.CommandText = "UPDATE bookings SET has_checked_in = 'YES', checked_in_at = '" + now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' WHERE b_id = " + b_id;
                        con._sqlCommand.CommandType = CommandType.Text;

                        int t = con._sqlCommand.ExecuteNonQuery();

                        if (t > 0)
                            ShowAlertMessage("Guest with booking id = " + b_id + " has checked-in");
                        else
                            ShowAlertMessage("Error checking-in");
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

            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridViewBind(Session["query"] as string);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string b_id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            TextBox txtDeposit = (TextBox)row.Cells[14].Controls[0];

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "UPDATE bookings SET deposit = @deposit WHERE b_id = " + b_id;

                SqlParameter deposit = new SqlParameter("@deposit", SqlDbType.Int);
                deposit.Value = Convert.ToInt32(txtDeposit.Text.ToString());
                con._sqlCommand.Parameters.Add(deposit);
                con._sqlCommand.Prepare();
                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Deposit Updated");
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
    }
}