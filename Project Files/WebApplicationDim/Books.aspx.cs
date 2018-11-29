using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGvBooks();
        }
        protected void LoadGvBooks()
        {
            var books = new MySQLDatabase().Query("GetAllBooks", new Dictionary<string, object> { }, true);
            gvBooks.DataSource = books.Select(x => new
            {
                title = x["title"],
                price = x["price"],
                language = x["language"],
                count = x["COUNT(*)"],
                category = x["catagoty_name"],
                author = x["first_name"] + " " + x["last_name"]
            }).ToList();
            gvBooks.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var value = ddlSearchBy.SelectedValue;
            if (value == "1")
            {
                var books = data.Query("SearchByTitleLanguage", new Dictionary<string, object> { { "@name", txtSerach.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    price = x["price"],
                    language = x["language"],
                    count = x["COUNT(*)"],
                    category = x["catagoty_name"],
                    author = x["first_name"] + " " + x["last_name"]
                }).ToList();
                gvBooks.DataBind();
            }
            else if (value == "2")
            {
                var books = data.Query("SearchByAuthorName", new Dictionary<string, object> { { "@author", txtSerach.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    price = x["price"],
                    language = x["language"],
                    count = x["COUNT(*)"],
                    category = x["catagoty_name"],
                    author = x["first_name"] + " " + x["last_name"]
                }).ToList();
                gvBooks.DataBind();
            }
            else if (value == "3")
            {
                var books = data.Query("SearchByCatagoryName", new Dictionary<string, object> { { "@catagory", txtSerach.Text } }, true);
                gvBooks.DataSource = books.Select(x => new
                {
                    title = x["title"],
                    price = x["price"],
                    language = x["language"],
                    count = x["COUNT(*)"],
                    category = x["catagoty_name"],
                    author = x["first_name"] + " " + x["last_name"]
                }).ToList();
                gvBooks.DataBind();
            }
        }

        protected void gvBooks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBooks.PageIndex = e.NewPageIndex;
            LoadGvBooks();
        }
    }
}