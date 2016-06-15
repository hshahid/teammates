<%@ tag description="instructorFeedbackEdit - feedback question feedback path settings" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="teammates.common.util.Const" %>
<%@ tag import="teammates.common.util.FieldValidator" %>
<%@ tag import="teammates.common.datatransfer.FeedbackParticipantType" %>

<%@ attribute name="fqForm" type="teammates.ui.template.FeedbackQuestionEditForm" required="true"%>

<div class="col-sm-12 padding-15px margin-bottom-15px background-color-light-green">
    <div class="col-sm-12 padding-0 margin-bottom-7px">
        <b class="feedback-path-title">Feedback Path</b> (Who is giving feedback about whom?)
    </div>
    <div class="feedback-path-dropdown btn-group">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Please select a feedback path&nbsp;<span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li class="dropdown-submenu">
                <a>I will give feedback on...</a>
                <ul class="dropdown-menu">
                    <li><a data-feedback-path-description="I will give feedback on --> the class in general">the class in general</a></li>
                    <li><a data-feedback-path-description="I will give feedback on --> myself">myself</a></li>
                    <li><a data-feedback-path-description="I will give feedback on --> every individual instructor in the course">every individual instructor in the course</a></li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a>Each student in the course will give feedback on...</a>
                <ul class="dropdown-menu">
                    <li><a data-feedback-path-description="Each student in the course will give feedback on --> the class in general">the class in general</a></li>
                    <li><a data-feedback-path-description="Each student in the course will give feedback on --> himself/herself">himself/herself</a></li>
                    <li><a data-feedback-path-description="Each student in the course will give feedback on --> every individual instructor in the course">every individual instructor in the course</a></li>
                    <li><a data-feedback-path-description="Each student in the course will give feedback on --> each of his/her teammates">each of his/her teammates</a></li>
                    <li><a data-feedback-path-description="Each student in the course will give feedback on --> each of his/her teammates (including himself/herself)">each of his/her teammates (including himself/herself)</a></li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a>Each instructor in the course will give feedback on...</a>
                <ul class="dropdown-menu">
                    <li><a data-feedback-path-description="Each instructor in the course will give feedback on --> the class in general">the class in general</a></li>
                    <li><a data-feedback-path-description="Each instructor in the course will give feedback on --> himself/herself">himself/herself</a></li>
                    <li><a data-feedback-path-description="Each instructor in the course will give feedback on --> every individual instructor in the course">every individual instructor in the course</a></li>
                    <li><a data-feedback-path-description="Each instructor in the course will give feedback on --> all instructors in general">all instructors in general</a></li>
                </ul>
            </li>
            <li class="dropdown-submenu">
                <a>Each team in the course will give feedback on...</a>
                <ul class="dropdown-menu">
                    <li><a data-feedback-path-description="Each team in the course will give feedback on --> every individual instructor in the course">every individual instructor in the course</a></li>
                    <li><a data-feedback-path-description="Each team in the course will give feedback on --> the team itself">the team itself</a></li>
                </ul>
            </li>
            <li role="separator" class="divider"></li>
            <li><a class="feedback-path-others-menu-option" data-feedback-path-description="Other options:">Other</a></li>
        </ul>
    </div>
    <div class="feedback-path-others">
        <div class="col-sm-12 col-lg-6 padding-0 margin-bottom-7px"
            data-toggle="tooltip" data-placement="top"
            title="<%= Const.Tooltips.FEEDBACK_SESSION_GIVER %>">
            <label class="col-sm-4 col-lg-5 control-label">
                Who will give the feedback:
            </label>
            <div class="col-sm-8 col-lg-7">
                <select class="form-control participantSelect"
                    id="<%= Const.ParamsNames.FEEDBACK_QUESTION_GIVERTYPE %>${fqForm.questionNumberSuffix}"
                    name="<%= Const.ParamsNames.FEEDBACK_QUESTION_GIVERTYPE %>"
                    <c:if test="${!fqForm.editable}">disabled</c:if>
                    onchange="feedbackGiverUpdateVisibilityOptions(this)">
                    <c:forEach items="${fqForm.feedbackPathSettings.giverParticipantOptions}" var="option">
                        <option ${option.attributesToString}>
                            ${option.content}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 padding-0 margin-bottom-7px" data-toggle="tooltip" data-placement="top"
            title="<%= Const.Tooltips.FEEDBACK_SESSION_RECIPIENT %>">
            <label class="col-sm-4 col-lg-5 control-label">
                Who the feedback is about:
            </label>
            <div class="col-sm-8 col-lg-7">
                <select class="form-control participantSelect"
                    id="<%= Const.ParamsNames.FEEDBACK_QUESTION_RECIPIENTTYPE %>${fqForm.questionNumberSuffix}"
                    name="<%= Const.ParamsNames.FEEDBACK_QUESTION_RECIPIENTTYPE %>"
                    <c:if test="${!fqForm.editable}">disabled</c:if> onchange="feedbackRecipientUpdateVisibilityOptions(this);getVisibilityMessageIfPreviewIsActive(this);">
                    <c:forEach items="${fqForm.feedbackPathSettings.recipientParticipantOptions}" var="option">
                        <option ${option.attributesToString}>
                            ${option.content}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-sm-12 row numberOfEntitiesElements${fqForm.questionIndexIfNonZero}">
            <label id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>_text-${fqForm.questionIndexIfNonZero}" class="control-label col-sm-4 small">
                The maximum number of <span id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>_text_inner-${fqForm.questionIndexIfNonZero}"></span> each respondant should give feedback to:
            </label>
            <div class="col-sm-8 form-control-static">
                <div class="col-sm-4 col-md-3 col-lg-2 margin-bottom-7px">
                    <input class="nonDestructive" type="radio"
                        name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIESTYPE %>"
                        <c:if test="${fqForm.feedbackPathSettings.numberOfEntitiesToGiveFeedbackToChecked}">checked</c:if>
                        value="custom" <c:if test="${!fqForm.editable}">disabled</c:if>>
                    <input class="nonDestructive numberOfEntitiesBox width-75-pc" type="number"
                        name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>"
                        id="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIES %>${fqForm.questionNumberSuffix}"
                        value="${fqForm.feedbackPathSettings.numOfEntitiesToGiveFeedbackToValue}"
                        min="1" max="250" <c:if test="${!fqForm.editable}">disabled</c:if>>
                </div>
                <div class="col-sm-4 col-md-3 col-lg-2 margin-bottom-7px">
                    <input class="nonDestructive" type="radio"
                        name="<%= Const.ParamsNames.FEEDBACK_QUESTION_NUMBEROFENTITIESTYPE %>"
                        <c:if test="${!fqForm.feedbackPathSettings.numberOfEntitiesToGiveFeedbackToChecked}">checked</c:if>
                        value="max" <c:if test="${!fqForm.editable}">disabled</c:if>>
                    <span class="">Unlimited</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="feedback-path-show-details row">
                <div class="col-sm-12"><a onclick="toggleCustom(this)">View details and further customizations</a></div>
            </div>
            <div hidden class="row" id="custom">
                <br>
                <div class="col-sm-2">
                    <p class="text-muted">The editable spreadsheet to the right shows the feedback paths.</p>
                    <p class="text-muted">Each row represents the feedback paths of a single giver to multiple recipients.</p>
                    <p class="text-muted">The first column contains the feedback giver and each of the subsequent columns contains a recipient.</p>
                </div>
                <div class="col-sm-2 form-horizontal">
                    <p><strong>Add rows and cols</strong></p>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Rows </label>
                        <div class="col-sm-9">
                            <input id="rows" type="number" class="form-control" placeholder="Rows">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Cols </label>
                        <div class="col-sm-9">
                            <input id="cols" type="number" class="form-control" placeholder="Cols">
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary col-sm-12" onclick="addNewRowsAndCols()">Add rows and cols</button>
                </div>
                <div class="col-sm-8">
                    <div id="example">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<br>
