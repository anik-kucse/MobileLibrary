using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class Member_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAccountDetail();
                LoadGvBooks();
            }
        }

        protected void LoadAccountDetail()
        {
            var data = new MySQLDatabase();
            var uid = Request.QueryString["UserId"];
            var detail = data.Query("GetMemberDetailByUid",
                new Dictionary<string, object>
                {
                    {"@uid", uid }
                }, true);

            foreach (var a1 in detail)
            {
                foreach (var a2 in a1)
                {
                    if (a2.Key == "UserName")
                        txtUserName.Text = a2.Value;
                    else if (a2.Key == "firstname")
                        txtFirstname.Text = a2.Value;
                    else if (a2.Key == "lastname")
                        txtLastname.Text = a2.Value;
                    else if (a2.Key == "father_name")
                        txtFatherName.Text = a2.Value;
                    else if (a2.Key == "mother_name")
                        txtMotherName.Text = a2.Value;
                    else if (a2.Key == "Email")
                        txtEmail.Text = a2.Value;
                    else if (a2.Key == "PhoneNumber")
                        txtPhoneNumber.Text = a2.Value;
                    else if (a2.Key == "sex")
                        txtGender.Text = a2.Value;
                    else if (a2.Key == "current_address")
                        txtCurrentAddress.Text = a2.Value;
                    else if (a2.Key == "parmanent_address")
                        txtParmanetAddress.Text = a2.Value;
                    else if (a2.Key == "date_of_birth")
                        txtBirthDay.Text = Convert.ToDateTime(a2.Value).ToString("yyyy-MM-dd");
                    else if (a2.Key == "education")
                        txtEducation.Text = a2.Value;
                    else if (a2.Key == "blood_group")
                        txtBloodGroup.Text = a2.Value;
                    else if (a2.Key == "member_number")
                        txtMemberId.Text = a2.Value;
                    else if (a2.Key == "occupation")
                        txtOccupation.Text = a2.Value;
                    else if (a2.Key == "date_registered")
                        txtDateRegistered.Text = Convert.ToDateTime(a2.Value).ToString("yyyy-MM-dd");
                    else if (a2.Key == "type")
                        txtMembertype.Text = a2.Value;
                }
            }

        }
        
        protected void LoadGvBooks()
        {
            var uid = Request.QueryString["UserId"];
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