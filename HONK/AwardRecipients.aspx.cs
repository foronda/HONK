using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class AwardRecipients : System.Web.UI.Page
    {
        DBMethods.HonkAwards HonkAwards = new DBMethods.HonkAwards();
        DBMethods.Awards Awards = new DBMethods.Awards();

        protected void Page_Load(object sender, EventArgs e)
        {
            //honkAwards.GenerateAwardWinners(DateTime.Now.AddYears(-1));
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            //HonkAwards.CalculateWinners(DateTime.Now.AddYears(-2));
            //HonkAwards.CalculateWinners(DateTime.Now.AddYears(-2));
            Awards.SetRecipients(DateTime.Now.AddYears(-2));
            e.Result = Awards.Recipients;

            //e.Result = HonkAwards.AwardRecipients;
        }
    }
}