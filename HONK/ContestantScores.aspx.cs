using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class ContestantScores : System.Web.UI.Page
    {
        HONKDBDataContext db = new HONKDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ContestantScoreDetailsLDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            //var data = db.vw_ContestantScoreDetails.Where(x => DateTime.Compare(x.entry_date.Year, DateTime.Now.Year)).ToList();
        }

        protected void ConstestantDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            var contestant = from c in db.vw_ContestantScoreDetails
                             where c.full_name == ((DropDownList)sender).SelectedItem.ToString()
                             where c.entry_date.Year == DateTime.Now.AddYears(-1).Year
                             select c;

            //Check if Palua or Not
            int i = 1;
            foreach (var c in contestant)
            {
                ((TextBox)ContestantScoresFV.FindControl("judgeInterview" + i)).Text = c.judge_score_interview.ToString();
                if (i == 7)
                {
                    continue;
                }
                else
                {
                    ((TextBox)ContestantScoresFV.FindControl("judgeCostumeA" + i)).Text = c.judge_score_costume_auana.ToString();
                    ((TextBox)ContestantScoresFV.FindControl("judgeCostumeK" + i)).Text = c.judge_score_costume_kahiko.ToString();
                    ((TextBox)ContestantScoresFV.FindControl("judgeHulaA" + i)).Text = c.judge_score_hula_auana.ToString();
                    ((TextBox)ContestantScoresFV.FindControl("judgeHulaK" + i)).Text = c.judge_score_hula_kahiko.ToString();
                }

                i++;
            }

            ContestantScoresFV.Visible = true;

        }

        protected void MasterScoresLDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            if (e.Result == null && ConstestantDDL.SelectedValue != "")
            {
                ContestantMasterScoreFV.ChangeMode(FormViewMode.Insert);
            }
            else
            {
                ContestantMasterScoreFV.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void ContestantMasterScoreFV_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["contestant_id"] = ConstestantDDL.SelectedValue;
        }

    }
}