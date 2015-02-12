<%@ page import="com.partytime.Review" %>
<%@ page import="com.partytime.User" %>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'title', 'error')} required">
  <g:message code="review.title.label" default="Title" />
  <span class="required-indicator">*</span>
  <g:textField name="title" required=""
      value="${reviewInstance?.title}"
      style="margin-left: 50px; width: 400px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'body', 'error')} required">
  <g:message code="review.body.label" default="Body" />
  <span class="required-indicator">*</span>
  <g:textField
      name="body"
      required="" value="${reviewInstance?.body}"
      style="margin-left: 43px; width: 400px;"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'score', 'error')} required">
  <g:message code="review.score.label" default="Score" />
  <span class="required-indicator">*</span>
  <g:select
      name="score" from="${5..1}" class="range"
      required="" value="${fieldValue(bean: reviewInstance, field: 'score')}"
      style="margin-left: 37px;"/>
</div>

<g:hiddenField id="author" name="author.id" value="${User.getMyUser().id}"/>
<g:hiddenField name="targetBar" value="${targetBar}"/>

