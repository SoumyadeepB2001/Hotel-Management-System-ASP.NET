using System;

namespace HotelManagementSystemWebApp.Home
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string img = "<img src = " + Session["user_image_link"] + " height = '28' width = '28' style = \"border-radius:100%\"> &nbsp";
            user_settings_dropdown.InnerHtml = img + Session["user_email"].ToString();
        }

        protected void Log_outClick(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Request.Cookies.Clear();
            Response.Cookies.Clear();
            Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["userEmail"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("/Login/login.aspx");
        }
    }
}
