using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class NotApproveMemberDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAll();
                txtWarrningMemberId.Visible = false;
            }
        }

        protected void LoadAll()
        {
            var uid = Request.QueryString["UserId"];
            var detail = new MySQLDatabase().Query("GetMemberDetailByUid",
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
                        ddlGender.Text = a2.Value;
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
                        ddlMembertype.Text = a2.Value;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            var uid = Request.QueryString["UserId"];
            new MySQLDatabase().Execute("UpdateMemberDetailByUid",
                new Dictionary<string, object>
                {
                    {"@uid", uid },
                    {"@fName", txtFirstname.Text },
                    {"@lName", txtLastname.Text },
                    {"@FaName", txtFatherName.Text },
                    {"@MaName", txtMotherName.Text },
                    {"@email", txtEmail.Text },
                    {"@phone", txtPhoneNumber.Text },
                    {"@sex", ddlGender.SelectedValue },
                    {"@cAdd", txtCurrentAddress.Text },
                    {"@pAdd", txtParmanetAddress.Text },
                    {"@bDate", Convert.ToDateTime(txtBirthDay.Text) },
                    {"@education", txtEducation.Text },
                    {"@blood", txtBloodGroup.Text },
                    {"@mid", txtMemberId.Text },
                    {"@occ", txtOccupation.Text },
                    {"@rDate", Convert.ToDateTime(txtDateRegistered.Text) },
                    {"@mType", ddlMembertype.SelectedValue }
                },true);
            new MySQLDatabase().Execute("UpdateMemberDetail2ByUid",
                new Dictionary<string, object>
                {
                    {"@uid", uid },
                    {"@mid", txtMemberId.Text },
                    {"@occ", txtOccupation.Text },
                    {"@rDate", Convert.ToDateTime(txtDateRegistered.Text) },
                    {"@mType", ddlMembertype.SelectedValue }
                }, true);
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            var uid = Request.QueryString["UserId"];
            var ex = new MySQLDatabase().QueryValue("GetMemberNumber",
                new Dictionary<string, object>
                {
                    {"@mnum", txtMemberId.Text }
                }, true);
            if (ex == null)
            {
                new MySQLDatabase().Execute("ApprovedByUid",
                new Dictionary<string, object>
                {
                    {"@uid", uid },
                    {"@isApp", 1 },
                    {"@mNum", txtMemberId.Text }
                }, true);
                Response.Redirect("~/Librarian/ApproveMembers");
            }
            else
            {
                txtWarrningMemberId.Visible = true;
            }
        }
    }
}