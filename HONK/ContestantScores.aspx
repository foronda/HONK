<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContestantScores.aspx.cs" Inherits="HONK.ContestantScores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <h1>Contestants Scores</h1>
            </div>
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Select Contestant: </label>
        <div class="col-sm-4">
            <asp:DropDownList ID="ConstestantDDL" runat="server" DataSourceID="ContestantLDS" DataTextField="full_name" DataValueField="id" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ConstestantDDL_SelectedIndexChanged">
                <asp:ListItem Text="Select Contestant" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <label class="col-sm-2">Entry Year:</label>
        <div class="col-sm-4">
            <asp:Label ID="EntryYearLbl" runat="server" Text="2014"></asp:Label>
        </div>
    </div>
    <asp:FormView ID="ContestantScoresFV" runat="server" DefaultMode="Edit" DataSourceID="ContestantScoreDetailsLDS" Visible="false">
        <EditItemTemplate>
            <hr />
            <h4>Contestant Judges Scores</h4>
            <hr />
            <div class="row form-group">
                <label class="col-sm-1 col-sm-offset-2">Score 1</label>
                <label class="col-sm-1">Score 2</label>
                <label class="col-sm-1">Score 3</label>
                <label class="col-sm-1">Score 4</label>
                <label class="col-sm-1">Score 5</label>
                <label class="col-sm-1">Score 6</label>
                <label class="col-sm-1">Score 7</label>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Interview: </label>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview2" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview3" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview4" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview5" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview6" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeInterview7" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Costume (Auana): </label>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA2" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA3" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA4" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA5" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeA6" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Costume (Kahiko): </label>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK2" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK3" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK4" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK5" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeCostumeK6" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Hula (Auana): </label>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA2" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA3" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA4" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA5" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaA6" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Hula (Kahiko): </label>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK1" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK2" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK3" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK4" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK5" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1">
                    <asp:TextBox ID="judgeHulaK6" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
        </EditItemTemplate>
    </asp:FormView>
    <asp:FormView ID="ContestantMasterScoreFV" runat="server" DefaultMode="Edit" DataSourceID="MasterScoresLDS" 
        OnItemInserting="ContestantMasterScoreFV_ItemInserting">
        <InsertItemTemplate>
            <hr />
            <h4>Contestant Master Scores</h4>
            <hr />
            <div class="row form-group">
                <label class="col-sm-2">Palapala: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Interview: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Costume (Auana): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Costume (Kahiko): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Oli: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Hula (Auana): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                </div>
                <label class="col-sm-2">Deduction for Overtime: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Hula (Kahiko): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                </div>
                <label class="col-sm-2">Deduction for Overtime: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                </div>
            </div>

            <div class="row form-group">
                <label class="col-sm-2">Music: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                </div>
            </div>
        </InsertItemTemplate>
        <EditItemTemplate>
            <hr />
            <h4>Contestant Master Scores</h4>
            <hr />
            <div class="row form-group">
                <label class="col-sm-2">Palapala: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Interview: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Costume (Auana): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Costume (Kahiko): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Oli: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Hula (Auana): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                </div>
                <label class="col-sm-2">Deduction for Overtime: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Total Hula (Kahiko): </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                </div>
                <label class="col-sm-2">Deduction for Overtime: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <label class="col-sm-2">Music: </label>
                <div class="col-sm-4">
                    <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" />
                </div>
            </div>
        </EditItemTemplate>
    </asp:FormView>


    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="JudgeScores">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="MasterScoresLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="MasterScores" Where="contestant_id == @contestant_id" OnSelecting="MasterScoresLDS_Selecting">
        <WhereParameters>
            <asp:ControlParameter ControlID="ConstestantDDL" DefaultValue="0" Name="contestant_id" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ContestantLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="full_name" Select="new (id, full_name)" TableName="Contestants"></asp:LinqDataSource>
    <asp:LinqDataSource ID="ContestantScoreDetailsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_ContestantScoreDetails" OnSelecting="ContestantScoreDetailsLDS_Selecting" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
</asp:Content>
