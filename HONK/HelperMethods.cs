using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace HONK
{
    public class HelperMethods
    {
        public static bool IsPalua(int contestant_id)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            return (from c in db.vw_ContestantDetails
                         where c.id == contestant_id
                         && c.gender_name == "Palua"
                         select c).Any();
        }

        //SQL INSERT METHODS
        /// <summary>
        /// Function
        /// </summary>
        /// <param name="contestant_id"></param>
        public static void InsertJudgeScores(int contestant_id)
        {
            HONKDBDataContext db = new HONKDBDataContext();
            int judgeCount = TotalJudges();

            string command = "INSERT INTO JudgeScore (contestant_id, judge_id) VALUES (@contestant_id, @judge_id)  ";
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;

            for (int i = 1; i <= judgeCount; i++)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand sqlCmd = new SqlCommand(command, connection);
                    sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
                    sqlCmd.Parameters.AddWithValue("@judge_id", i);

                    SqlDataReader reader = sqlCmd.ExecuteReader();
                    reader.Close();
                }
            }
        }

        // SQL UPDATE METHODS

        /// <summary>
        /// Method for updating a Contestant Individual Judge Score. Age Gender is not Palua
        /// </summary>
        /// <param name="contestant_id"></param>
        /// <param name="judge_id"></param>
        /// <param name="interview"></param>
        /// <param name="costume_auana"></param>
        /// <param name="costume_kahiko"></param>
        /// <param name="hula_auana"></param>
        /// <param name="hula_kahiko"></param>
        public static void UpdateJudgeScore(int contestant_id, int judge_id, string interview, string costume_auana, string costume_kahiko, string hula_auana, string hula_kahiko)
        {
            HONKDBDataContext db = new HONKDBDataContext();
            int judgeCount = TotalJudges();

            try
            {
                string command = "UPDATE  JudgeScore SET interview = @interview, costume_auana = @costume_auana,costume_kahiko = @costume_kahiko,hula_auana = @hula_auana, hula_kahiko = @hula_kahiko Where contestant_id = @contestant_id and judge_id = @judge_id ";

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;

                for (int i = 1; i <= judgeCount; i++)
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        SqlCommand sqlCmd = new SqlCommand(command, connection);

                        sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
                        sqlCmd.Parameters.AddWithValue("@judge_id", judge_id);
                        sqlCmd.Parameters.AddWithEmptyStringValue("@interview", interview);
                        sqlCmd.Parameters.AddWithEmptyStringValue("@costume_auana", costume_auana);
                        sqlCmd.Parameters.AddWithEmptyStringValue("@costume_kahiko", costume_kahiko);
                        sqlCmd.Parameters.AddWithEmptyStringValue("@hula_auana", hula_auana);
                        sqlCmd.Parameters.AddWithEmptyStringValue("@hula_kahiko", hula_kahiko);

                        sqlCmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public static void UpdateJudgeScore(int contestant_id, int judge_id, string interview)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            try
            {
                string command = "UPDATE  JudgeScore SET interview = @interview Where contestant_id = @contestant_id and judge_id = @judge_id ";

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand sqlCmd = new SqlCommand(command, connection);
                    sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
                    sqlCmd.Parameters.AddWithValue("@judge_id", judge_id);
                    sqlCmd.Parameters.AddWithEmptyStringValue("@interview", interview);

                    sqlCmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        public static int TotalJudges()
        {
            HONKDBDataContext db = new HONKDBDataContext();
            return (from j in db.Judges
                    select j).Count();
        }


    }

    public static class HonkExtension
    {
        /// <summary>
        /// Converts Empty string values to DB.Null
        /// </summary>
        /// <param name="collection"></param>
        /// <param name="parameterName"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static SqlParameter AddWithEmptyStringValue(this SqlParameterCollection collection, string parameterName, object value)
        {
            if (value == string.Empty)
                return collection.AddWithValue(parameterName, DBNull.Value);
            else
                return collection.AddWithValue(parameterName, value);
        }
    }

}

