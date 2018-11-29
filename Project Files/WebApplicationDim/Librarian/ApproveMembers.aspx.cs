using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class ApproveMembers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridview();
            }
        }

        protected void LoadGridview()
        {
            var data = new MySQLDatabase();
            if (ddlMemberType.SelectedValue == "1")
            {
                gvNotApprovedMember.Visible = false;
                gvApprovedMembers.Visible = true;
                var members = data.Query("GetAllApprovedMember",
                    new Dictionary<string, object> { }, true);
                gvApprovedMembers.DataSource = members.Select(x => new
                {
                    uid = x["Id"],
                    memberNumber = x["member_number"],
                    userName = x["UserName"],
                    email = x["Email"],
                    phone = x["PhoneNumber"],
                    memberType = x["type"],
                    DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                }).ToList();
                gvApprovedMembers.DataBind();
            }
            else
            {
                gvApprovedMembers.Visible = false;
                gvNotApprovedMember.Visible = true;
                var members = data.Query("GetAllNotApprovedMemmbers", new Dictionary<string, object> { }, true);

                gvNotApprovedMember.DataSource = members.Select(x => new
                {
                    uid = x["Id"],
                    userName = x["UserName"],
                    email = x["Email"],
                    phone = x["PhoneNumber"],
                    memberType = x["type"],
                    DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                }).ToList();
                gvNotApprovedMember.DataBind();

            }
        }

        protected void gvApprovedMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvApprovedMembers.PageIndex = e.NewPageIndex;
            LoadGridview();
        }

        protected void gvNotApprovedMember_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNotApprovedMember.PageIndex = e.NewPageIndex;
            LoadGridview();
        }

        protected void ddlMemberType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGridview();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var data = new MySQLDatabase();
            var value = ddlSearchBy.SelectedValue;
            if (ddlMemberType.SelectedValue == "1")
            {
                gvNotApprovedMember.Visible = false;
                gvApprovedMembers.Visible = true;

                if (value == "1")
                {
                    var members = data.Query("SearchByMemberNumForApproved", new Dictionary<string, object> { {"@mNum", txtSerach.Text } }, true);
                    gvApprovedMembers.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        memberNumber = x["member_number"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvApprovedMembers.DataBind();
                }
                else if (value == "2")
                {
                    var members = data.Query("SearchByUserNameForApproved", new Dictionary<string, object> { {"@uName", txtSerach.Text } }, true);
                    gvApprovedMembers.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        memberNumber = x["member_number"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvApprovedMembers.DataBind();
                }
                else if (value == "3")
                {
                    var members = data.Query("SearchByEmailForApproved", new Dictionary<string, object> { { "@mail", txtSerach.Text } }, true);
                    gvApprovedMembers.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        memberNumber = x["member_number"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvApprovedMembers.DataBind();
                }
                else if (value == "4")
                {
                    var members = data.Query("SearchByPhoneForApproved", new Dictionary<string, object> { { "@num", txtSerach.Text } }, true);
                    gvApprovedMembers.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        memberNumber = x["member_number"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvApprovedMembers.DataBind();
                }
            }
            else if (ddlMemberType.SelectedValue == "2")
            {
                gvApprovedMembers.Visible = false;
                gvNotApprovedMember.Visible = true;
                if (value == "1")
                {
                    var members = data.Query("SearchByMemberNumForNotApproved", new Dictionary<string, object> { { "@mNum", txtSerach.Text } }, true);

                    gvNotApprovedMember.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvNotApprovedMember.DataBind();
                }
                else if (value == "2")
                {
                    var members = data.Query("SearchByUserNameForNotApproved", new Dictionary<string, object> { { "@uName", txtSerach.Text } }, true);

                    gvNotApprovedMember.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvNotApprovedMember.DataBind();
                }
                else if (value == "3")
                {
                    var members = data.Query("SearchByEmailForNotApproved", new Dictionary<string, object> { { "@mail", txtSerach.Text } }, true);

                    gvNotApprovedMember.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvNotApprovedMember.DataBind();
                }
                else if (value == "4")
                {
                    var members = data.Query("SearchByPhoneForNotApproved", new Dictionary<string, object> { { "@num", txtSerach.Text } }, true);

                    gvNotApprovedMember.DataSource = members.Select(x => new
                    {
                        uid = x["Id"],
                        userName = x["UserName"],
                        email = x["Email"],
                        phone = x["PhoneNumber"],
                        memberType = x["type"],
                        DateRegister = Convert.ToDateTime(x["date_registered"]).ToString("dd-MM-yyyy"),
                    }).ToList();
                    gvNotApprovedMember.DataBind();
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnkBtn.NamingContainer;
            HiddenField hf = (HiddenField)row.FindControl("hfUid");
            Response.Redirect("~/Librarian/NotApproveMemberDetail.aspx?UserId=" + hf.Value);
        }

        protected void btnDetail_Click(object sender, EventArgs e)
        {
            LinkButton lnkBtn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnkBtn.NamingContainer;
            HiddenField hf = (HiddenField)row.FindControl("hfUid");
            Response.Redirect("~/Librarian/Approved_Member_detail.aspx?UserId=" + hf.Value);
        }
    }
}