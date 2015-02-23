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
        protected void Page_Load(object sender, EventArgs e)
        {
            DBMethods.HonkAwards honkAwards = new DBMethods.HonkAwards();
            //honkAwards.GenerateAwardWinners(DateTime.Now.AddYears(-1));
        }
    }
}