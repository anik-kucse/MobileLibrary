using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class Add_New_Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                multiView1.ActiveViewIndex = 0;
                LoadViewCategory();
            }
        }

        protected void LoadViewAddDelateCatagory()
        {
            LoadCatagory();
        }

        protected void LoadViewCategory()
        {
            LoadCatagory();
        }

        protected void LoadViewAuthor()
        {
            LoadAuthor();
        }

        protected void LoadCatagory()
        {
            var catagory = new MySQLDatabase().Query("GetAllCategory", new Dictionary<string, object> { }, true);
            ddlCategory.DataSource = catagory.Select(x => new
            {
                T = x["catagoty_name"],
                V = x["id"]
            }).ToList();
            ddlCategory.DataTextField = "T";
            ddlCategory.DataValueField = "V";
            ddlCategory.DataBind();
            ddlDelateCategory.DataSource = catagory.Select(x => new
            {
                T = x["catagoty_name"],
                V = x["id"]
            }).ToList();
            ddlDelateCategory.DataTextField = "T";
            ddlDelateCategory.DataValueField = "V";
            ddlDelateCategory.DataBind();
        }

        protected void LoadAuthor()
        {
            var catagory = new MySQLDatabase().Query("GetAllAuthor", new Dictionary<string, object> { }, true);
            ddlAuthor.DataSource = catagory.Select(x => new
            {
                T = x["first_name"] + " " + x["last_name"],
                V = x["id"]
            }).ToList();
            ddlAuthor.DataTextField = "T";
            ddlAuthor.DataValueField = "V";
            ddlAuthor.DataBind();
            ddlDelateAuthor.DataSource = catagory.Select(x => new
            {
                T = x["first_name"] + " " + x["last_name"],
                V = x["id"]
            }).ToList();
            ddlDelateAuthor.DataTextField = "T";
            ddlDelateAuthor.DataValueField = "V";
            ddlDelateAuthor.DataBind();
        }

        protected void btnCatagoryAddSuccess_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("AddNewCatagory",
                new Dictionary<string, object>
                {
                    {"@name", txtCategoryName.Text }
                }, true);
            LoadViewAddDelateCatagory();
        }

        protected void btnCategoryDelate_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("DelateCatagoryByCID",
                new Dictionary<string, object>
                {
                    {"@cid", ddlDelateCategory.SelectedValue }
                }, true);
            LoadViewAddDelateCatagory();
        }

        protected void btnBackCatagory_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 0;
        }

        protected void btnAddDeleteCatagory_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 4;
        }

        protected void btnCategoryNext_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 1;
        }

        protected void btnBookDetailPrevious_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 0;
        }

        protected void btnBookDetailNext_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var bookNumber = data.QueryValue("GetBookNumber",
                new Dictionary<string, object>
                {
                    {"@bNum", txtBookNumber.Text }
                }, true);
            if(bookNumber == null)
            {
                multiView1.ActiveViewIndex = 2;
                LoadViewAuthor();
            }
            else
            {
                lblWarnnig.Visible = true;
            }
        }

        protected void btnAuthorPrevious_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 1;
        }

        protected void btnAddDelateAuthor_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 5;
        }

        protected void btnAddAuthor_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("AddNewAuthor",
                new Dictionary<string, object>
                {
                    {"@fName", txtFirstName.Text },
                    {"@lName", txtLastName.Text }
                }, true);
            LoadViewAuthor();
        }

        protected void btnDelateAuthor_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("DelateAuthorByAid",
                new Dictionary<string, object>
                {
                    {"@aid", ddlDelateAuthor.SelectedValue }
                }, true);
            LoadViewAuthor();
        }

        protected void btnBackAuthor_Click(object sender, EventArgs e)
        {
            multiView1.ActiveViewIndex = 2;
        }

        protected void BtnAuthorFinish_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            data.Execute("AddNewBook",
                new Dictionary<string, object>
                {
                        {"@bNum", txtBookNumber.Text },
                        {"@bTitle", txtBookTitle.Text },
                        {"@bPrice", txtBookPrice.Text },
                        {"@bLan", txtBookLanguage.Text },
                        {"@bEdi", txtBookEdition.Text }
                }, true);
            var lastBoookId = data.QueryValue("GetLastInsertedBookId", new Dictionary<string, object> { }, true);
            data.Execute("AddBookCatagory",
                new Dictionary<string, object>
                {
                        {"@bid", lastBoookId },
                        {"@cid", ddlCategory.SelectedValue }
                }, true);
            data.Execute("AddBookAuthor",
                new Dictionary<string, object>
                {
                        {"@bid", lastBoookId },
                        {"@aid", ddlAuthor.SelectedValue }
                }, true);
            multiView1.ActiveViewIndex = 3;

        }

        protected void btnAddNewBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian/Add_New_Book");
        }
    }
}