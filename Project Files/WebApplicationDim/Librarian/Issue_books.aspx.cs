using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class Issue_books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                h3Success.Visible = false;
                LoadGvBooks();
            }
        }

        protected void btnIssue_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var mId= data.QueryValue("GetMemberIdByMemberNum",
                new Dictionary<string, object>
                {
                    {"@mNum", txtMemberNumber.Text }
                }, true);
            var bId = data.QueryValue("GetBookIdByBookNum",
                new Dictionary<string, object>
                {
                    {"@bNum", txtBookNumber.Text }
                }, true);
            var returnDate = DateTime.Now;
            if(ddlWeek.SelectedValue == "1")
            {
                returnDate = returnDate.AddDays(7);
            }
            else
            {
                returnDate = returnDate.AddDays(14);
            }

            data.Execute("AddNewBookRecord",
                new Dictionary<string, object>
                {
                    {"@mid", mId },
                    {"@bid", bId },
                    {"@tDate", DateTime.Now },
                    {"@rDate", returnDate},
                }, true);
            h3Success.Visible = true;
            LoadGvBooks();
        }

        protected void gvBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBooks.PageIndex = e.NewPageIndex;
            LoadGvBooks();
        }

        protected void LoadGvBooks()
        {
            var books = new MySQLDatabase().Query("GetBookForLibrarian", new Dictionary<string, object> { },true);
            gvBooks.DataSource = books.Select(x => new
            {
                title = x["title"],
                bookNum = x["book_number"],
                memName = x["firstname"] + " " + x["lastname"],
                memNUm = x["member_number"],
                tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
            }).ToList();
            gvBooks.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var value = ddlSearchBy.SelectedValue;
            if (value == "1")
            {
                var books = data.Query("SearchByMemberNAme", new Dictionary<string, object> { { "@Mname", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    bookNum = x["book_number"],
                    memName = x["firstname"] + " " + x["lastname"],
                    memNUm = x["member_number"],
                    tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                    rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
                }).ToList();
                gvBooks.DataBind();
            }
            if (value == "2")
            {
                var books = data.Query("SearchByBookName", new Dictionary<string, object> { { "@Bname", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    bookNum = x["book_number"],
                    memName = x["firstname"] + " " + x["lastname"],
                    memNUm = x["member_number"],
                    tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                    rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
                }).ToList();
                gvBooks.DataBind();
            }
            if (value == "3")
            {
                var books = data.Query("SearchByMemberNo", new Dictionary<string, object> { { "@Mnum", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    bookNum = x["book_number"],
                    memName = x["firstname"] + " " + x["lastname"],
                    memNUm = x["member_number"],
                    tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                    rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
                }).ToList();
                gvBooks.DataBind();
            }
            if (value == "4")
            {
                var books = data.Query("SearchByBookNumber", new Dictionary<string, object> { { "@Bnum", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    bookNum = x["book_number"],
                    memName = x["firstname"] + " " + x["lastname"],
                    memNUm = x["member_number"],
                    tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                    rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
                }).ToList();
                gvBooks.DataBind();
            }
        }
    }
}