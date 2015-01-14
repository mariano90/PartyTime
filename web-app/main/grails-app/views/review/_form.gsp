<%@ page import="com.partytime.Review" %>



<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="review.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${reviewInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'body', 'error')} required">
	<label for="body">
		<g:message code="review.body.label" default="Body" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="body" required="" value="${reviewInstance?.body}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="review.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="score" from="${1..5}" class="range" required="" value="${fieldValue(bean: reviewInstance, field: 'score')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: reviewInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="review.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${com.partytime.User.list()}" optionKey="id" required="" value="${reviewInstance?.author?.id}" class="many-to-one"/>

</div>

