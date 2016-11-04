using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// For Report Export
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Data;
using System.Windows.Forms;

namespace HONK.Reports
{
    public partial class ContestantScoresPalua_WUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetDateParameter(DateTime.Now);
            }
        }

        public void Refresh()
        {
            ContestantScorePaluaRV.LocalReport.Refresh();
        }

        public void SetDateParameter(DateTime date)
        {
            ContestantScoreDetails.WhereParameters["entry_date"].DefaultValue = date.ToShortDateString();
        }

        public void DownloadReport(string entry_year, int contestant_id)
        {
            // Get Contestant name for Report name
            string cName = string.Empty;
            using (HONKDBDataContext db = new HONKDBDataContext())
            {
                cName = (from c in db.Contestants
                         where c.id == contestant_id
                         select c.full_name).FirstOrDefault().ToString();
            }

            using (LocalReport viewer = new LocalReport())
            {
                // Create Implementation Schedule Dataset Table Adapters
                ContestantReportDatasetTableAdapters.vw_ContestantDetailsAllScoresTableAdapter ds = new ContestantReportDatasetTableAdapters.vw_ContestantDetailsAllScoresTableAdapter();

                // Create ReportDataSource using Data Table with param @AssessID
                //ReportDataSource rds = new ReportDataSource("ContestantReportDataset_Tabulation", (DataTable)ds.GetData(entry_year, contestant_id));
                ReportDataSource rds = new ReportDataSource("ContestantReportDataset_Tabulation", (DataTable)ds.GetData(entry_year, contestant_id));

                // Set Report Path and Add Report Datasource to LocalReport
                viewer.ReportPath = @"Reports\ContestantScoresPalua_Report.rdlc";
                viewer.DataSources.Add(rds);

                viewer.EnableHyperlinks = true;
                viewer.Refresh();

                // Variables
                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;

                //byte[] bytes = viewer.Render("Excel", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                byte[] pdfBytes = viewer.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                Page.Response.Buffer = false;
                Page.Response.BufferOutput = false;
                Page.Response.Clear();
                Page.Response.ClearContent();
                Page.Response.ClearHeaders();
                Response.AppendHeader("content-disposition", "attachment; filename=HONK_Contestant_Score_" + DateTime.Parse(entry_year).Year + "_" + cName + ".pdf");
                //Response.ContentType = "application/vnd.xls";
                Response.ContentType = "application/pdf";

                using (MemoryStream ms = new MemoryStream(pdfBytes))
                {
                    ms.Seek(0, SeekOrigin.Begin);
                    var streamBytes = ms.ToArray();
                    Response.BinaryWrite(streamBytes);
                }
                Response.End();
            }
        }
    }
}