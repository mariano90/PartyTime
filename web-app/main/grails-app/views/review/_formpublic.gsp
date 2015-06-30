<%@ page import="com.partytime.Review" %>
<%@ page import="com.partytime.User" %>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'title', 'error')} required">
  <g:textField class="textField" style="margin-top:5px" placeholder="Title" name="title" required=""
      value="${reviewInstance?.title}"
      />
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'body', 'error')} required">
  <g:textField class="textField" style="margin-top:5px" placeholder="Description"
      name="body"
      required="" value="${reviewInstance?.body}"
      />
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'score', 'error')} required">
  <g:message code="review.score.label" default="Score" />
  <span class="required-indicator">*</span>
  <g:select
      name="score" from="${5..1}" class="range"
      required="" value="${fieldValue(bean: reviewInstance, field: 'score')}"
      style="margin-left: 37px;margin-top:5px"/>
</div>

<g:hiddenField id="author" name="author.id" value="${User.getMyUser().id}"/>
<g:hiddenField name="targetBar" value="${targetBar}"/>

