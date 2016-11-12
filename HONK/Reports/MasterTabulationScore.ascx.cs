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
    public partial class MasterTabulationScore : System.Web.UI.UserControl
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
            MasterTabScoreRV.LocalReport.Refresh();
        }

        public void SetDateParameter(DateTime date)
        {
            MasterScoreDetailsDS.WhereParameters["entry_date"].DefaultValue = date.ToShortDateString();
            MasterScorePaluaDetailsDS.WhereParameters["entry_date"].DefaultValue = date.ToShortDateString();
        }

        public void DownloadReport(string entry_year)
        {
            using (LocalReport viewer = new LocalReport())
            {
                // Create Implementation Schedule Dataset Table Adapters
                MasterReportDatasetTableAdapters.vw_MasterScoreDetailsTableAdapter ds = new MasterReportDatasetTableAdapters.vw_MasterScoreDetailsTableAdapter();
                MasterReportDatasetTableAdapters.vw_MasterScoreDetails_PaluaTableAdapter ds2 = new MasterReportDatasetTableAdapters.vw_MasterScoreDetails_PaluaTableAdapter();

                // Create ReportDataSource using Data Table with param @AssessID
                ReportDataSource rds = new ReportDataSource("MasterReportDataset_Tabulation", (DataTable)ds.GetData(entry_year));
                ReportDataSource rds2 = new ReportDataSource("MasterReportPaluaDataset_Tabulation", (DataTable)ds2.GetData(entry_year));

                // Set Report Path and Add Report Datasource to LocalReport
                viewer.ReportPath = @"Reports\MasterTabulationScore.rdlc";
                viewer.DataSources.Add(rds);
                viewer.DataSources.Add(rds2);

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

                // CREATE DIRECTORY AND SAVE TO DESKTOP\ROAR_Exports
                //string filePath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\ROAR_Exports\";

                //if (!Directory.Exists(filePath))
                //{
                //    Directory.CreateDirectory(filePath);
                //}

                //FileStream fs = new FileStream(filePath + TaxonName + "_" + System.DateTime.Now.ToString("yyyy_MM_dd") + ".xls", FileMode.Create);
                //fs.Write(bytes, 0, bytes.Length);
                //fs.Close();

                Page.Response.Buffer = false;
                Page.Response.BufferOutput = false;
                Page.Response.Clear();
                Page.Response.ClearContent();
                Page.Response.ClearHeaders();
                Response.AppendHeader("content-disposition", "attachment; filename= HONK_Master_Tabulation_Scoresheet_" + DateTime.Parse(entry_year).Year + ".pdf");
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