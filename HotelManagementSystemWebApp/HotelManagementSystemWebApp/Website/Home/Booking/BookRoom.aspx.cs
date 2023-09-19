using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace HotelManagementSystemWebApp.Website.Home.Booking
{
    public partial class BookRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["check"] as string) || (!Session["check"].ToString().Equals("True")))
            {
                Response.Redirect("/Website/Home/Index.aspx");
            }

            else
            {
                string check_in_date = Convert.ToString(Session["check_in"]).Trim();
                string check_out_date = Convert.ToString(Session["check_out"]).Trim();
                int adults = Convert.ToInt32(Session["adults"]);
                int children = Convert.ToInt32(Session["children"]);

                txt_check_in.Text = check_in_date;
                txt_check_out.Text = check_out_date;
                txt_adults.Text = adults.ToString();
                txt_children.Text = children.ToString();

                GridViewBind(check_in_date, check_out_date, adults, children);
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

        void GridViewBind(string check_in, string check_out, int adults, int children)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "getAvailableRooms";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@in_date", check_in);
                con._sqlCommand.Parameters.AddWithValue("@out_date", check_out);
                con._sqlCommand.Parameters.AddWithValue("@max_occ", adults + children);

                SqlDataAdapter sda = new SqlDataAdapter(con._sqlCommand);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                rooms_gridView.DataSource = ds;
                rooms_gridView.DataBind();
            }

            catch (Exception ex)
            {
                ShowAlertMessage("Can't fetch available room numbers");
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        protected void rooms_gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string room_number = rooms_gridView.SelectedRow.Cells[0].Text.ToString();
            int price_per_night = Convert.ToInt32(rooms_gridView.SelectedRow.Cells[1].Text.ToString().Trim());
            int full_price = 0;

            DateTime check_in_date = Convert.ToDateTime(Session["check_in"]);
            DateTime check_out_date = Convert.ToDateTime(Session["check_out"]);
            double NumberOfDaysStayed = (check_out_date.Date - check_in_date.Date).TotalDays;

            full_price = price_per_night * Convert.ToInt32(NumberOfDaysStayed);           

            rooms_gridView.DataSource = null;
            rooms_gridView.DataBind();
            gridview_div.Visible = false;

            room_num.Text = room_number;
            price.Text = Convert.ToString(price_per_night);
            total_price.Text = Convert.ToString(full_price);
        }

        protected void btn_book_Click(object sender, EventArgs e)
        {
            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "booking_from_website";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@g_id", Convert.ToString(Session["g_id"]));
                con._sqlCommand.Parameters.AddWithValue("@check_in", Convert.ToString(txt_check_in.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@check_out", Convert.ToString(txt_check_out.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@r_num", Convert.ToString(room_num.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@room_price", Convert.ToString(price.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@total_price", Convert.ToString(total_price.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@no_of_adults", Convert.ToString(txt_adults.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@no_of_children", Convert.ToString(txt_children.Text.Trim()));

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                {
                    form_div.Visible = false;
                    confirm_div.Visible = true;
                }
                    
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");
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

        protected void btn_redirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Website/Home/Index.aspx");
        }
    }
}