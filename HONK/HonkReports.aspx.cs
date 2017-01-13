using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class HonkReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                EntryYearTb.Text = DateTime.Now.Year.ToString();
            }
        }


        protected void EntryYearTb_TextChanged(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(EntryYearTb.Text))
            {
                EntryYearTb.Text = DateTime.Now.Year.ToString();
            }
        }

        /// <summary>
        /// Refreshes reports once the page has loaded all controls. Resolves issue with Object not set to a reference
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Prerender(object sender, EventArgs e)
        {
            ConstestantScoresReport.Refresh();
            ConstestantScoresPaluaReport.Refresh();
        }
    }
}