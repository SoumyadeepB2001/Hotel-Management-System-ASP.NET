using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace HotelManagementSystemWebApp.AdminPanel.Room
{
    public partial class BedType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/Room/BedRoomType.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query1"] = "SELECT * FROM bed_types";
                Session["query2"] = "SELECT * FROM room_types";

                if (!Page.IsPostBack)
                {
                    BedGridViewBind(Session["query1"] as string);
                    RoomGridViewBind(Session["query2"] as string);
                }
            }
        }

        protected void btnRoom_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "INSERT INTO room_types VALUES(@value)";

                    SqlParameter value = new SqlParameter("@value", SqlDbType.Text, 100);

                    value.Value = txtRoom.Text.ToString();
                    command.Parameters.Add(value);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("Item Added");
                    else
                        ShowAlertMessage("Error");
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    RoomGridView.EditIndex = -1;
                    RoomGridViewBind(Session["query2"] as string);
                    txtRoom.Text = "";
                }
            }
        }

        protected void btnBed_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connection1"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(null, connection);

                    command.CommandText = "INSERT INTO bed_types VALUES(@value)";

                    SqlParameter value = new SqlParameter("@value", SqlDbType.Text, 100);

                    value.Value = txtBed.Text.ToString();
                    command.Parameters.Add(value);

                    command.Prepare();
                    int t = command.ExecuteNonQuery();

                    if (t > 0)
                        ShowAlertMessage("Item Added");
                    else
                        ShowAlertMessage("Error");
                }

                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    connection.Close();
                    connection.Dispose();
                    BedGridView.EditIndex = -1;
                    BedGridViewBind(Session["query1"] as string);
                    txtBed.Text = "";
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

        public void BedGridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            BedGridView.DataSource = ds;
            BedGridView.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }

        public void RoomGridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            RoomGridView.DataSource = ds;
            RoomGridView.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }

        protected void BedGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int id = Convert.ToInt32(BedGridView.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM bed_types WHERE bed_id = " + id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Item Deleted");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                BedGridView.EditIndex = -1;
                BedGridViewBind(Session["query1"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }

        protected void RoomGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            int id = Convert.ToInt32(RoomGridView.DataKeys[e.RowIndex].Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM room_types WHERE room_type_id = " + id;
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Item Deleted");

                else
                    ShowAlertMessage("An error occured");
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                RoomGridView.EditIndex = -1;
                RoomGridViewBind(Session["query2"] as string);
                con.CloseConnection();
                con.DisposeConnection();
            }
        }
    }
}