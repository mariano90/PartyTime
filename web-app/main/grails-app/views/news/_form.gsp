<%@ page import="com.partytime.News" %>



<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="news.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${newsInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="news.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${newsInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="news.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${newsInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'imageUrl', 'error')} ">
	<label for="imageUrl">
		<g:message code="news.imageUrl.label" default="Image Url" />
		
	</label>
	<g:textField name="imageUrl" value="${newsInstance?.imageUrl}"/>

</div>

