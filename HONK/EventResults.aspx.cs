using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class EventResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //EntryYearTb.Text = DateTime.Now.Year.ToString();
        }

        protected void EntryYearTb_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(EntryYearTb.Text))
            {
            }
            else
            {
            }
        }

        protected void viewMaster_Click(object sender, EventArgs e)
        {

        }
    }
}