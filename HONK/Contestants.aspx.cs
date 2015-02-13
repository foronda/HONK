﻿using System;
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

        protected void UpdateContestantFV(object sender, FormViewInsertedEventArgs e)
        {
            ContestantFV.DataBind();
            ContestantFVUP.Update();
        }

        protected void CalculateDivision(object sender, EventArgs e)
        {
            DropDownList ageDD = (DropDownList)ContestantFV.FindControl("DropDownList1");
            DropDownList genderDD = (DropDownList)ContestantFV.FindControl("DropDownList2");
            DropDownList divDD = (DropDownList)ContestantFV.FindControl("DropDownList3");
            
            // Clear selection to prevent multiple select error.
            divDD.ClearSelection();

            if (ageDD.SelectedValue != "" && genderDD.SelectedValue != "")
            {
                if (genderDD.SelectedItem.Text == "Palua")
                {
                    divDD.Items.FindByText("Palua").Selected = true;
                }
                else if (ageDD.SelectedItem.Text == "Keiki")
                {
                    if (genderDD.SelectedItem.Text == "Kane")
                    {
                      divDD.Items.FindByText("Keiki Kane").Selected = true;
                    }
                    else if (genderDD.SelectedItem.Text == "Wahine")
                    {
                        divDD.Items.FindByText("Keiki Wahine").Selected = true;
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
                }

            }

            else
            {
                divDD.SelectedValue = "";
            }

            ContestantFVUP.Update();
        }

    }
}