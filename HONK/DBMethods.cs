﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.Linq;     // For Compiled LINQ Queries

namespace HONK
{
    public class DBMethods
    {
        public class HonkAwards
        {
            public IQueryable<AwardRecipient> AwardRecipients
            {
                get { return awardRecipients.AsQueryable(); }
            }

            public void CalculateWinners(DateTime date)
            {
                HONKDBDataContext db = new HONKDBDataContext();

                var query = (from a in db.vw_ContestantAwardScoresByCategories
                             where a.entry_date.Year == date.Year
                             select a).AsQueryable();

                // Obtain string list of award titles for AwardRecipient object.
                award_titles = (from t in db.Awards
                                select t.title).ToList();

                AddInterviewWinners(ref query);
                AddCostumeWinners(ref query);
                AddHulaWinners(ref query);
                AddOliWinners(ref query);
                AddMusicWinner(ref query);
                AddOverallWinners(ref query);

                //foreach (var a in query)
                //{
                //    AddAwardRecipient(a.Name, a.Score, a.ScoreTie, a.Category);
                //}

                //var awards = (from award in db.vw_ContestantAwardScores
                //              where award.entry_date.Year == date.Year
                //              orderby award.interview descending
                //              select new AwardRecipient
                //              {
                //                  Name = award.full_name,
                //                  Score = award.interview,
                //                  ScoreTie = award.interview_tie,
                //                  Category = "Interview"
                //              }).Union
                //            (from award in db.vw_ContestantAwardScores
                //             where award.entry_date.Year == date.Year
                //             orderby award.music descending
                //             select new AwardRecipient
                //             {
                //                 Name = award.full_name,
                //                 Score = award.music,
                //                 ScoreTie = null,
                //                 Category = "Music"
                //             }).Union;
            }
            private void AddInterviewWinners(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                // Interview Awards
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiInterview = a => a.age_id == Keiki && a.award_category_id == Interview;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioInterview = a => a.age_id == Opio && a.award_category_id == Interview;

                // Keiki Interview
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiInterview)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[0],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Opio Interview
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioInterview)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[1],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
            }
            private void AddCostumeWinners(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                // Costume Awards
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiKahiko = a => a.age_id == Keiki && a.award_category_id == CKahiko;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioKahiko = a => a.age_id == Opio && a.award_category_id == CKahiko;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiAuana = a => a.age_id == Keiki && a.award_category_id == CAuana;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioAuana = a => a.age_id == Opio && a.award_category_id == CAuana;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiPalua = a => a.age_id == Keiki && a.award_category_id == CPalua;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioPalua = a => a.age_id == Opio && a.award_category_id == CPalua;

                // Keiki Kahiko Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiKahiko)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[2],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Opio Kahiko Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioKahiko)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[3],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Keiki Auana Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiAuana)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[4],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Opio Auana Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioAuana)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[5],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Keiki Palua Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiPalua)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[6],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                // Opio Palua Costume
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioPalua)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[7],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
            }
            private void AddHulaWinners(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                //Hula Awards
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiPaluaHula = a => a.age_id == Keiki && a.gender_id == Palua && a.award_category_id == Hula;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioPaluaHula = a => a.age_id == Opio && a.gender_id == Palua && a.award_category_id == Hula;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiKaneHula = a => a.age_id == Keiki && a.gender_id == Kane && a.award_category_id == Hula;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiWahineHula = a => a.age_id == Keiki && a.gender_id == Wahine && a.award_category_id == Hula;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioKaneHula = a => a.age_id == Opio && a.gender_id == Kane && a.award_category_id == Hula;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioWahineHula = a => a.age_id == Opio && a.gender_id == Wahine && a.award_category_id == Hula;

                // Keiki Palua Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiPaluaHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[8],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Opio Palua Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioPaluaHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[9],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Keiki Kane Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiKaneHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[15],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Keiki Wahine Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiWahineHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[16],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Opio Kane Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioKaneHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[17],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Opio Wahine Hula
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioWahineHula)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[18],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
            }
            private void AddOliWinners(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                //Oli Awards
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiKaneOli = a => a.age_id == Keiki && a.gender_id == Kane && a.award_category_id == Oli;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKeikiWahineOli = a => a.age_id == Keiki && a.gender_id == Wahine && a.award_category_id == Oli;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioKaneOli = a => a.age_id == Opio && a.gender_id == Kane && a.award_category_id == Oli;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereOpioWahineOli = a => a.age_id == Opio && a.gender_id == Wahine && a.award_category_id == Oli;

                // Keiki Kane Oli
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiKaneOli)
                                    .OrderByDescending(award => award.score)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[10],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Keiki Wahine Oli
                AddAwardRecipient(award_scores
                                    .Where(WhereKeikiWahineOli)
                                    .OrderByDescending(award => award.score)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[11],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Opio Kane Oli
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioKaneOli)
                                    .OrderByDescending(award => award.score)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[12],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
                // Opio Wahine Oli
                AddAwardRecipient(award_scores
                                    .Where(WhereOpioWahineOli)
                                    .OrderByDescending(award => award.score)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[13],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .Take(3).ToList());
            }
            private void AddMusicWinner(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                //Music Award
                Func<vw_ContestantAwardScoresByCategory, bool> WhereMusic = a => a.award_category_id == Music;
                // Music
                AddAwardRecipient(award_scores
                                    .Where(WhereMusic)
                                    .OrderByDescending(award => award.score)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.halau_name,
                                        AwardName = award_titles[14],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    }).FirstOrDefault());
            }
            private void AddOverallWinners(ref IQueryable<vw_ContestantAwardScoresByCategory> award_scores)
            {
                // Overall Awards
                Func<vw_ContestantAwardScoresByCategory, bool> WhereKaneOverall = a => a.gender_id == Kane && a.award_category_id == Overall;
                Func<vw_ContestantAwardScoresByCategory, bool> WhereWahineOverall = a => a.gender_id == Wahine && a.award_category_id == Overall;

                // Overall Kane
                AddAwardRecipient(award_scores
                                    .Where(WhereKaneOverall)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[17],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());
                //  Overall Wahine
                AddAwardRecipient(award_scores
                                    .Where(WhereWahineOverall)
                                    .OrderByDescending(award => award.score)
                                    .ThenByDescending(award => award.score_tie)
                                    .Select(award => new AwardRecipient
                                    {
                                        EntryDate = award.entry_date,
                                        Name = award.full_name,
                                        AwardName = award_titles[18],
                                        Score = award.score,
                                        ScoreTie = award.score_tie,
                                    })
                                    .FirstOrDefault());

            }

            // AwardRecipient Class Methods
            private void AddAwardRecipient(DateTime date, string name, string award_name, int? score, int? score_tie)
            {
                awardRecipients.Add(new AwardRecipient
                {
                    EntryDate = date,
                    Name = name,
                    Score = score,
                    ScoreTie = score_tie,
                    AwardName = award_name
                });
            }
            private void AddAwardRecipient(AwardRecipient award_recipient)
            {
                awardRecipients.Add(award_recipient);
            }
            private void AddAwardRecipient(List<AwardRecipient> award_recipients)
            {
                int i = 0;
                foreach (var a in award_recipients)
                {
                    if (a != null)
                    {
                        if (i == 0) a.Place = "1st Place";
                        if (i == 1) a.Place = "2nd Place";
                        if (i == 2) a.Place = "3rd Place";
                        AddAwardRecipient(a);
                        i++;
                    }
                }
            }

            // Class/Object declarations
            public class AwardRecipient
            {
                public string Name { get; set; }
                public string AwardName { get; set; }
                public string Place { get; set; }
                public decimal? Score { get; set; }
                public decimal? ScoreTie { get; set; }
                public DateTime EntryDate { get; set; }
            }

            private List<AwardRecipient> awardRecipients = new List<AwardRecipient>();
            private List<string> award_titles = new List<string>();

            // Variable Declarations
            private int Keiki = 1, Opio = 2;
            private int Kane = 1, Wahine = 2, Palua = 3;
            private int CAuana = 1, CKahiko = 2, CPalua = 3, Hula = 4, Interview = 5, Music = 6, Oli = 7, Overall = 8;
        }

        public class Awards
        {
            public IQueryable<Recipient> Recipients
            {
                get { return recipients.AsQueryable(); }
            }

            public void SetRecipients(DateTime date)
            {
                HONKDBDataContext db = new HONKDBDataContext();
                award_titles = (from t in db.Awards
                                select t.title).ToList();

                List<vw_AwardCandidate> award_candidates = new List<vw_AwardCandidate>();

                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.KeikiInterview, date).Select(c => c).FirstOrDefault());
                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.OpioInterview, date).Select(c => c).FirstOrDefault());

                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.KeikiKahiko, date).Select(c => c).FirstOrDefault());
                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.OpioKahiko, date).Select(c => c).FirstOrDefault());
                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.KeikiAuana, date).Select(c => c).FirstOrDefault());
                award_candidates.Add(GetAwardCandidates(db, AwardCandidates.Where.OpioAuana, date).Select(c => c).FirstOrDefault());

                award_candidates.AddRange(GetAwardCandidates(db, AwardCandidates.Where.KeikiPaluaHula, date).Select(c => c).Take(3).ToList());
                award_candidates.AddRange(GetAwardCandidates(db, AwardCandidates.Where.OpioPaluaHula, date).Select(c => c).Take(3).ToList());
                award_candidates.AddRange(GetAwardCandidates(db, AwardCandidates.Where.KeikiKaneHula, date).Select(c => c).Take(3).ToList());
                award_candidates.AddRange(GetAwardCandidates(db, AwardCandidates.Where.KeikiWahineHula, date).Select(c => c).Take(3).ToList());

                int i = 0;
                string test = string.Empty;

                foreach (vw_AwardCandidate a in award_candidates)
                {
                    if(i < 10)
                    {
                        if (a != null)
                        {
                            AddRecipient(a.entry_date, a.full_name, award_titles[i], a.score, a.score_tie, a.rank);
                        }
                    }

                    //try
                    //{
                    //    if (a.award_category_id == 4 && test == award_titles[i])
                    //    {
                    //        test = award_titles[i];
                    //    }
                    //    else
                    //    {
                    //        test = string.Empty;
                    //        i++;
                    //    }

                    //}
                    //catch (Exception e)
                    //{
                    //    Console.WriteLine(e);
                    //}
                }
            }

            private IEnumerable<vw_AwardCandidate> GetAwardCandidates(DateTime date, Func<vw_AwardCandidate, bool> WhereClause)
            {
                using (HONKDBDataContext db = new HONKDBDataContext())
                {
                    return CompiledQueries.AwardCandidates(db, WhereClause, date);
                }
            }
            /// <summary>
            /// Slow when using query predicates
            /// </summary>
            /// <param name="db"></param>
            /// <param name="predicate"></param>
            /// <param name="date"></param>
            /// <returns></returns>
            private IEnumerable<vw_AwardCandidate> GetAwardCandidates(HONKDBDataContext db, Func<vw_AwardCandidate, bool> predicate, DateTime date)
            {
                return (db.vw_AwardCandidates
                         .Where(predicate)
                         .Where(ac => ac.entry_date.Year == date.Year)
                         .OrderByDescending(ac => ac.score)
                         .ThenByDescending(ac => ac.score_tie)
                         .Select(ac => ac));

            }

            // Recipient Class Declaration
            public class Recipient
            {
                public string Name { get; set; }
                public string AwardName { get; set; }
                public string Place { get; set; }
                public decimal? Score { get; set; }
                public decimal? ScoreTie { get; set; }
                public DateTime EntryDate { get; set; }
            }

            // Recipient Class Methods
            private void AddRecipient(DateTime date, string name, string award_name, decimal? score, decimal? score_tie, long? rank)
            {
                string place = string.Empty;
                if(rank == 1) place = "1st Place";
                if(rank == 2) place = "2nd Place";
                if(rank == 3) place = "3rd Place";

                recipients.Add(new Recipient
                {
                    EntryDate = date,
                    Name = name,
                    Score = score,
                    ScoreTie = score_tie,
                    AwardName = award_name,
                    Place = place
                });
            }
            private void AddRecipient(Recipient award_recipient)
            {
                recipients.Add(award_recipient);
            }
            private void AddRecipient(List<Recipient> award_recipients)
            {
                int i = 0;
                foreach (var a in award_recipients)
                {
                    if (a != null)
                    {
                        if (i == 0) a.Place = "1st Place";
                        if (i == 1) a.Place = "2nd Place";
                        if (i == 2) a.Place = "3rd Place";
                        AddRecipient(a);
                        i++;
                    }
                }
            }

            // Recipient Private Variables
            private List<Recipient> recipients = new List<Recipient>();
            private List<string> award_titles = new List<string>();
        }
        public class AwardCandidates
        {
            private static int keiki = 1, opio = 2;
            private static int kane = 1, wahine = 2, palua = 3;
            private static int CAuana = 1, CKahiko = 2, CPalua = 3, hula = 4, interview = 5, music = 6, oli = 7, overall = 8;

            public class Where
            {
                public static Func<vw_AwardCandidate, bool> //Interview
                                                            KeikiInterview = a => a.age_id == 1 && a.award_category_id == 5,
                                                            OpioInterview = a => a.age_id == 2 && a.award_category_id == 5,
                    // Costume
                                                            KeikiKahiko = a => a.age_id == 1 && a.award_category_id == 2,
                                                            OpioKahiko = a => a.age_id == 2 && a.award_category_id == 2,
                                                            KeikiAuana = a => a.age_id == 1 && a.award_category_id == 1,
                                                            OpioAuana = a => a.age_id == 2 && a.award_category_id == 1,
                                                            KeikiPalua = a => a.age_id == 1 && a.award_category_id == 3,
                                                            OpioPalua = a => a.age_id == 2 && a.award_category_id == 3,
                    // Hula
                                                            KeikiPaluaHula = a => a.age_id == 1 && a.gender_id == 3 && a.award_category_id == 4,
                                                            OpioPaluaHula = a => a.age_id == 2 && a.gender_id == 3 && a.award_category_id == 4,
                                                            KeikiKaneHula = a => a.age_id == 1 && a.gender_id == 1 && a.award_category_id == 4,
                                                            KeikiWahineHula = a => a.age_id == 1 && a.gender_id == 2 && a.award_category_id == 4,
                                                            OpioKaneHula = a => a.age_id == 2 && a.gender_id == 1 && a.award_category_id == 4,
                                                            OpioWahineHula = a => a.age_id == 2 && a.gender_id == 2 && a.award_category_id == 4,
                    // Oli
                                                            KeikiKaneOli = a => a.age_id == keiki && a.gender_id == kane && a.award_category_id == oli,
                                                            KeikiWahineOli = a => a.age_id == keiki && a.gender_id == wahine && a.award_category_id == oli,
                                                            OpioKaneOli = a => a.age_id == opio && a.gender_id == kane && a.award_category_id == oli,
                                                            OpioWahineOli = a => a.age_id == opio && a.gender_id == wahine && a.award_category_id == oli,
                                                            Music = a => a.award_category_id == music,
                    //Overall
                                                            KaneOverall = a => a.gender_id == kane && a.award_category_id == overall,
                                                            WahineOverall = a => a.gender_id == wahine && a.award_category_id == overall;

            }
        }
        public class CompiledQueries
        {
            public static readonly Func<HONKDBDataContext, Func<vw_AwardCandidate, bool>, DateTime, IEnumerable<vw_AwardCandidate>> AwardCandidates
                = CompiledQuery.Compile((HONKDBDataContext db, Func<vw_AwardCandidate, bool> WhereClause, DateTime date) =>
                    (db.vw_AwardCandidates
                     .Where(WhereClause)
                        //.Where(ac => ac.entry_date.Year == date.Year)
                     .OrderByDescending(ac => ac.score)
                     .ThenByDescending(ac => ac.score_tie)
                     .Select(ac => ac)));
        }



        // LINQ METHODS

        public static bool MasterScoreExist(int contestant_id)
        {
            using (HONKDBDataContext db = new HONKDBDataContext())
            {
                return db.MasterScores.Where(c => c.contestant_id == contestant_id).Any();
            }
        }

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
        public static void IntializeAwardCategory()
        {
            HONKDBDataContext db = new HONKDBDataContext();
            List<string> category = new List<string>();
            category.Add("Interview");
            category.Add("Costume Auana");
            category.Add("Costume Kahiko");
            category.Add("Costume Palua");
            category.Add("Hula");
            category.Add("Oli");
            category.Add("Music");
            category.Add("Overall");
            category.Sort();

            foreach (string c in category)
            {
                AwardCategory award_category = new AwardCategory();
                award_category.category = c;
                db.AwardCategories.InsertOnSubmit(award_category);
            }
            try
            {
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
        }
        public static void IntializeAwards()
        {
            HONKDBDataContext db = new HONKDBDataContext();
            List<Award> awards = new List<Award>();

            awards.Add(new Award { awardcategory_id = 5, title = "The Keiki Interview Award" });
            awards.Add(new Award { awardcategory_id = 5, title = "The ‘Ōpio Interview Award" });
            awards.Add(new Award { awardcategory_id = 2, title = "The Keiki Kahiko Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 2, title = "The ‘Ōpio Kahiko Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 1, title = "The Keiki ‘Auana Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 1, title = "The ‘Ōpio ‘Auana Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 3, title = "The Keiki Pālua Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 3, title = "The ‘Opio Pālua Costume & Adornment Award" });
            awards.Add(new Award { awardcategory_id = 8, title = "The Keiki Pālua" });
            awards.Add(new Award { awardcategory_id = 8, title = "The ‘Ōpio  Pālua" });
            awards.Add(new Award { awardcategory_id = 7, title = "The Keiki Kāne Oli Award" });
            awards.Add(new Award { awardcategory_id = 7, title = "The Keiki Wahine Oli Award" });
            awards.Add(new Award { awardcategory_id = 7, title = "The ‘Ōpio Kāne Oli Award" });
            awards.Add(new Award { awardcategory_id = 7, title = "The ‘Ōpio Wahine Oli Award" });
            awards.Add(new Award { awardcategory_id = 6, title = "The Music Award" });
            awards.Add(new Award { awardcategory_id = 4, title = "The Keiki Kāne Hula Award" });
            awards.Add(new Award { awardcategory_id = 4, title = "The Keiki Wahine Hula Award" });
            awards.Add(new Award { awardcategory_id = 4, title = "The ‘Ōpio Kāne Hula Award" });
            awards.Add(new Award { awardcategory_id = 4, title = "The ‘Ōpio Wahine Hula Award" });
            awards.Add(new Award { awardcategory_id = 8, title = "The Overall Kāne Award" });
            awards.Add(new Award { awardcategory_id = 8, title = "The Overall Wāhine Award" });

            db.Awards.InsertAllOnSubmit(awards);

            try
            {
                db.SubmitChanges();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }

        }

        /// <summary>
        /// Method for updating a Contestant Individual Judge Score. Gender is NOT Palua
        /// </summary>
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
                js.interview = HonkExtension.StringToDec(interview);
                js.costume_auana = HonkExtension.StringToDec(costume_auana);
                js.costume_kahiko = HonkExtension.StringToDec(costume_kahiko);
                js.hula_auana = HonkExtension.StringToDec(hula_auana);
                js.hula_kahiko = HonkExtension.StringToDec(hula_kahiko);

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
        /// <summary>
        /// Method for updating a Palua Contestant's Individual Judge Score. Gender is Palua
        /// </summary>
        /// <param name="contestant_id"></param>
        /// <param name="judge_id"></param>
        /// <param name="hula_palua"></param>
        /// <param name="costume_palua"></param>
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
                js.costume_palua = HonkExtension.StringToDec(costume_palua);
                js.hula_palua = HonkExtension.StringToDec(hula_palua);

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
                js.interview = HonkExtension.StringToDec(interview);

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

        // LINQ DB DELETE METHODS
        public static void DeleteContestant(int contestant_id)
        {
            using (HONKDBDataContext db = new HONKDBDataContext())
            {
                var contestant = (from c in db.Contestants
                                  where c.id == contestant_id
                                  select c).FirstOrDefault();

                foreach (JudgeScore js in contestant.JudgeScores)
                {
                    db.JudgeScores.DeleteOnSubmit(js);
                }

                foreach (MasterScore ms in contestant.MasterScores)
                {
                    db.MasterScores.DeleteOnSubmit(ms);
                }

                db.Contestants.DeleteOnSubmit(contestant);
                db.SubmitChanges();
            }
        }
        

        /****************************************************/
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

        public static Decimal? StringToDec(string value)
        {
            if (!String.IsNullOrEmpty(value)) return Convert.ToDecimal(value);
            else return null;
        }
    }

}

