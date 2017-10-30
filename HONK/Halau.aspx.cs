using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HONK
{
    public partial class Halau1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region HALAU FORMVIEW METHOD(S)
        protected void UpdateHalauFV(object sender, FormViewInsertedEventArgs e)
        {
            HalauFV.DataBind();
            HalauFVUP.Update();
        }

        protected void HalauFV_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            HalauFV.ChangeMode(FormViewMode.Insert);
            HalauGV.DataBind();
        }

        #endregion

        protected void Halau_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AsyncEdit")
            {
                AEHalauDS.WhereParameters["id"].DefaultValue = e.CommandArgument.ToString();
                AEHalauDS.DataBind();
                HalauFV.ChangeMode(FormViewMode.Edit);

                UpdateHalauFV(null, null);

                // Shows Contestants Form on Edit.
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowHalau", "ShowHalau();", true);
            }
            // Delete contestant and corresponding FK relationship records.
            else if (e.CommandName == "CascadeDelete")
            {
                //DBMethods.DeleteContestant(Convert.ToInt32(e.CommandArgument));
                //HalauGV.DataBind();
            }
        }

        protected void Halau_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void clrSearchBtn_Click(object sender, EventArgs e)
        {
            searchTB.Text = string.Empty;
            searchTB_TextChanged(null, null);
        }

        protected void searchTB_TextChanged(object sender, EventArgs e)
        {
            HalauGV.PageIndex = 0;
            HalauGV.DataBind();

            // Shows Contestant Gridview on Search.
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowHalauGV", "ShowHalauGV();", true);
        }

        #region LINQ SELECTING METHOD(S)
        protected void HalauDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = SearchHalauCompiled(searchTB.Text);
        }
        #endregion


        #region STATIC METHOD(S) FOR CACHING COMPILED QUERIES
        public static List<Halau> SearchHalauCompiled(string query)
        {
            HONKDBDataContext db = new HONKDBDataContext();
            return SearchHalau(db, query).ToList();
        }

        #endregion
        #region COMPILED LINQ QUERIES
        /// <summary>
        /// Return all users based on textbox search query
        /// Filter parameters: Subagency, agency, first name, last name
        /// </summary>
        private static Func<HONKDBDataContext, string, IQueryable<Halau>> SearchHalau =
            CompiledQuery.Compile((HONKDBDataContext db, string query) =>
                (from u in db.Halaus
                 where u.name.Contains(query)
                 orderby u.name
                 select u));
        #endregion





    }
}