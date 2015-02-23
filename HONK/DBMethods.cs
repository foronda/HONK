using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace HONK
{
    public class DBMethods
    {

        // LINQ METHODS
        public static bool IsPalua(int contestant_id)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            return (from c in db.vw_ContestantDetails
                    where c.id == contestant_id
                    && c.gender_name == "Palua"
                    select c).Any();
        }
        public static int TotalJudges()
        {
            HONKDBDataContext db = new HONKDBDataContext();
            return (from j in db.Judges
                    select j).Count();
        }
        /// <summary>
        /// Intializes JudgeScore collection with null values for a given contestant.
        /// </summary>
        /// <param name="contestant_id"></param>
        public static void InitializeJudgeScores(int contestant_id)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            // Create a JudgeScore object and add the object to the JudgeScore collection
            for (int i = 1; i <= TotalJudges(); i++)
            {
                JudgeScore judge_score = new JudgeScore();
                judge_score.contestant_id = contestant_id;
                judge_score.judge_id = i;
                db.JudgeScores.InsertOnSubmit(judge_score);
            }

            // Submit the change to the database
            try
            {
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
        public static void UpdateJudgeScore(int contestant_id, int judge_id, DateTime date, string interview, string costume_auana, string costume_kahiko, string hula_auana, string hula_kahiko)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            var js = (from j in db.JudgeScores
                      where j.contestant_id == contestant_id
                      && j.Contestant.entry_date.Year == date.Year
                      && j.judge_id == judge_id
                      select j).FirstOrDefault();

            if (js != null)
            {
                js.interview = HonkExtension.StringToInt(interview);
                js.costume_auana = HonkExtension.StringToInt(costume_auana);
                js.costume_kahiko = HonkExtension.StringToInt(costume_kahiko);
                js.hula_auana = HonkExtension.StringToInt(hula_auana);
                js.hula_kahiko = HonkExtension.StringToInt(hula_kahiko);

                try
                {
                    db.SubmitChanges();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
        }
        public static void UpdateJudgeScore(int contestant_id, int judge_id, DateTime date, string hula_palua, string costume_palua)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            var js = (from j in db.JudgeScores
                      where j.contestant_id == contestant_id
                      && j.Contestant.entry_date.Year == date.Year
                      && j.judge_id == judge_id
                      select j).FirstOrDefault();

            if (js != null)
            {
                js.costume_palua = HonkExtension.StringToInt(costume_palua);
                js.hula_palua = HonkExtension.StringToInt(hula_palua);

                try
                {
                    db.SubmitChanges();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
        }
        public static void UpdateJudgeScore(int contestant_id, int judge_id, DateTime date, string interview)
        {
            HONKDBDataContext db = new HONKDBDataContext();

            var js = (from j in db.JudgeScores
                      where j.contestant_id == contestant_id
                      && j.Contestant.entry_date.Year == date.Year
                      && j.judge_id == judge_id
                      select j).FirstOrDefault();

            if (js != null)
            {
                js.interview = HonkExtension.StringToInt(interview);

                try
                {
                    db.SubmitChanges();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                }
            }
        }


        //SQL INSERT METHODS
        /// <summary>
        /// Function
        /// </summary>
        /// <param name="contestant_id"></param>
        //public static void InsertJudgeScores(int contestant_id)
        //{
        //    HONKDBDataContext db = new HONKDBDataContext();
        //    int judgeCount = TotalJudges();

        //    string command = "INSERT INTO JudgeScore (contestant_id, judge_id) VALUES (@contestant_id, @judge_id)  ";
        //    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;

        //    for (int i = 1; i <= judgeCount; i++)
        //    {
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();

        //            SqlCommand sqlCmd = new SqlCommand(command, connection);
        //            sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
        //            sqlCmd.Parameters.AddWithValue("@judge_id", i);

        //            SqlDataReader reader = sqlCmd.ExecuteReader();
        //            reader.Close();
        //        }
        //    }
        //}

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
        //public static void UpdateJudgeScore(int contestant_id, int judge_id, string interview, string costume_auana, string costume_kahiko, string hula_auana, string hula_kahiko)
        //{
        //    HONKDBDataContext db = new HONKDBDataContext();
        //    int judgeCount = TotalJudges();

        //    try
        //    {
        //        string command = "UPDATE  JudgeScore SET interview = @interview, costume_auana = @costume_auana,costume_kahiko = @costume_kahiko,hula_auana = @hula_auana, hula_kahiko = @hula_kahiko Where contestant_id = @contestant_id and judge_id = @judge_id ";

        //        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;

        //        for (int i = 1; i <= judgeCount; i++)
        //        {
        //            using (SqlConnection connection = new SqlConnection(connectionString))
        //            {
        //                connection.Open();

        //                SqlCommand sqlCmd = new SqlCommand(command, connection);

        //                sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
        //                sqlCmd.Parameters.AddWithValue("@judge_id", judge_id);
        //                sqlCmd.Parameters.AddWithEmptyStringValue("@interview", interview);
        //                sqlCmd.Parameters.AddWithEmptyStringValue("@costume_auana", costume_auana);
        //                sqlCmd.Parameters.AddWithEmptyStringValue("@costume_kahiko", costume_kahiko);
        //                sqlCmd.Parameters.AddWithEmptyStringValue("@hula_auana", hula_auana);
        //                sqlCmd.Parameters.AddWithEmptyStringValue("@hula_kahiko", hula_kahiko);

        //                sqlCmd.ExecuteNonQuery();
        //            }
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}

        /// <summary>
        /// Method for updating a Palua Contestant's Individual Judge Score. Age Gene is Palua
        /// </summary>
        /// <param name="contestant_id"></param>
        /// <param name="judge_id"></param>
        /// <param name="hula_palua"></param>
        /// <param name="costume_palua"></param>
        //public static void UpdateJudgeScore(int contestant_id, int judge_id, string hula_palua, string costume_palua)
        //{
        //    HONKDBDataContext db = new HONKDBDataContext();

        //    try
        //    {
        //        string command = "UPDATE  JudgeScore SET hula_palua = @hula_palua,  costume_palua = @costume_palua Where contestant_id = @contestant_id and judge_id = @judge_id ";

        //        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();

        //            SqlCommand sqlCmd = new SqlCommand(command, connection);
        //            sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
        //            sqlCmd.Parameters.AddWithValue("@judge_id", judge_id);
        //            sqlCmd.Parameters.AddWithEmptyStringValue("@hula_palua", hula_palua);
        //            sqlCmd.Parameters.AddWithEmptyStringValue("@costume_palua", costume_palua);

        //            sqlCmd.ExecuteNonQuery();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }

        //}

        //public static void UpdateJudgeScore(int contestant_id, int judge_id, string interview)
        //{
        //    HONKDBDataContext db = new HONKDBDataContext();

        //    try
        //    {
        //        string command = "UPDATE  JudgeScore SET interview = @interview Where contestant_id = @contestant_id and judge_id = @judge_id ";

        //        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["HONKDBContext"].ConnectionString;
        //        using (SqlConnection connection = new SqlConnection(connectionString))
        //        {
        //            connection.Open();

        //            SqlCommand sqlCmd = new SqlCommand(command, connection);
        //            sqlCmd.Parameters.AddWithValue("@contestant_id", contestant_id);
        //            sqlCmd.Parameters.AddWithValue("@judge_id", judge_id);
        //            sqlCmd.Parameters.AddWithEmptyStringValue("@interview", interview);

        //            sqlCmd.ExecuteNonQuery();
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}



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

        public static int? StringToInt(string value)
        {
            if (!String.IsNullOrEmpty(value)) return Convert.ToInt32(value);
            else return null;
        }
    }

}

