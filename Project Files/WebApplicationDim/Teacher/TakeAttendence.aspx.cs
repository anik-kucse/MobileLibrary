using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Teacher
{
    public partial class TakeAttendence : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCorurse();
                Calendar1.Visible = false;
                Calendar1.SelectedDate = DateTime.Now.Date;
                bindGridView();
            }
        }

        protected void LoadCorurse()
        {
            var course = new MySQLDatabase().Query("GetAllCourselListByUserId",
                new Dictionary<string, object>
                {
                    {"@uid", User.Identity.GetUserId() }
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            bindGridView();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
            }

        }

        protected void Calendar1Button_Click(object sender, ImageClickEventArgs e)
        {

            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
                bindGridView();
            }
            else
            {
                Calendar1.Visible = true;
                bindGridView();
            }
        }

        protected void bindGridView()
        {
            MySQLDatabase data = new MySQLDatabase();
            var courseName = data.Query("GetAllCourselListByUserId",
                new Dictionary<string, object>
                {
                    {"@uid", User.Identity.GetUserId()}
                }, true);
            var count = from x in courseName
                        let v = data.Query("GetStudentCourseIdByTCID",
                        new Dictionary<string, object>
                        {
                            {"@tcid", x["id"] }
                        }, true)
                        select new
                        {
                            Courses = x["prefix"] + " " + x["course_no"]
                            + " " + x["course_tittle"] + " " + x["postfix"] +
                            " (" + x["session"] + ")",
                            Students = v.Count.ToString(),
                            Status = (x["isclosed"].ToString() == "True") ? "Close" : "Open"
                        };
            gvTakeAttendence.DataSource = count.ToList();
            gvTakeAttendence.DataBind();
        }

        protected void gvTakeAttendence_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                int i = 2;
                foreach(DateTime selectedDateTime in Calendar1.SelectedDates)
                {
                    e.Row.Cells[i].Text = selectedDateTime.ToString("dd");
                    i++;
                }

                for(int j=i; j<9; j++)
                {
                    e.Row.RowIndex[j].visible = false;
                }
                
            }
        }
    }
}