using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Addhar_management
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email_user"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Remove("email_user");
            Response.Redirect("login.aspx");
        }
    }
}