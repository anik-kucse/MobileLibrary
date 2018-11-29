using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim.Librarian
{
    public partial class ManageSheduleFees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                successMsg.Visible = false;
                LoadGvShedule();
                LoadGvFees();
            }
        }

        protected void LoadGvShedule()
        {
            var schedule = new MySQLDatabase().Query("GetAllSchedule",
                new Dictionary<string, object> { }, true);
            gvShedule.DataSource = schedule.Select(x => new
            {
                sheduleId = x["id"],
                day = x["day"],
                area = x["place_name"],
                address = x["place_address"],
                time = x["arrive_time"] + " - " + x["leave_time"]
            }).ToList();
            gvShedule.DataBind();
        }

        protected void AddShedule_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("AddNewSchedule",
                new Dictionary<string, object>
                {
                    {"@day", ddlDays.SelectedValue},
                    {"@place_name", placeName.Text },
                    {"@place_address", placeAddress.Text },
                    {"@arr_time", Convert.ToDateTime(arriveTime.Text) },
                    {"@lea_time", Convert.ToDateTime(leaveTime.Text) }
                }, true);
            successMsg.Visible = true;
            LoadGvShedule();
        }

        protected void cbSelecteAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectAll = (CheckBox)sender;
            foreach (GridViewRow gridViewRow in this.gvShedule.Rows)
            {
                CheckBox selectOne = (CheckBox)gridViewRow.FindControl("cbSelected");
                selectOne.Checked = selectAll.Checked;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in this.gvShedule.Rows)
            {
                CheckBox cb = (CheckBox)gridViewRow.FindControl("cbSelected");
                HiddenField id = (HiddenField)gridViewRow.FindControl("hfSchedulId");
                if(cb.Checked == true)
                {
                    new MySQLDatabase().Execute("DeleteSchedule",
                        new Dictionary<string, object>
                        {
                            {"@id", Convert.ToInt32(id.Value) }
                        }, true);
                }
                LoadGvShedule();
            }
        }

        protected void gvShedule_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvShedule.PageIndex = e.NewPageIndex;
            LoadGvShedule();

        }

        protected void LoadGvFees()
        {
            var data = new MySQLDatabase().Query("GetAllFees",
                new Dictionary<string, object>{ }, true);
            gvFees.DataSource = data.Select(x => new
            {
                feeId = x["id"],
                type = x["fee_type"],
                bdt = x["amount"]
            }).ToList();
            gvFees.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in this.gvFees.Rows) 
            {
                HiddenField id = (HiddenField)gridViewRow.FindControl("hfFeeId");
                TextBox type = (TextBox)gridViewRow.FindControl("txtFeeType");
                TextBox bdt = (TextBox)gridViewRow.FindControl("txtBdt");

                new MySQLDatabase().Execute("UpdateFees",
                    new Dictionary<string, object>
                    {
                        {"@id", Convert.ToInt32(id.Value) },
                        {"@type", type.Text },
                        {"@bdt", Convert.ToInt32(bdt.Text) }
                    }, true);
            }
            LoadGvFees();
        }

        protected void btnFeeAdd_Click(object sender, EventArgs e)
        {
            new MySQLDatabase().Execute("AddNewFee",
                new Dictionary<string, object>
                {
                    {"@type", "type" },
                    {"@bdt", 0 }
                }, true);
            LoadGvFees();
        }

        protected void btnFeeDelete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in this.gvFees.Rows)
            {
                CheckBox cb = (CheckBox)gridViewRow.FindControl("Selected");
                HiddenField id = (HiddenField)gridViewRow.FindControl("hfFeeId");
                if (cb.Checked == true)
                {
                    new MySQLDatabase().Execute("DeleteFees",
                        new Dictionary<string, object>
                        {
                            {"@id", Convert.ToInt32(id.Value) }
                        }, true);
                }
            }
            LoadGvFees();
        }

        protected void SelecteAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox selectAll = (CheckBox)sender;
            foreach (GridViewRow gridViewRow in this.gvFees.Rows)
            {
                CheckBox selectOne = (CheckBox)gridViewRow.FindControl("Selected");
                selectOne.Checked = selectAll.Checked;
            }
        }
    }
}