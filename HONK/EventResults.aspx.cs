using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace HONK
{
    public partial class EventResults : System.Web.UI.Page
    {
        HONKDBDataContext db = new HONKDBDataContext();

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

            MasterGV.DataBind();
            KeikiKaneGV.DataBind();
            KeikiWahineGV.DataBind();
            OpioKaneGV.DataBind();
            OpioWahineGV.DataBind();
            CostumeOpioGV.DataBind();
            CostumeKeikiGV.DataBind();
            CostumePaluaGV.DataBind();
            PaluaGV.DataBind();
        }

        protected void MasterDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                orderby ms.overall_score descending
                                select ms;

            e.Result = event_results;
        }

        protected void KeikiKaneDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.division_name == "Keiki Kane"
                                orderby ms.combined_hula_score descending
                                select ms;

            e.Result = event_results;
        }

        protected void KeikiWahineDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.division_name == "Keiki Wahine"
                                orderby ms.combined_hula_score descending
                                select ms;

            e.Result = event_results;
        }

        protected void OpioKaneDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.division_name == "'Opio Kane"
                                orderby ms.combined_hula_score descending
                                select ms;

            e.Result = event_results;
        }

        protected void OpioWahineDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.division_name == "'Opio Wahine"
                                orderby ms.combined_hula_score descending
                                select ms;

            e.Result = event_results;
        }

        protected void CostumeDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

        }

        protected void PaluaDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.gender_name == "Palua"
                                orderby ms.overall_score descending
                                select ms;

            e.Result = event_results;
        }
        // EVENT RESULTS ACCESSORS
        private DateTime EventDate
        {
            get
            {
                DateTime date;

                if (String.IsNullOrEmpty(EntryYearTb.Text)) { date = DateTime.Now; }
                else { DateTime.TryParse("01/01/" + EntryYearTb.Text, out date); }

                return date;
            }
        }

        protected void CostumeOpioDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.age_name == "'Opio"
                                && ms.gender_name != "Palua"
                                orderby ms.costume_auana descending
                                select ms;

            e.Result = event_results;
        }

        protected void CostumeKeikiDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.age_name == "Keiki"
                                && ms.gender_name != "Palua"
                                orderby ms.costume_auana descending
                                select ms;

            e.Result = event_results;
        }

        protected void CostumePaluaDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var event_results = from ms in db.vw_MasterScoreDetails
                                where ms.entry_date.Year == EventDate.Year
                                && ms.gender_name == "Palua"
                                orderby ms.costume_palua descending
                                select ms;

            e.Result = event_results;
        }

        #region REPORTING METHOD(S)

        #endregion

        protected void MasterGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PDF")
            {
                ConstestantScoresReport.DownloadReport(EventDate.ToShortDateString(), Convert.ToInt32(e.CommandArgument));
            }
            else if (e.CommandName == "PDF_Palua")
            {
                ConstestantScoresPaluaReport.DownloadReport(EventDate.ToShortDateString(), Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void MasterGV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if e.Row is a DataRow; if so grab the Datakey for the row
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                vw_MasterScoreDetail con = (vw_MasterScoreDetail)e.Row.DataItem;      //grab the GridViewRowEventArg and cast to row's type vw_MasterScoreDetail
                int conId = Convert.ToInt32(con.id);              //grab the contestant id for the particular row

                HONKDBDataContext db = new HONKDBDataContext();

                var contestant = (from c in db.Contestants
                                where c.id == conId
                                select c).FirstOrDefault();   //returns the contestant record
                
                // Hides export button if gender is Palua. Will need a different report.
                if(contestant.Gender.name == "Palua")
                {
                    LinkButton downloadLB = (LinkButton)e.Row.FindControl("DownloadLB");
                    downloadLB.Visible = false;

                    LinkButton downloadPaluaLB = (LinkButton)e.Row.FindControl("DownloadPaluaLB");
                    downloadPaluaLB.Visible = true;
                }

                // Script Manager needed to asyncronously handle report viewer export
                //ScriptManager scriptManager = ScriptManager.GetCurrent(this.Page);
                //scriptManager.RegisterPostBackControl((LinkButton)e.Row.FindControl("DownloadLB"));
            }
        }
    }
}