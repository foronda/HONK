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
    </div>
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
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Costume (Auana): </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Costume (Kahiko): </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Hula (Auana): </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Hula (Kahiko): </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <hr />
    <div class="row form-group">
        <label class="col-sm-2">Palapala: </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <div class="row form-group">
        <label class="col-sm-2">Actual Interview Score: </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
        <div class="col-sm-1">
            <input type="text" class="form-control" />
        </div>
    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="JudgeScores">
    </asp:LinqDataSource>
</asp:Content>
