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
            else
            {
                RefreshReports();
            }
        }

        /// <summary>
        /// Parses year string
        /// </summary>
        /// <param name="date"></param>
        /// <returns>DateTime</returns>
        private DateTime ParseDate(string date)
        {
            DateTime newDate;

            if (String.IsNullOrEmpty(date)) { newDate = DateTime.Now; }
            else { DateTime.TryParse("01/01/" + date, out newDate); }

            return newDate;
        }

        /// <summary>
        /// Parses the selected event year and passes this information to the whereparameters of the reports.
        /// </summary>
        private void RefreshReports()
        {
            MasterTabulationScore.SetDateParameter(ParseDate(EntryYearTb.Text));
            ConstestantScoresReport.SetDateParameter(ParseDate(EntryYearTb.Text));
            ConstestantScoresPaluaReport.SetDateParameter(ParseDate(EntryYearTb.Text));

            MasterTabulationScore.Refresh();
            ConstestantScoresReport.Refresh();
            ConstestantScoresPaluaReport.Refresh();
        }

        protected void EntryYearTb_TextChanged(object sender, EventArgs e)
        {
            RefreshReports();
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

        protected void exportMasterTab_Click(object sender, EventArgs e)
        {

            LinkButton lb = (LinkButton)sender;
            if (lb.ID == "exportMasterTab")
            {
                MasterTabulationScore.DownloadReport(ParseDate(EntryYearTb.Text).ToShortDateString());
            
            }
            else if (lb.ID == "exportCTab")
            {
                //ConstestantScoresReport.DownloadReport(ParseDate(EntryYearTb.Text).ToShortDateString(), null);
            
            }
            else if (lb.ID == "exportCPaluaTab")
            {
                //ConstestantScoresReport.DownloadReport(ParseDate(EntryYearTb.Text).ToShortDateString(), Convert.ToInt32(e.CommandArgument));

            }
        }
    }
}