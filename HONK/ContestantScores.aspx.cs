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
        private static int EventYear = DateTime.Now.AddYears(-1).Year;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContestantDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(((DropDownList)sender).SelectedValue))
            {
                int contestant_id = Convert.ToInt32(((DropDownList)sender).SelectedValue);

                var contestant = from c in db.vw_Contestant_JudgeScores
                                 where c.id == contestant_id
                                 where c.entry_date.Year == EventYear
                                 select c;

                // INSERT CONTESTANT -> JUDGES SCORES w/ NULL VALUES
                if (contestant.Count() == 0) HelperMethods.InsertJudgeScores(contestant_id);

                ContestantScoresFV.ChangeMode(FormViewMode.Edit);

                ContestantScoresFV.DataBind();
                ContestantMasterScoreFV.DataBind();

                //Check if Palua or Not
                if (HelperMethods.IsPalua(contestant_id))
                {
                    ContestantScoresFV.FindControl("isNotPalua").Visible = false;
                    ContestantMasterScoreFV.FindControl("isNotPaluaMS").Visible = false;
                }
                int i = 1;
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

                divJudgeScores.Visible = true;
                divMasterScores.Visible = true;
                SubmitBtn.Visible = true;
            }
            else
            {
                ContestantScoresFV.ChangeMode(FormViewMode.ReadOnly);
                ContestantMasterScoreFV.ChangeMode(FormViewMode.ReadOnly);

                divJudgeScores.Visible = false;
                divMasterScores.Visible = false;
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
            }
            else if (ContestantMasterScoreFV.CurrentMode == FormViewMode.Edit)
            {
                ContestantMasterScoreFV.UpdateItem(true);
            }

            ContestantScoresFV_UpdateItems();
            CalculateHiLow_MasterScores(null, null);
        }
        /// <summary>
        /// Updates JudgeScore table based on ContestantScoreFV Textbox values
        /// </summary>
        private void ContestantScoresFV_UpdateItems()
        {
            int contestant_id = Convert.ToInt32(ContestantDDL.SelectedValue);

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

        /// <summary>
        /// Calculates MasterScores; dropping high and low values
        /// Interview: 7 Judges, if needed add 0 or max fillers.
        /// Other Scores: 6 Judges, if needed add 0 or max fillers.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CalculateHiLow_MasterScores(object sender, EventArgs e)
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
    }
}