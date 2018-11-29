using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationDim
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGvShedule();
        }

        protected void LoadGvShedule()
        {
            var schedule = new MySQLDatabase().Query("GetAllSchedule",
                new Dictionary<string, object> { }, true);
            gvShedule.DataSource = schedule.Select(x => new
            {
                day = x["day"],
                area = x["place_name"],
                address = x["place_address"],
                time = x["arrive_time"] + " - " + x["leave_time"]
            }).ToList();
            gvShedule.DataBind();
        }
    }
}