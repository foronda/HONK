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

        protected void ConstestantDDL_SelectedIndexChanged(object sender, EventArgs e)
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
                LoadBreakingScores(contestant_id);

                //Check if Palua or Not
                if (HelperMethods.IsPalua(contestant_id))
                {

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
        }

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

        private void LoadBreakingScores(int contestant_id)
        {
            var breaking_scores = (from s in db.vw_BreakingScores
                                   where s.contestant_id == contestant_id
                                   select s).ToList();
            foreach (var bs in breaking_scores)
            {
                ((Label)ContestantMasterScoreFV.FindControl("masterInterviewTie")).Text = bs.interview_tie.ToString();
                //((Label)ContestantMasterScoreFV.FindControl("masterInterviewTie")).Text = "FUCK YEA!";

            }
        }
    }
}