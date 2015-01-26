<%@ page import="com.partytime.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="true" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'bornDate', 'error')} ">
	<label for="bornDate">
		<g:message code="user.bornDate.label" default="Born Date" />
	</label>
	<g:datePicker name="bornDate" precision="day"  value="${userInstance?.bornDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="true" value="${userInstance?.mail}" style="width:400px"/>

</div>
