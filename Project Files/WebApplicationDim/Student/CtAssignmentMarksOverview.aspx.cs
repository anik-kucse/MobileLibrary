using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Student
{
    public partial class CtAssignmentMarksOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                logInSecurity();
                LoadDdlCourse();
                LoadGvCtAss();
            }
        }

        protected void logInSecurity()
        {
            if (User.IsInRole("Teacher"))
            {
                Response.Redirect("http://localhost:55822/Teacher/Dashboard");
            }
            else if (User.IsInRole("Student"))
            {

            }
            else
            {
                Response.Redirect("http://localhost:55822/Account/Login");
            }
        }

        protected void LoadDdlCourse()
        {
            var data = new MySQLDatabase();

            var sid = data.Query("GetStudentTableIdByUserId",
                new Dictionary<string, object>
                {
                     {"@uid", User.Identity.GetUserId() }
                }, true);
            var a = sid.First()["id"];
            var course = data.Query("GetAllCTitleSessionBySID",
                 new Dictionary<string, object>
                 {
                    {"@sid", a}
                 }, true);
            ddlSelectCourse.DataSource = course.Select(x => new
            {
                t = x["prefix"] + " " + x["course_no"] + " " + x["course_tittle"] + " " + x["postfix"] + " (" + x["session"] + ")",
                v = x["id"]
            }).ToList();
            ddlSelectCourse.DataTextField = "t";
            ddlSelectCourse.DataValueField = "v";
            ddlSelectCourse.DataBind();
        }

        protected void ddlSelectCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGvCtAss();
        }

        protected void LoadGvCtAss()
        {
            var data = new MySQLDatabase();

            var sid = data.Query("GetStudentTableIdByUserId",
                new Dictionary<string, object>
                {
                     {"@uid", User.Identity.GetUserId() }
                }, true);
            var a = sid.First()["id"];

            var table = data.Query("GetAllCtAssNameMarkByTcidSid",
                new Dictionary<string, object>
                {
                    {"@tcid", ddlSelectCourse.SelectedValue },
                    {"@sid", a }
                }, true);
            gvCtAss.DataSource = table.Select(x => new
            {
                Name = x["name"],
                Marks = x["mark"]
            }).ToList();
            gvCtAss.DataBind();
        }

        protected void gvCtAss_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell cell = e.Row.Cells[1];
                var marks = cell.Text;
                if (marks == "&nbsp;")
                {
                    cell.Text = "Not evaluated yet";
                    cell.ForeColor = Color.Red;
                }
            }
        }
    }
}