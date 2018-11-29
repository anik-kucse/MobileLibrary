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
    public partial class Librarian_manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAccountDetail();
            }
        }

        protected void LoadAccountDetail()
        {
            var data = new MySQLDatabase();

            var detail = data.Query("GetUserDetailsByUid",
                new Dictionary<string, object>
                {
                    {"@uid", User.Identity.GetUserId() }
                }, true);

            foreach (var a1 in detail)
            {
                foreach (var a2 in a1)
                {
                    if (a2.Key == "UserName")
                        UserName.Text = a2.Value;
                    else if (a2.Key == "firstname")
                        Firstname.Text = a2.Value;
                    else if (a2.Key == "lastname")
                        Lastname.Text = a2.Value;
                    else if (a2.Key == "father_name")
                        FatherName.Text = a2.Value;
                    else if (a2.Key == "mother_name")
                        MotherName.Text = a2.Value;
                    else if (a2.Key == "Email")
                        Email.Text = a2.Value;
                    else if (a2.Key == "PhoneNumber")
                        PhoneNumber.Text = a2.Value;
                    else if (a2.Key == "sex")
                        Sex.Text = a2.Value;
                    else if (a2.Key == "current_address")
                        CurrentAddress.Text = a2.Value;
                    else if (a2.Key == "parmanent_address")
                        ParmanetAddress.Text = a2.Value;
                    else if (a2.Key == "date_of_birth")
                        BirthDay.Text = Convert.ToDateTime(a2.Value).ToString("yyyy-MM-dd");
                    else if (a2.Key == "education")
                        Education.Text = a2.Value;
                    else if (a2.Key == "blood_group")
                        BloodGroup.Text = a2.Value;
                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("UpdateUserLibrarianByUid",
                new Dictionary<string, object>
                {
                    {"@uid", User.Identity.GetUserId() },
                    {"@fName", Firstname.Text },
                    {"@lName", Lastname.Text },
                    {"@FaName", FatherName.Text },
                    {"@MaName", MotherName.Text },
                    {"@email", Email.Text },
                    {"@phone", PhoneNumber.Text },
                    {"@sex", Sex.SelectedValue },
                    {"@cAdd", CurrentAddress.Text },
                    {"@pAdd", ParmanetAddress.Text },
                    {"@bDate", Convert.ToDateTime(BirthDay.Text) },
                    {"@education", Education.Text },
                    {"@blood", BloodGroup.Text }
                },true);
        }
    }
}