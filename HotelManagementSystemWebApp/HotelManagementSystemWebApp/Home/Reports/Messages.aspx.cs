using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace HotelManagementSystemWebApp.Home.Reports
{
    public partial class Messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Reports/Messages.aspx";
                Response.Redirect("/Login/login.aspx");
            }

            else
            {
                Session["query"] = "select * from user_messages";

                if (!Page.IsPostBack)
                {
                    GridViewBind(Session["query"] as string);
                }
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
    }
}