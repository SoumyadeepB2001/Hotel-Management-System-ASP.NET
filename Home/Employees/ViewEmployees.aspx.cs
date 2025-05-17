using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace HotelManagementSystemWebApp.Home.Employees
{
    public partial class ViewEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["status"] as string) || (!Session["status"].ToString().Equals("U") && !Session["status"].ToString().Equals("A")))
            {
                Session["link"] = "/Home/Employees/ViewEmployees.aspx";
                Response.Redirect("/Login/Login.aspx");
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
            
            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                ob.CloseConnection();
                ob.DisposeConnection();
            }
        }
    }
}
