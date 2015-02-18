<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContestantScores.aspx.cs" Inherits="HONK.ContestantScores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- START PAGE HEADER --%>
    <div class="page-header">
        <div class="row">
            <div class="col-lg-12">
                <h1>Contestants Scores</h1>
            </div>
        </div>
    </div>
    <%-- END PAGE HEADER --%>

    <%-- START CONTESTANT DROPDOWN --%>
    <div class="well well-lg">
        <div class="row form-group">
            <label class="col-sm-2 control-label">Select Contestant: </label>
            <div class="col-sm-4">
                <asp:DropDownList ID="ContestantDDL" runat="server" DataSourceID="ContestantLDS" DataTextField="full_name" DataValueField="id" AppendDataBoundItems="true" AutoPostBack="true" CssClass="form-control " OnSelectedIndexChanged="ConstestantDDL_SelectedIndexChanged">
                    <asp:ListItem Text="Select Contestant" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <label class="col-sm-2 control-label">Entry Year:</label>
            <div class="col-sm-4">
                <asp:Label ID="EntryYearLbl" runat="server" Text="2014"></asp:Label>
            </div>
        </div>
    </div>
    <%-- END CONTESTANT DROPDOWN --%>

    <%-- JUDGES SCORES PANEL --%>
    <div runat="server" id="divJudgeScores" class="panel panel-default" visible="false">
        <div class="panel-heading">
            <h3 class="panel-title">Judges Scores</h3>
        </div>
        <div class="panel-body">
            <asp:FormView ID="ContestantScoresFV" runat="server" DefaultMode="ReadOnly" DataSourceID="ContestantScoreDetailsLDS" CssClass="col-lg-12">
                <EditItemTemplate>
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
                        <label class="col-sm-2 control-label">Interview: </label>
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
                        <label class="col-sm-2 control-label">Costume (Auana): </label>
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
                        <label class="col-sm-2 control-label">Costume (Kahiko): </label>
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
                        <label class="col-sm-2 control-label">Hula (Auana): </label>
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
                        <label class="col-sm-2 control-label">Hula (Kahiko): </label>
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

        </div>
    </div>
    <%-- END JUDGES SCORES PANEL --%>

    <%-- MASTER SCORES PANEL --%>
    <div runat="server" id="divMasterScores" class="panel panel-default" visible="false">
        <div class="panel-heading" role="tab">
            <h3 class="panel-title">Master Scores</h3>
        </div>
        <div class="panel-body" id="collapseExample">
            <asp:FormView ID="ContestantMasterScoreFV" runat="server" DataSourceID="MasterScoresLDS" DefaultMode="ReadOnly" DataKeyNames="id"
                OnItemInserting="ContestantMasterScoreFV_ItemInserting">
                <InsertItemTemplate>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Palapala: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Interview: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <span class="badge alert-danger">
                                <asp:Label runat="server" ID="masterInterviewTie"></asp:Label></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Costume (Auana): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Costume (Kahiko): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Oli: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Hula (Auana): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                        </div>
                        <label class="col-sm-3 control-label">Deduction for Overtime: </label>
                        <div class="col-sm-2">
                            <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Hula (Kahiko): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                        </div>
                        <label class="col-sm-3 control-label">Deduction for Overtime: </label>
                        <div class="col-sm-2">
                            <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Music: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Out of Order Deduction: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%# Bind("out_of_order_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Palapala: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterPalapala" runat="server" class="form-control" Text='<%# Bind("palapala") %>'></asp:TextBox>
                        </div>

                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Interview: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterInterview" runat="server" class="form-control" Text='<%# Bind("interview") %>'></asp:TextBox>
                        </div>
                        <div class="col-sm-2">
                            <span class="badge alert-danger">
                                <asp:Label runat="server" ID="masterInterviewTie"></asp:Label></span>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Costume (Auana): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterCostumeA" runat="server" class="form-control" Text='<%# Bind("costume_auana") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Costume (Kahiko): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterCostumeK" runat="server" class="form-control" Text='<%# Bind("costume_kahiko") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Oli: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterOli" runat="server" class="form-control" Text='<%# Bind("oli") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Hula (Auana): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterHulaA" runat="server" class="form-control" Text='<%# Bind("hula_auana") %>'></asp:TextBox>
                        </div>
                        <label class="col-sm-3 control-label">Deduction for Overtime: </label>
                        <div class="col-sm-2">
                            <asp:TextBox ID="masterHulaADed" runat="server" class="form-control" Text='<%# Bind("hula_auana_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Total Hula (Kahiko): </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterHulaK" runat="server" class="form-control" Text='<%# Bind("hula_kahiko") %>'></asp:TextBox>
                        </div>
                        <label class="col-sm-3 control-label">Deduction for Overtime: </label>
                        <div class="col-sm-2">
                            <asp:TextBox ID="masterHulaKDed" runat="server" class="form-control" Text='<%# Bind("hula_kahiko_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Music: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="masterMusic" runat="server" class="form-control" Text='<%# Bind("music") %>'></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-sm-3 control-label">Out of Order Deduction: </label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" Text='<%# Bind("out_of_order_deduction") %>'></asp:TextBox>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:FormView>
        </div>
    </div>
    <%-- END MASTER SCORES PANEL --%>

    <a id="SubmitBtn" runat="server" href="#" class="btn btn-primary btn-block" onserverclick="SubmitBtn_ServerClick" visible="false">Submit Scores</a>

    <asp:FormView ID="FormView1" runat="server" DataSourceID="ContestantLDS">
        <ItemTemplate>
            <div class="form-group">
                <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                    <span style="opacity: 1; left: 417px; top: 13px; width: 19px; min-width: 19px; height: 13px; position: absolute; border: none; display: inline; visibility: visible; z-index: auto; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAANCAYAAABLjFUnAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMmlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjarZG9SsNQGIaf04qCQxAJbsLBQVzEn61j0pYiONQokmRrkkMVbXI4Of508ia8CAcXR0HvoOIgOHkJboI4ODgECU4i+EzP9w4vL3zQWPE6frcxB6PcmqDnyzCK5cwj0zQBYJCW2uv3twHyIlf8RMD7MwLgadXr+F3+xmyqjQU+gc1MlSmIdSA7s9qCuATc5EhbEFeAa/aCNog7wBlWPgGcpPIXwDFhFIN4BdxhGMXQAHCTyl3AtercArQLPTaHwwMrN1qtlvSyIlFyd1xaNSrlVp4WRhdmYFUGVPuq3Z7Wx0oGPZ//JYxiWdnbDgIQC5M6q0lPzOn3D8TD73fdMb4HL4Cp2zrb/4DrNVhs1tnyEsxfwI3+AvOlUD7FY+VVAAAAIGNIUk0AAHolAACAgwAA9CUAAITRAABtXwAA6GwAADyLAAAbWIPnB3gAAAECSURBVHjapNK9K8UBFIfxD12im8LEYLgZjcpgUFgUCUlZTJRkMpqUxR+hDFIGhWwGwy0MFiUxSCbZ5DXiYjnqdvvpvnim0+mcZ/ieU9U6tySBNEbQjBpMoANZnGIdl4VLKcm8YCPqbgzhAT1ox1mSrFpxjtCHLdygH5tJgymlMYhhtKH+r6FishYsYBpN0dvFHu5wi9okWToC/0AmcpqM+pd7PKMRDajDNb5xlS97Qyem0BsL8IT9uOAhXpGLvL/wGXO5fFkOO7FwHvJtLOOilGALM8vE1d6xiFVlkP8aXTjAI8bKFeXLBuJ3shjFiQpIYR6zWMFaXFOlsnHM4Ng/+RkAdVE2mEeC7WYAAAAASUVORK5CYII=); background-position: 0px 0px; background-repeat: no-repeat;"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                <div class="col-lg-10">
                    <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox">
                            Checkbox
                        </label>
                        &nbsp;
                    </div>
                    <span style="opacity: 1; left: 417px; top: 13px; width: 19px; min-width: 19px; height: 13px; position: absolute; border: none; display: inline; visibility: visible; z-index: auto; background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAANCAYAAABLjFUnAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMmlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjarZG9SsNQGIaf04qCQxAJbsLBQVzEn61j0pYiONQokmRrkkMVbXI4Of508ia8CAcXR0HvoOIgOHkJboI4ODgECU4i+EzP9w4vL3zQWPE6frcxB6PcmqDnyzCK5cwj0zQBYJCW2uv3twHyIlf8RMD7MwLgadXr+F3+xmyqjQU+gc1MlSmIdSA7s9qCuATc5EhbEFeAa/aCNog7wBlWPgGcpPIXwDFhFIN4BdxhGMXQAHCTyl3AtercArQLPTaHwwMrN1qtlvSyIlFyd1xaNSrlVp4WRhdmYFUGVPuq3Z7Wx0oGPZ//JYxiWdnbDgIQC5M6q0lPzOn3D8TD73fdMb4HL4Cp2zrb/4DrNVhs1tnyEsxfwI3+AvOlUD7FY+VVAAAAIGNIUk0AAHolAACAgwAA9CUAAITRAABtXwAA6GwAADyLAAAbWIPnB3gAAAEBSURBVHjapNK9K4UBFMfxD12im8JkMdyMRmUwKCyKhKQsJspgcjerxR+hDFIGhWwGwy0MFiUxSCbZ5DXiYjnqSY/ui+90Op3zHX7n1OTzeSlkMYpW1GESnSjgBGu4+L2Ukc4z1qPuwTDu0YsOnKbJapXmEP3YxDUGsJE2mFEeQxhBOxr/Giola8MCZtASvR3s4hY3qE+TZSPwd+Qip6mof7jDE5rRhAZc4QuXSdkrujCNvliAR+zFBQ/wgmLk/YmPmCsmZUVsx8JZyLewhPNygv2dWS6u9oZFrKiA5Gt0Yx8PGK9UlJQNxu8UMIZjVZDBPOawjNW4pmplE5jFkX/yPQDFYTbukzAYUgAAAABJRU5ErkJggg==); background-position: 0px 0px; background-repeat: no-repeat;"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                <div class="col-lg-10">
                    <textarea class="form-control" rows="3" id="textArea"></textarea>
                    <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">Radios</label>
                <div class="col-lg-10">
                    <div class="radio">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                            Option one is this
                        </label>
                        &nbsp;
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                            Option two can be something else
                        </label>
                        &nbsp;
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="select" class="col-lg-2 control-label">Selects</label>
                <div class="col-lg-10">
                    <select class="form-control" id="select">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                    <br>
                    <select multiple="" class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2">
                    <button type="reset" class="btn btn-default">Cancel</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>

        </ItemTemplate>
    </asp:FormView>

    <%-- START OF LINQ DECLARATIONS --%>
    <asp:LinqDataSource ID="MasterScoresLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="MasterScores" Where="contestant_id == @contestant_id" OnSelected="MasterScoresLDS_Selected">
        <WhereParameters>
            <asp:ControlParameter ControlID="ContestantDDL" DefaultValue="0" Name="contestant_id" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
        <InsertParameters>
            <asp:Parameter Name="interview" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="oli" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="out_of_order_deduction" ConvertEmptyStringToNull="true" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="interview" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="oli" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_auana_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_kahiko_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="hula_palua_deduction" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_auana" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_kahiko" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="costume_palua" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="out_of_order_deduction" ConvertEmptyStringToNull="true" />
        </UpdateParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ContestantLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" OrderBy="full_name" Select="new (id, full_name)" TableName="Contestants"></asp:LinqDataSource>
    <asp:LinqDataSource ID="ContestantScoreDetailsLDS" runat="server" ContextTypeName="HONK.HONKDBDataContext" EntityTypeName="" TableName="vw_ContestantScoreDetails" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <%-- END OF LINQ DECLARATIONS --%>
</asp:Content>
