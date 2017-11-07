using System;
using System.Collections.Generic;
using System.Data.Linq;
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

        #region SEARCH METHOD(S)

        protected void searchTB_TextChanged(object sender, EventArgs e)
        {
            KumuGV.PageIndex = 0;
            KumuGV.DataBind();

            // Shows Contestant Gridview on Search.
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowKumuGV", "ShowKumuGV();", true);
        }

        protected void clrSearchBtn_Click(object sender, EventArgs e)
        {
            searchTB.Text = string.Empty;
            searchTB_TextChanged(null, null);
        }
        #endregion

        #region KUMU FORMVIEW METHOD(S)
        protected void KumuFV_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "WarningMsg", "KumuUpdateSuccess(" + "'" + e.NewValues["full_name"] + "'" + ");", true);

        }
        protected void KumuFV_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(Page), "WarningMsg", "KumuInsSuccess(" + "'" + e.Values["full_name"] + "'" + ");", true);

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
                //KumuFVUP.Update();

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
            e.Result = SearchKumuCompiled(searchTB.Text);
        }


        #region STATIC METHOD(S) FOR CACHING COMPILED QUERIES
        public static List<Kumu> SearchKumuCompiled(string query)
        {
            HONKDBDataContext db = new HONKDBDataContext();
            return SearchKumu(db, query).ToList();
        }

        #endregion
        #region COMPILED LINQ QUERIES
        /// <summary>
        /// Return all users based on textbox search query
        /// Filter parameters: Subagency, agency, first name, last name
        /// </summary>
        private static Func<HONKDBDataContext, string, IQueryable<Kumu>> SearchKumu =
            CompiledQuery.Compile((HONKDBDataContext db, string query) =>
                (from u in db.Kumus
                 where u.full_name.Contains(query)
                 orderby u.full_name
                 select u));




        #endregion


    }
}