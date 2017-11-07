using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HONK
{
    public partial class Kumu1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region KUMU FORMVIEW METHOD(S)
        protected void KumuFV_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            KumuFV.ChangeMode(FormViewMode.Insert);
            KumuGV.DataBind();
        }
        protected void KumuFV_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            KumuFV.ChangeMode(FormViewMode.Insert);
            KumuGV.DataBind();
        }
        #endregion

        #region KUMU GRIDVIEW METHOD(S)
        protected void KumuGV_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void KumuGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AsyncEdit")
            {
                AEKumuDS.WhereParameters["id"].DefaultValue = e.CommandArgument.ToString();
                AEKumuDS.DataBind();
                KumuFV.ChangeMode(FormViewMode.Edit);

                //KumuFV.DataBind();
                KumuFVUP.Update();

                // Shows Contestants Form on Edit.
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowKumu", "ShowKumu();", true);
            }
            // Delete contestant and corresponding FK relationship records.
            else if (e.CommandName == "CascadeDelete")
            {
                //DBMethods.DeleteContestant(Convert.ToInt32(e.CommandArgument));
                //HalauGV.DataBind();
            }
        }
        #endregion

        protected void KumuDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {

        }


    }
}