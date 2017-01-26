<%@ Page Title="SOLOIST" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application.aspx.cs" Inherits="HONK_v2.Application" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1 style="text-align: center"><strong>HULA O NĀ KEIKI</strong></h1>
        <p class="lead" style="text-align: center"><%= DateTime.Now.Year %> Application Forms</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-large">Learn more &raquo;</a></p>--%>
    </div>
    <%--<h3 class="well-sm">Soloist Haumana Application</h3>--%>
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Application Deadlines</h5>
                    </div>
                    <div class="ibox-content inspinia-timeline">
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    July 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Soloist Haumana Bio Form</strong></p>
                                    <p>Keiki entrants must be 5 to 12 years old on or before November 10, 2017. ‘Ōpio entrants must be 13 to 17 years old on or before November 10, <%= DateTime.Now.Year %>.</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    July 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Soloist Parent Consent Form</strong></p>
                                    <p>Release and Permission to Publish Photographs or Project Films and Parent Consent</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    August 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Soloist Information Form</strong></p>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    August 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Song Sheets</strong></p>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    August 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Documentation to Support Theme</strong></p>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-file-text"></i>
                                    October 1, <%= DateTime.Now.Year %>
                                </div>
                                <div class="col-xs-7 content">
                                    <p class="m-b-xs"><strong>Costume & Adornment Form</strong></p>
                                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="tabs-container">
                    <div class="tabs">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1">Soloist Haumana Bio</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-2">Parent Consent Form</a></li>
                            <li class=""><a data-toggle="tab" href="#tab-3">Soloist Information Form</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane">
                                <div class="panel-body">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3>Soloist Haumana Bio <span class="small pull-right text-uppercase badge">Deadline to submit:  July 1, <%= DateTime.Now.Year %></span></h3>
                                        </div>
                                        <div class="panel-body">
                                            <p class="small alert alert-warning">
                                                Keiki entrants must be 5 to 12 years old on or before <strong>November 10, 2017</strong>. ‘Ōpio entrants must be 13 to 17 years old on or before <strong>November 10, 2017</strong>.
                                            </p>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Hula Division</label>
                                                        <div>
                                                            <select class="form-control m-b" name="account">
                                                                <option>Select Division</option>
                                                                <option>Keiki Kane</option>
                                                                <option>Keiki Wahine</option>
                                                                <option>Keiki Palua</option>
                                                                <option>Opio Kane</option>
                                                                <option>Opio Wahine</option>
                                                                <option>Opio Palua</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Entrant's Inoa</label>
                                                        <input type="text" class="form-control">
                                                        <span class="help-block m-b-none"><small>The above is the preferred name to be used in all publications. Hotel reserves the right to make adjustments based on printing space.</small></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Hālau Inoa</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Kumu Inoa</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <br />
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>School Attending</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Parents/Guardians</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Contact Number (Best)</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>T-Shirt Type</label>
                                                        <div class="i-checks">
                                                            <label>
                                                                <input type="radio" value="option1" name="a">
                                                                <i></i>Child
                                                            </label>
                                                        </div>
                                                        <div class="i-checks">
                                                            <label>
                                                                <input type="radio" checked="" value="option2" name="a">
                                                                <i></i>Adult
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Grade</label>
                                                        <select class="form-control m-b" name="account">
                                                            <option>Select Grade</option>
                                                            <option>Kindergarten</option>
                                                            <option>Grade 1</option>
                                                            <option>Grade 2</option>
                                                            <option>Grade 3</option>
                                                            <option>Grade 4</option>
                                                            <option>Grade 5</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Parent/Guardian Email Address</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Contact Number (2nd Best)</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>T-Shirt Size</label>
                                                        <select class="form-control m-b" name="account">
                                                            <option>Select Size</option>
                                                            <option>Small</option>
                                                            <option>Medium</option>
                                                            <option>Large</option>
                                                            <option>X-Large</option>
                                                            <option>2X-Large</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-sm-12">
                                                <div class="hr-line-dashed"></div>
                                                <div class="pull-right">
                                                    <button class="btn btn-white" type="submit">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save changes</button>
                                                </div>
                                            </div>
                                        </div>

                                        <%-- <div class="panel-footer">
                                            <strong class="text-danger">Deadline to submit:  July 1, 2017</strong>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3>Parent Consent Form <span class="small pull-right text-uppercase badge">Deadline to submit:  July 1, <%= DateTime.Now.Year %></span></h3>
                                        </div>
                                        <div class="panel-body">
                                        </div>
                                        <%-- <div class="panel-footer">
                                            <strong>Deadline to submit:  August 1, 2017</strong>
                                        </div>--%>
                                    </div>

                                </div>
                            </div>
                            <div id="tab-3" class="tab-pane active">
                                <div class="panel-body">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading">
                                            <h3>Soloist Information Form <span class="small pull-right text-uppercase badge">Deadline to submit:  August 1, <%= DateTime.Now.Year %></span></h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="col-sm-6">
                                                <div class="ibox float-e-margins">
                                                    <div class="ibox-title">
                                                        <h5>HULA KAHIKO INFO:<small></small></h5>
                                                    </div>
                                                    <div class="ibox-content">
                                                        <div class="form-horizontal">
                                                            <div class="form-group">
                                                                <label>Title of Oli</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Oli Style</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Title of Ka‘i</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Title of Ho‘i</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>What will the ho‘opa‘a use as the accomplaniment?</label>
                                                                <textarea class="form-control input-lg" rows="5"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>If applicant is using an implement in the hula, describe how it will be used:</label>
                                                                <textarea class="form-control input-lg" rows="5"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Why was the oli selected for this presentation?</label>
                                                                <textarea class="form-control input-lg" rows="5"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="ibox float-e-margins">
                                                    <div class="ibox-title">
                                                        <h5>HULA ‘AUANA INFO:
                                                        </h5>
                                                    </div>
                                                    <div class="ibox-content">
                                                        <div class="form-horizontal">
                                                            <div class="form-group">
                                                                <p class="alert alert-warning small">
                                                                    Any hapa haole song that was composed between <strong>1929-1959</strong> cannot be duplicated by another hālau as a ka‘i/ho‘i or main mele. Provide words and arrangement to all mele by <strong>August 1, 2017.</strong>
                                                                </p>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Title of Ka‘i & Ho‘i</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Composer</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Year Written</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Title of main Mele</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Composer</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Year Written</label>
                                                                <input type="text" class="form-control">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Who would you like to dedicate this competition’s performance to and why?</label>
                                                                <textarea class="form-control input-lg" rows="4"></textarea>

                                                            </div>
                                                            <div class="form-group">
                                                                <label>Describe a typical day in your papa hula.:</label>
                                                                <textarea class="form-control input-lg" rows="4"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Why do you dance hula?</label>
                                                                <textarea class="form-control input-lg" rows="4"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>What 3 things do you love most about your kumu hula and why?</label>
                                                                <textarea class="form-control input-lg" rows="4"></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="hr-line-dashed"></div>
                                                <div class="pull-right">
                                                    <button class="btn btn-white" type="submit">Cancel</button>
                                                    <button class="btn btn-primary" type="submit">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
                <div class="panel-body">
                    <%--<strong>Lorem ipsum dolor sit amet, consectetuer adipiscing</strong>--%>
                </div>

            </div>
            <div class="col-lg-6">
                <div class="panel-body">
                </div>

            </div>
            <%--<div class="col-lg-6">
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1">Soloish Haumana Information - Part 1</a></li>
                        <li class=""><a data-toggle="tab" href="#tab-2">Soloish Haumana Information - Part 2</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                        </div>
                        <div id="tab-2" class="tab-pane">
                            <div class="panel-body">
                                <strong>Donec quam felis</strong>

                                <p>
                                    Thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects
                                        and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath
                                </p>

                                <p>
                                    I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine. I am so happy, my dear friend, so absorbed in the exquisite
                                        sense of mere tranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
