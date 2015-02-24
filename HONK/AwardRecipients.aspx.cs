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
        DBMethods.HonkAwards honkAwards = new DBMethods.HonkAwards();

        protected void Page_Load(object sender, EventArgs e)
        {
            //honkAwards.GenerateAwardWinners(DateTime.Now.AddYears(-1));
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            honkAwards.AddAwardWinners(DateTime.Now.AddYears(-2));
            e.Result = honkAwards.AwardRecipients;
        }
    }
}