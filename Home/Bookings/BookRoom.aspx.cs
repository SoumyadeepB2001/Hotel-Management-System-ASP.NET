using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.Home.Bookings
{
    public partial class BookRoom : System.Web.UI.Page
    {
        double half_price = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Bookings/BookRoom.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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

        protected void get_rooms_Click(object sender, EventArgs e)
        {
            if ((check_in.Text == "") || (check_out.Text == ""))
            {
                ShowAlertMessage("Please enter correct Check-in and Check-out dates");
                return;
            }

            DateTime currentDate = DateTime.Now;
            DateTime check_in_date = Convert.ToDateTime(check_in.Text.Trim());
            DateTime check_out_date = Convert.ToDateTime(check_out.Text.Trim());

            if (check_in_date.Date >= check_out_date.Date || check_in_date.Date < currentDate.Date || check_out_date.Date <= currentDate.Date)
            {
                ShowAlertMessage("Please check the check-in and check-out dates");
                return;
            }

            GridViewBind(check_in.Text.ToString(), check_out.Text.ToString(), Convert.ToInt32(adults.SelectedValue), Convert.ToInt32(children.SelectedValue));
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

            DateTime check_in_date = Convert.ToDateTime(check_in.Text.Trim());
            DateTime check_out_date = Convert.ToDateTime(check_out.Text.Trim());
            double NumberOfDaysStayed = (check_out_date.Date - check_in_date.Date).TotalDays;
            full_price = price_per_night * Convert.ToInt32(NumberOfDaysStayed);
            half_price = full_price / 2;

            rooms_gridView.DataSource = null;
            rooms_gridView.DataBind();

            room_num.Text = room_number;
            ddl_adults.SelectedValue = adults.SelectedValue;
            ddl_children.SelectedValue = children.SelectedValue;

            txt_check_in.Text = check_in.Text;
            txt_check_out.Text = check_out.Text;
            price.Text = Convert.ToString(price_per_night);
            total_price.Text = Convert.ToString(full_price);
            deposit.Text = Convert.ToString(half_price);

            check_in.Text = string.Empty;
            check_out.Text = string.Empty;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (deposit.Text.Trim() == "" || Convert.ToDouble(deposit.Text.Trim()) < half_price)
            {
                ShowAlertMessage("Please pay ₹" + Convert.ToString(half_price));
                return;
            }

            if(room_num.Text == "" || txt_check_in.Text == "" || txt_check_out.Text == "")
            {
                ShowAlertMessage("Please select a room number and check-in and check-out dates");
                return;
            }

            ConnectionClass con = new ConnectionClass();

            try
            {
                con.CreateConnection();
                con.OpenConnection();
                con._sqlCommand.CommandText = "new_booking";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@name", Convert.ToString(name.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@address", Convert.ToString(address.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@dob", Convert.ToString(DOB.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@email", Convert.ToString(email.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@phone", Convert.ToString(phone.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@id_proof", Convert.ToString(IdDoc.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@id_num", Convert.ToString(IdNum.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@check_in", Convert.ToString(txt_check_in.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@check_out", Convert.ToString(txt_check_out.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@deposit", Convert.ToString(deposit.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@r_num", Convert.ToString(room_num.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@room_price", Convert.ToString(price.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@total_price", Convert.ToString(total_price.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@adults", Convert.ToString(ddl_adults.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@children", Convert.ToString(ddl_children.SelectedValue));
                if (male.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Male");
                else if (female.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Female");
                else if (other.Checked)
                    con._sqlCommand.Parameters.AddWithValue("@gender", "Other");

                if (Session["type"].ToString() == "old")
                    con._sqlCommand.Parameters.AddWithValue("@type", "old");

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("Booking Confirmed");
                else
                    ShowAlertMessage("Record insertion failed\nCheck your input data");

                ClearControls();
                hidden_div.Visible = false;
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

        protected void clear_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        void ClearControls()
        {
            name.Enabled = true;
            address.Enabled = true;
            DOB.Enabled = true;
            email.Enabled = true;
            phone.Enabled = true;
            IdDoc.Enabled = true;
            IdNum.Enabled = true;
            male.Enabled = true;
            female.Enabled = true;
            other.Enabled = true;

            DOB.TextMode = TextBoxMode.Date;
            txt_search.Text = string.Empty;
            name.Text = string.Empty;
            address.Text = string.Empty;
            DOB.Text = string.Empty;
            email.Text = string.Empty;
            phone.Text = string.Empty;
            IdDoc.SelectedIndex = 0;
            IdNum.Text = string.Empty;
            deposit.Text = string.Empty;
            male.Checked = false;
            female.Checked = false;
            other.Checked = false;
            check_in.Text = string.Empty;
            check_out.Text = string.Empty;
            txt_check_in.Text = string.Empty;
            txt_check_out.Text = string.Empty;
            room_num.Text = string.Empty;
            ddl_adults.SelectedIndex = 0;
            ddl_children.SelectedIndex = 0;
            price.Text = string.Empty;
            total_price.Text = string.Empty;
            rooms_gridView.DataSource = null;
            rooms_gridView.DataBind();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string query = string.Empty;
            string type = string.Empty;

            if (ddl_search.SelectedValue == "Email")
            {
                query = "SELECT * FROM guest_info WHERE email = @email";
                type = "email";
            }
                       
            else
            {
                query = "SELECT * FROM guest_info WHERE phone = @phone";
                type = "phone";
            }
                
            int flag = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = query;

                    SqlParameter value = new SqlParameter(null,null);

                    if (type == "email")
                        value = new SqlParameter("@email", SqlDbType.NVarChar, 50);
                    if (type == "phone")
                        value = new SqlParameter("@phone", SqlDbType.NVarChar, 15);

                    value.Value = txt_search.Text.ToString();

                    command.Parameters.Add(value);

                    command.Prepare();
                    SqlDataReader sdr = command.ExecuteReader();

                    while (sdr.Read())
                    {
                        flag++;

                        name.Text = sdr["guest_name"].ToString();
                        address.Text = sdr["guest_address"].ToString();
                        DOB.TextMode = TextBoxMode.SingleLine;
                        DateTime dob = Convert.ToDateTime(sdr["dob"]);
                        DOB.Text = dob.ToString("yyyy-MM-dd");
                        if (sdr["gender"].ToString() == "Male")
                        {
                            male.Checked = true;
                            female.Enabled = false;
                            other.Enabled = false;
                        }                           
                        else if (sdr["gender"].ToString() == "Female")
                        {
                            female.Checked = true;
                            male.Enabled = false;
                            other.Enabled = false;
                        }                          
                        else
                        {
                            other.Checked = true;
                            male.Enabled = false;
                            other.Enabled = false;
                        }                            
                        email.Text = sdr["email"].ToString();
                        phone.Text = sdr["phone"].ToString();
                        IdDoc.SelectedValue = sdr["id_proof"].ToString();
                        IdNum.Text = sdr["id_num"].ToString();

                        name.Enabled = false;
                        address.Enabled = false;
                        DOB.Enabled = false;                   
                        email.Enabled = false;
                        phone.Enabled = false;
                        IdDoc.Enabled = false;
                        IdNum.Enabled = false;

                        break;
                    }

                    if (flag == 0)
                    {
                        ShowAlertMessage("No records");
                        Session["type"] = "new";

                        if(type=="email")
                        {
                            email.Text = txt_search.Text;
                            email.Enabled = false;
                            phone.Enabled = true;
                            phone.Text = string.Empty;
                        }

                        if(type == "phone")
                        {
                            phone.Text = txt_search.Text;
                            phone.Enabled = false;
                            email.Enabled= true;
                            email.Text = string.Empty;
                        }
                        
                        hidden_div.Visible = true;
                    }

                    else if (flag == 1)
                    {
                        Session["type"] = "old";
                        hidden_div.Visible = true;
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

                finally
                {
                    connection.Close();
                    connection.Dispose();
                }
            }
        }
    }
}
