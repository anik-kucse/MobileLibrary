using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Member
{
    public partial class MembeeDashborad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYourAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Member/Member_Manage");
        }

        protected void btnBookHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Member/Book_History");
        }
    }
}