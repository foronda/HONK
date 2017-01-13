<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Application.aspx.cs" Inherits="HONK_v2.Application" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h3 class="well-sm">Soloist Haumana Application</h3>--%>
    <div class="wrapper wrapper-content animated fadeIn">
        <div class="row">
            <div class="col-lg-6">
                <div class="panel-body">
                    <%--<strong>Lorem ipsum dolor sit amet, consectetuer adipiscing</strong>--%>

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>Soloist Haumana Information (Pt.1)</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title">
                                            <h5><small>Keiki entrants must be 5 to 12 years old on or before <strong>November 10, 2017</strong>. 
                                            ‘Ōpio entrants must be 13 to 17 years old on or before <strong>November 10, 2017</strong>.
                                            </small></h5>
                                        </div>
                                        <div class="ibox-content">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Hula Division</label>
                                                    <div class="col-sm-9">
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
                                                    <label class="col-sm-3 control-label">Entrant's Inoa</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                        <span class="help-block m-b-none">The above is the preferred name to be used in all publications. Hotel reserves the right to make adjustments based on printing space.</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Hālau Inoa</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Kumu Inoa</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">School Attending</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Grade</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Parents/Guardians</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Contact Numbers</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Parent/Guardian Email Address</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="hr-line-dashed"></div>
                                                <div class="form-group">
                                                    <div class="col-sm-4 col-sm-offset-2">
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
                        <div class="panel-footer">
                            <strong>Deadline to submit:  July 1, 2017</strong>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-6">
                <div class="panel-body">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>Soloist Haumana Information (Pt.2)</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title">
                                            <h5>HULA KAHIKO INFO:<small></small></h5>
                                        </div>
                                        <div class="ibox-content">
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Title of Oli</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Oli Style</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Title of Ka‘i</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Title of Ho‘i</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <label class="control-label">What will the ho‘opa‘a use as the accomplaniment?</label>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <textarea class="form-control input-lg" rows="5"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <label class="control-label">If applicant is using an implement in the hula, describe how it will be used:</label>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <textarea class="form-control input-lg" rows="5"></textarea>
                                                    </div>
                                                </div>
                                                 <div class="form-group">
                                                    <div class="row">
                                                        <label class="control-label">Why was the oli selected for this presentation?</label>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <textarea class="form-control input-lg" rows="5"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-title">
                                            <h5>HULA ‘AUANA INFO:
                                            </h5>
                                            <small>Any hapa haole song that was composed between <strong>1929-1959</strong> cannot be duplicated by another hālau as a ka‘i/ho‘i or main mele. Provide words and arrangement to all mele by <strong>August 1, 2017.</strong></small>

                                        </div>
                                        <div class="ibox-content">
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">School Attending</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Grade</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Parents/Guardians</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Contact Numbers</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-3 control-label">Parent/Guardian Email Address</label>
                                                    <div class="col-sm-9">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button class="btn btn-white" type="submit">Cancel</button>
                                    <button class="btn btn-primary" type="submit">Save changes</button>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <strong>Deadline to submit:  August 1, 2017</strong>
                        </div>
                    </div>
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
