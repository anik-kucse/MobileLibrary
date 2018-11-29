using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim
{
	public partial class _Default : Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.IsInRole("Librarian"))
            //{
            //    Response.Redirect("~/Librarian/librarian_dashboard.aspx");
            //}
            //else if (User.IsInRole("Member"))
            //{
            //    Response.Redirect("~/Member/member_dashboard.aspx");
            //}
        }
	}
}