using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class Contestants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HalauFV_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ContestantsFV.DataBind();
            ContestantsFVUP.Update();
        }

        protected void UpdateContestantsFV(object sender, FormViewInsertedEventArgs e)
        {
            ContestantsFV.DataBind();
            ContestantsFVUP.Update();
        }
        protected void KumuFV_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

        }

    }
}