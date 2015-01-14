<%@ page import="com.partytime.MusicStyle" %>



<div class="fieldcontain ${hasErrors(bean: musicStyleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="musicStyle.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="name" from="${musicStyleInstance.constraints.name.inList}" required="" value="${musicStyleInstance?.name}" valueMessagePrefix="musicStyle.name"/>

</div>

