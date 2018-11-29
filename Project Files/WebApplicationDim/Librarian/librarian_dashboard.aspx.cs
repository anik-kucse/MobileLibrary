using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class librarian_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYourAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/Librarian_manage");
        }

        protected void btnSheduleFees_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/ManageScheduleFees");
        }

        protected void btnApproveMembers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/ApproveMembers");
        }

        protected void btnAddNewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/Add_New_Book");
        }

        protected void btnIssueBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/Issue_books");
        }

        protected void btnReceive_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/ReCeive_Book");
        }
    }
}