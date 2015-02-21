using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace HONK
{
    public partial class ContestantScores : System.Web.UI.Page
    {
        HONKDBDataContext db = new HONKDBDataContext();
        protected static int EventYear = DateTime.Now.AddYears(-1).Year;

        protected void Page_PreRender(object sender, EventArgs e)
        {
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ContestantDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(((DropDownList)sender).SelectedValue))
            {
                // Counter for iterating through Textbox Controls
                int i = 1;

                int contestant_id = Convert.ToInt32(((DropDownList)sender).SelectedValue);

                var contestant = from c in db.vw_ContestantJudgeScores
                                 where c.id == contestant_id
                                 //where c.entry_date.Year == EventYear
                                 select c;

                // INSERT Contestant_JudgeScores w/ NULL VALUES
                if (contestant.Count() == 0) HelperMethods.InsertJudgeScores(contestant_id);

                // Initialize Contestant Formviews
                ContestantScoresFV.ChangeMode(FormViewMode.Edit);
                ContestantScoresFV.DataBind();

                ContestantMasterScoreFV.DataBind();

                //Check if Gender Name is Palua
                if (HelperMethods.IsPalua(contestant_id))
                {
                    // Hide Sections which does not pertain to Palua
                    ContestantScoresFV.FindControl("isNotPalua").Visible = false;
                    ContestantMasterScoreFV.FindControl("isNotPaluaMS").Visible = false;

                    // Show Palua Form Section
                    ContestantScoresFV.FindControl("isPalua").Visible = true;
                    ContestantMasterScoreFV.FindControl("isPaluaMS").Visible = true;

                    foreach (var c in contestant)
                    {
                        if (i < 7)
                        {
                            ((TextBox)ContestantScoresFV.FindControl("judgeHulaP" + i)).Text = String.IsNullOrEmpty(c.hula_palua.ToString()) ? "" : c.hula_palua.ToString();
                            ((TextBox)ContestantScoresFV.FindControl("judgeCostumeP" + i)).Text = String.IsNullOrEmpty(c.costume_palua.ToString()) ? "" : c.costume_palua.ToString();
                        }
                        else
                        {
                            break;
                        }
                        i++;
                    }
                }
                // Gender Name is NOT Palua
                else
                {
                    foreach (var c in contestant)
                    {
                        ((TextBox)ContestantScoresFV.FindControl("judgeInterview" + i)).Text = String.IsNullOrEmpty(c.interview.ToString()) ? "" : c.interview.ToString();
                        if (i == 7)
                        {
                            continue;
                        }
                        else
                        {
                            ((TextBox)ContestantScoresFV.FindControl("judgeCostumeA" + i)).Text = String.IsNullOrEmpty(c.costume_auana.ToString()) ? "" : c.costume_auana.ToString();
                            ((TextBox)ContestantScoresFV.FindControl("judgeCostumeK" + i)).Text = String.IsNullOrEmpty(c.costume_kahiko.ToString()) ? "" : c.costume_kahiko.ToString();
                            ((TextBox)ContestantScoresFV.FindControl("judgeHulaA" + i)).Text = String.IsNullOrEmpty(c.hula_auana.ToString()) ? "" : c.hula_auana.ToString();
                            ((TextBox)ContestantScoresFV.FindControl("judgeHulaK" + i)).Text = String.IsNullOrEmpty(c.hula_kahiko.ToString()) ? "" : c.hula_kahiko.ToString();
                        }

                        i++;
                    }
                }

                divJudgeScores.Visible = true;
                divMasterScores.Visible = true;
                EntryYearTb.Enabled = false;
                SubmitBtn.Visible = true;
            }
            else
            {
                ContestantScoresFV.ChangeMode(FormViewMode.ReadOnly);
                ContestantMasterScoreFV.ChangeMode(FormViewMode.ReadOnly);

                divJudgeScores.Visible = false;
                divMasterScores.Visible = false;
                EntryYearTb.Enabled = true;
                SubmitBtn.Visible = false;
            }

        }

        protected void ContestantMasterScoreFV_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["contestant_id"] = ContestantDDL.SelectedValue;
        }

        protected void MasterScoresLDS_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            var results = (IEnumerable<object>)e.Result;

            if (results.Count() == 0 && ContestantDDL.SelectedValue != "")
            {
                ContestantMasterScoreFV.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                ContestantMasterScoreFV.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void SubmitBtn_ServerClick(object sender, EventArgs e)
        {
            if (ContestantMasterScoreFV.CurrentMode == FormViewMode.Insert)
            {
                ContestantMasterScoreFV.InsertItem(true);
                ContestantMasterScoreFV.DataBind();
            }
            else if (ContestantMasterScoreFV.CurrentMode == FormViewMode.Edit)
            {
                ContestantMasterScoreFV.UpdateItem(true);
                ContestantMasterScoreFV.DataBind();
            }

            ContestantScoresFV_UpdateItems();

            // Reinitialize Formview by Checking Currently Selected Value on Dropdownlist
            ContestantDDL_SelectedIndexChanged(ContestantDDL, null);
        }
        /// <summary>
        /// Updates JudgeScore table based on ContestantScoreFV Textbox values
        /// </summary>
        private void ContestantScoresFV_UpdateItems()
        {
            int contestant_id = Convert.ToInt32(ContestantDDL.SelectedValue);

            if (HelperMethods.IsPalua(contestant_id))
            {
                for (int judge_id = 1; judge_id < HelperMethods.TotalJudges(); judge_id++)
                {

                    try
                    {
                        string hula_palua = ((TextBox)ContestantScoresFV.FindControl("judgeHulaP" + judge_id)).Text;
                        string costume_palua = ((TextBox)ContestantScoresFV.FindControl("judgeCostumeP" + judge_id)).Text;

                        HelperMethods.UpdateJudgeScore(contestant_id, judge_id, hula_palua, costume_palua);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("{0} Exception caught.", ex);
                    }
                }
            }
            else
            {
                for (int judge_id = 1; judge_id <= HelperMethods.TotalJudges(); judge_id++)
                {

                    if (judge_id == 7)
                    {
                        try
                        {
                            string interview = ((TextBox)ContestantScoresFV.FindControl("judgeInterview" + judge_id)).Text;
                            HelperMethods.UpdateJudgeScore(contestant_id, judge_id, interview);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("{0} Exception caught.", ex);
                        }

                    }
                    else
                    {
                        try
                        {
                            string interview = ((TextBox)ContestantScoresFV.FindControl("judgeInterview" + judge_id)).Text;
                            string costume_auana = ((TextBox)ContestantScoresFV.FindControl("judgeCostumeA" + judge_id)).Text;
                            string costume_kahiko = ((TextBox)ContestantScoresFV.FindControl("judgeCostumeK" + judge_id)).Text;
                            string hula_auana = ((TextBox)ContestantScoresFV.FindControl("judgeHulaA" + judge_id)).Text;
                            string hula_kahiko = ((TextBox)ContestantScoresFV.FindControl("judgeHulaK" + judge_id)).Text;

                            HelperMethods.UpdateJudgeScore(contestant_id, judge_id, interview, costume_auana, costume_kahiko, hula_auana, hula_kahiko);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("{0} Exception caught.", ex);
                        }
                    }
                }
            }


        }

        /// <summary>
        /// Calculates MasterScores; dropping high and low values
        /// Interview: 7 Judges, if needed add 0 or max fillers.
        /// Other Scores: 6 Judges, if needed add 0 or max fillers.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CalculateHiLow_MasterScores(object sender, EventArgs e)
        {
            if (HelperMethods.IsPalua(Convert.ToInt32(ContestantDDL.SelectedValue)))
            {
                ((TextBox)ContestantMasterScoreFV.FindControl("masterHulaP")).Text = GetHiLoSum("judgeHulaP", 6).HasValue ? GetHiLoSum("judgeHulaP", 6).ToString() : "";
                ((TextBox)ContestantMasterScoreFV.FindControl("masterCostumeP")).Text = GetHiLoSum("judgeCostumeP", 6).HasValue ? GetHiLoSum("judgeCostumeP", 6).ToString() : "";

                ((Label)ContestantMasterScoreFV.FindControl("masterHulaPTie")).Text = GetSum("judgeHulaP", 6).HasValue ? GetSum("judgeHulaP", 6).ToString() : "N/A";
                ((Label)ContestantMasterScoreFV.FindControl("masterCostumePTie")).Text = GetSum("judgeCostumeP", 6).HasValue ? GetSum("judgeCostumeP", 6).ToString() : "N/A";
            }
            else
            {
                ((TextBox)ContestantMasterScoreFV.FindControl("masterInterview")).Text = GetHiLoSum("judgeInterview", 7).HasValue ? GetHiLoSum("judgeInterview", 7).ToString() : "";
                ((TextBox)ContestantMasterScoreFV.FindControl("masterCostumeA")).Text = GetHiLoSum("judgeCostumeA", 6).HasValue ? GetHiLoSum("judgeCostumeA", 6).ToString() : "";
                ((TextBox)ContestantMasterScoreFV.FindControl("masterCostumeK")).Text = GetHiLoSum("judgeCostumeK", 6).HasValue ? GetHiLoSum("judgeCostumeK", 6).ToString() : "";
                ((TextBox)ContestantMasterScoreFV.FindControl("masterHulaA")).Text = GetHiLoSum("judgeHulaA", 6).HasValue ? GetHiLoSum("judgeHulaA", 6).ToString() : "";
                ((TextBox)ContestantMasterScoreFV.FindControl("masterHulaK")).Text = GetHiLoSum("judgeHulaK", 6).HasValue ? GetHiLoSum("judgeHulaK", 6).ToString() : "";

                ((Label)ContestantMasterScoreFV.FindControl("masterInterviewTie")).Text = GetSum("judgeInterview", 7).HasValue ? GetSum("judgeInterview", 7).ToString() : "N/A";
                ((Label)ContestantMasterScoreFV.FindControl("masterCostumeATie")).Text = GetSum("judgeCostumeA", 6).HasValue ? GetSum("judgeCostumeA", 6).ToString() : "N/A";
                ((Label)ContestantMasterScoreFV.FindControl("masterCostumeKTie")).Text = GetSum("judgeCostumeK", 6).HasValue ? GetSum("judgeCostumeK", 6).ToString() : "N/A";
                ((Label)ContestantMasterScoreFV.FindControl("masterHulaATie")).Text = GetSum("judgeHulaA", 6).HasValue ? GetSum("judgeHulaA", 6).ToString() : "N/A";
                ((Label)ContestantMasterScoreFV.FindControl("masterHulaKTie")).Text = GetSum("judgeHulaK", 6).HasValue ? GetSum("judgeHulaK", 6).ToString() : "N/A";
            }
        }


        // MASTER SCORE ACCESSORS
        protected string InterviewTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.interview_tie;

                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }
        protected string CostmeAuanaTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.costume_auana_tie;

                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }
        protected string CostmeKahikoTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.costume_kahiko_tie;

                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }
        protected string HulaAuanaTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.hula_auana_tie;

                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }
        protected string HulaKahikoTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.hula_kahiko_tie;
                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;

            }
        }
        protected string HulaPaluaTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.hula_palua_tie;
                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }
        protected string CostumePaluaTie
        {
            get
            {
                var score = from s in db.vw_BreakingScores
                            where s.contestant_id == Convert.ToInt32(ContestantDDL.SelectedValue)
                            select s.costume_palua_tie;
                foreach (var bs in score)
                {
                    return bs.HasValue ? bs.ToString() : "N/A";
                }
                return string.Empty;
            }
        }


        // MASTER SCORES HELPER FUNCTIONS
        private bool HiLowIsChecked()
        {
            return ((CheckBox)ContestantMasterScoreFV.FindControl("HiLow")).Checked;
        }
        private int? GetSum(string tbName, int totalTb)
        {
            List<int?> ScoreList = GetScoreList(tbName, totalTb);

            if (ScoreList.Any())
            {
                return Convert.ToInt32(ScoreList.Sum());
            }
            else
            {
                return null;
            }
        }
        private int? GetHiLoSum(string tbName, int totalTb)
        {
            List<int?> ScoreList = GetScoreList(tbName, totalTb);

            if (ScoreList.Any())
            {
                // All Scores Entered && User Checked HiLow CB, Drop Hi & Low Scores
                if (ScoreList.Count() == totalTb && HiLowIsChecked())
                {
                    ScoreList.Remove(ScoreList.Max());
                    ScoreList.Remove(ScoreList.Min());
                }

                return Convert.ToInt32(ScoreList.Sum());
            }
            else
            {
                return null;
            }
        }
        private List<int?> GetScoreList(string tbName, int totalTb)
        {
            List<int?> ScoreList = new List<int?>(totalTb);

            for (int i = 1; i <= totalTb; i++)
            {
                int? score = GetScore((TextBox)ContestantScoresFV.FindControl(tbName + i));
                if (score.HasValue)
                {
                    ScoreList.Add(score.Value);
                }
            }

            return ScoreList;
        }
        private int? GetScore(TextBox tb)
        {
            int parsedValue;
            if (tb.Text != "")
            {
                if (int.TryParse(tb.Text, out parsedValue))
                {
                    return parsedValue;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        protected void EntryYearTb_TextChanged(object sender, EventArgs e)
        {
            // Remove Items and Add "Select Value" list item
            var listItem = ContestantDDL.Items[0];
            ContestantDDL.Items.Clear();
            ContestantDDL.Items.Add(listItem);

            // Rebinds DDL Triggers LINQ Selecting Event.
            ContestantDDL.DataBind();
        }

        /// <summary>
        /// Assigns LINQ query contestants results where entry_date is entered year.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ContestantLDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DateTime date;

            if (String.IsNullOrEmpty(EntryYearTb.Text)) { date = DateTime.Now; }
            else { DateTime.TryParse("01/01/" + EntryYearTb.Text, out date); }

            var contestants = from conts in db.Contestants
                              where conts.entry_date.Year == date.Year
                              orderby conts.full_name
                              select new { conts.id, conts.full_name };

            e.Result = contestants;
        }

        protected void exportMasterTab_Click(object sender, EventArgs e)
        {
            MasterTabulationScore.DownloadReport("01/01/" + EntryYearTb.Text);
        }
    }
}