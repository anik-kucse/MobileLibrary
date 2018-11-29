using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Member
{
    public partial class Book_History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGvBooks();
        }
        protected void LoadGvBooks()
        {
            var uid = User.Identity.GetUserId();
            var books = new MySQLDatabase().Query("GetBookHistoryByUid",
                new Dictionary<string, object>
                {
                    {"uid", uid }
                }, true);
            gvBooks.DataSource = books.Select(x => new
            {
                title = x["title"],
                num = x["book_number"],
                date = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                has = x["has_returned"]
            }).ToList();
            gvBooks.DataBind();
        }
    }
}