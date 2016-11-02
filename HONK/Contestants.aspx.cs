using System;
using System.Collections.Generic;
using System.Data.Linq;
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

        #region CONTESTANT SEARCH METHOD(S)
        protected void searchTB_TextChanged(object sender, EventArgs e)
        {
            ContestantGV.PageIndex = 0;
            ContestantGV.DataBind();

            // Shows Contestant Gridview on Search.
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowContestantGV", "ShowContestantGV();", true);
        }

        protected void clrSearchBtn_Click(object sender, EventArgs e)
        {
            searchTB.Text = string.Empty;
            searchTB_TextChanged(null, null);
        }
        #endregion

        #region CONTESTANT FORMVIEW METHOD(S)
        protected void UpdateContestantFV(object sender, FormViewInsertedEventArgs e)
        {
            ContestantFV.DataBind();
            ContestantFVUP.Update();
        }
        protected void ContestantFV_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            TextBox entry_date = (TextBox)ContestantFV.FindControl("entryDateTb");
            e.Values["entry_date"] = DateTime.Parse("01/01/" + entry_date.Text);
        }
        protected void ContestantFV_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            TextBox entry_date = (TextBox)ContestantFV.FindControl("entryDateTb");
            e.NewValues["entry_date"] = DateTime.Parse("01/01/" + entry_date.Text);
        }
        protected void ContestantFV_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            ContestantFV.ChangeMode(FormViewMode.Insert);
        }
        #endregion

        #region CONTESTANT GRIDVIEW METHOD(S)
        protected void ContestantGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AsyncEdit")
            {
                AEContestantsLDS.WhereParameters["id"].DefaultValue = e.CommandArgument.ToString();
                AEContestantsLDS.DataBind();
                ContestantFV.ChangeMode(FormViewMode.Edit);

                UpdateContestantFV(null, null);

                // Shows Contestants Form on Edit.
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "ShowContestants", "ShowContestants();", true);
            }
            // Delete contestant and corresponding FK relationship records.
            else if (e.CommandName == "CascadeDelete")
            {
                DBMethods.DeleteContestant(Convert.ToInt32(e.CommandArgument));
                ContestantGV.DataBind();
            }
        }
        #endregion

        #region LINQ SELECTING METHOD(S)
        protected void ContestantsLDS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = SearchContestantsCompiled(searchTB.Text);
        }

        #endregion
        #region STATIC METHOD(S) FOR CACHING COMPILED QUERIES
        public static List<Contestant> SearchContestantsCompiled(string query)
        {
            HONKDBDataContext db = new HONKDBDataContext();
            return SearchContestants(db, query).ToList();
        }

        #endregion

        #region COMPILED LINQ QUERIES
        /// <summary>
        /// Return all users based on textbox search query
        /// Filter parameters: Subagency, agency, first name, last name
        /// </summary>
        private static Func<HONKDBDataContext, string, IQueryable<Contestant>> SearchContestants =
            CompiledQuery.Compile((HONKDBDataContext db, string query) =>
                (from u in db.Contestants
                 where u.full_name.Contains(query)
                  || u.entry_date == Convert.ToDateTime(query)
                 orderby u.full_name
                 select u));
        #endregion


        #region HELPER METHOD(S)
        protected void CalculateDivision(object sender, EventArgs e)
        {
            DropDownList ageDD = (DropDownList)ContestantFV.FindControl("DropDownList1");
            DropDownList genderDD = (DropDownList)ContestantFV.FindControl("DropDownList2");
            DropDownList divDD = (DropDownList)ContestantFV.FindControl("DropDownList3");

            // Clear selection to prevent multiple select error.
            divDD.ClearSelection();

            if (ageDD.SelectedValue != "" && genderDD.SelectedValue != "")
            {
                if (ageDD.SelectedItem.Text == "Keiki")
                {
                    if (genderDD.SelectedItem.Text == "Kane")
                    {
                        divDD.Items.FindByText("Keiki Kane").Selected = true;
                    }
                    else if (genderDD.SelectedItem.Text == "Wahine")
                    {
                        divDD.Items.FindByText("Keiki Wahine").Selected = true;
                    }
                    else if (genderDD.SelectedItem.Text == "Palua")
                    {
                        divDD.Items.FindByText("Keiki Palua").Selected = true;
                    }
                }
                else if (ageDD.SelectedItem.Text == "'Opio")
                {
                    if (genderDD.SelectedItem.Text == "Kane")
                    {
                        divDD.Items.FindByText("'Opio Kane").Selected = true;
                    }
                    else if (genderDD.SelectedItem.Text == "Wahine")
                    {
                        divDD.Items.FindByText("'Opio Wahine").Selected = true;
                    }
                    else if (genderDD.SelectedItem.Text == "Palua")
                    {
                        divDD.Items.FindByText("'Opio Palua").Selected = true;
                    }
                }
            }

            else
            {
                divDD.SelectedValue = "";
            }

            ContestantFVUP.Update();
        }
        #endregion


    }
}