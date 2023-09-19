using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManagementSystemWebApp.AdminPanel.Room
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || !Session["status"].ToString().Equals("A"))
            {
                Session["link"] = "/AdminPanel/Room/Rooms.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query"] = "SELECT * FROM rooms";

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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ConnectionClass con = new ConnectionClass();
            string room_num = GridView1.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow row = GridView1.Rows[e.RowIndex];
            HiddenField image_link = (HiddenField)row.Cells[6].FindControl("hidden_image_link2");
            delete_photo(image_link.Value.ToString());

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "DELETE FROM rooms WHERE r_num = '" + room_num + "'";
                con._sqlCommand.CommandType = CommandType.Text;

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Room Deleted");

                else
                    ShowAlertMessage("An error occured");
            }

            catch(Exception ex)
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


        string upload_photo_edit(string old_link, FileUpload photo, string name)
        {
            //First delete the existing photo if it exists
            string old_path = Server.MapPath("~" + old_link);
            FileInfo file = new FileInfo(old_path);

            if (file.Exists)//check photo exsit or not             
                file.Delete();

            //Now upload the new photo

            string fileExtension = System.IO.Path.GetExtension(photo.FileName);

            string fileName = "pic_" + name;
            photo.SaveAs(Server.MapPath("~/Images/Rooms/" + fileName + fileExtension));

            string path = "/Images/Rooms/" + fileName + fileExtension;

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

            GridViewRow row = GridView1.Rows[e.RowIndex];

            string room_num = GridView1.DataKeys[e.RowIndex].Value.ToString();

            TextBox txtPrice = (TextBox)row.Cells[2].Controls[0];
            TextBox no_of_bed = (TextBox)row.Cells[6].Controls[0];
            TextBox max_occupants = (TextBox)row.Cells[5].Controls[0];
            DropDownList cleaning_ddl = (DropDownList)row.FindControl("cleaning_ddl");
            DropDownList room_ddl = (DropDownList)row.FindControl("room_ddl");
            DropDownList bed_ddl = (DropDownList)row.FindControl("bed_ddl");
            FileUpload photoUpload = (FileUpload)row.Cells[5].FindControl("photo_upload");
            HiddenField image_link = (HiddenField)row.Cells[6].FindControl("hidden_image_link1");

            try
            {
                con.CreateConnection();
                con.OpenConnection();

                con._sqlCommand.CommandText = "update_rooms";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@r_num", room_num);
                con._sqlCommand.Parameters.AddWithValue("@price", txtPrice.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@cleaning", cleaning_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@room_type", room_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@bed_type", bed_ddl.SelectedValue.ToString());
                con._sqlCommand.Parameters.AddWithValue("@no_of_beds", no_of_bed.Text.ToString());
                con._sqlCommand.Parameters.AddWithValue("@max_occ", max_occupants.Text.ToString());

                if (photoUpload.HasFile)
                    con._sqlCommand.Parameters.AddWithValue("@image_link", upload_photo_edit(image_link.Value.ToString(), photoUpload, room_num));

                else
                    con._sqlCommand.Parameters.AddWithValue("@image_link", image_link.Value.ToString());

                int rowsAffected = con._sqlCommand.ExecuteNonQuery();

                if (rowsAffected > 0)
                    ShowAlertMessage("Room details updated");

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

        public void GridViewBind(string query)
        {
            ConnectionClass ob = new ConnectionClass();
            ob.CreateConnection();
            ob.OpenConnection();
            ob._sqlCommand.CommandText = query;
            ob._sqlCommand.CommandType = CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(ob._sqlCommand);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            ob.CloseConnection();
            ob.DisposeConnection();
        }

        string photo_upload_function()
        {
            string fileExtension = System.IO.Path.GetExtension(photo_upload.FileName);

            string fileName = "pic_" + Convert.ToString(Convert.ToString(r_no.Text.Trim()));
            photo_upload.SaveAs(Server.MapPath("~/Images/Rooms/" + fileName + fileExtension));

            string path = "/Images/Rooms/" + fileName + fileExtension;
            return path;
        }

        protected void Add_Click(object sender, EventArgs e)
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
                con._sqlCommand.CommandText = "new_room";
                con._sqlCommand.CommandType = CommandType.StoredProcedure;

                con._sqlCommand.Parameters.AddWithValue("@r_num", Convert.ToString(r_no.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@cleaning_status", Convert.ToString(cleaning.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@price", Convert.ToString(price.Text.Trim()));
                con._sqlCommand.Parameters.AddWithValue("@room", Convert.ToString(room.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@bed", Convert.ToString(bed.SelectedValue));
                con._sqlCommand.Parameters.AddWithValue("@max_occ", Convert.ToString(txt_max_occ.Text));
                con._sqlCommand.Parameters.AddWithValue("@no_of_beds", Convert.ToString(txt_no_of_beds.Text));
                con._sqlCommand.Parameters.AddWithValue("@image_link", image_link);

                int t = con._sqlCommand.ExecuteNonQuery();

                if (t > 0)
                    ShowAlertMessage("New room added");
                else
                    ShowAlertMessage("Error! Couldn't add new room");

                ClearControls();
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

            finally
            {
                con.CloseConnection();
                con.DisposeConnection();
                GridView1.EditIndex = -1;
                GridViewBind(Session["query"] as string);
            }
        }

        public void ClearControls()
        {
            r_no.Text = string.Empty;
            price.Text = string.Empty;
            room.SelectedIndex = 0;
            bed.SelectedIndex = 0;
            cleaning.SelectedIndex = 0;
        }
    }
}