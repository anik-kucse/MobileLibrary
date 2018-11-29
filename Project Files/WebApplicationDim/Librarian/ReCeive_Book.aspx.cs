using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class ReCeive_Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGvBooks();
            }
        }
        protected void LoadGvBooks()
        {
            var books = new MySQLDatabase().Query("GetBooksForReceived", new Dictionary<string, object> { }, true);
            gvBooks.DataSource = books.Select(x => new
            {
                id = x["id"],
                title = x["title"],
                bookNum = x["book_number"],
                memName = x["firstname"] + " " + x["lastname"],
                memNUm = x["member_number"],
                tDate = Convert.ToDateTime(x["date_taken"]).ToString("dd-MM-yyyy"),
                rDate = Convert.ToDateTime(x["date_tobe_returned"]).ToString("dd-MM-yyyy")
            }).ToList();
            gvBooks.DataBind();
        }

        protected void gvBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBooks.PageIndex = e.NewPageIndex;
            LoadGvBooks();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var value = ddlSearchBy.SelectedValue;
            if (value == "1")
            {
                var books = data.Query("SearchByMemberNAmeForRe", new Dictionary<string, object> { { "@Mname", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    id = x["id"],
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
                var books = data.Query("SearchByBookNameForRe", new Dictionary<string, object> { { "@Bname", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    id = x["id"],
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
                var books = data.Query("SearchByMemberNoForRe", new Dictionary<string, object> { { "@Mnum", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    id = x["id"],
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
                var books = data.Query("SearchByBookNumberForRe", new Dictionary<string, object> { { "@Bnum", txtSearch.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    id = x["id"],
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

        protected void btnReceived_Click(object sender, EventArgs e)
        {
            foreach(GridViewRow gridViewRow in this.gvBooks.Rows)
            {
                CheckBox cb = (CheckBox)gridViewRow.FindControl("cbSelected");
                HiddenField id = (HiddenField)gridViewRow.FindControl("hfBookRecordId");
                if (cb.Checked == true)
                {
                    new MySQLDatabase().Execute("UpdateBookRecordRe",
                        new Dictionary<string, object>
                        {
                            {"@brid", Convert.ToInt32(id.Value) }
                        }, true);
                }
                LoadGvBooks();
            }
        }
    }
}