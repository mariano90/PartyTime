<%@ page import="com.partytime.QuickParty" %>



<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'host', 'error')} required">
	<label for="host">
		<g:message code="quickParty.host.label" default="Host" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="host" name="host.id" from="${com.partytime.User.list()}" optionKey="id" required="" value="${quickPartyInstance?.host?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="quickParty.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'startDateTime', 'error')} required">
	<label for="startDateTime">
		<g:message code="quickParty.startDateTime.label" default="Start Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDateTime" precision="day"  value="${quickPartyInstance?.startDateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'finsishDateTime', 'error')} required">
	<label for="finsishDateTime">
		<g:message code="quickParty.finsishDateTime.label" default="Finsish Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finsishDateTime" precision="day"  value="${quickPartyInstance?.finsishDateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="quickParty.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${quickPartyInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'guests', 'error')} ">
	<label for="guests">
		<g:message code="quickParty.guests.label" default="Guests" />
		
	</label>
	<g:select name="guests" from="${com.partytime.User.list()}" multiple="multiple" optionKey="id" size="5" value="${quickPartyInstance?.guests*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: quickPartyInstance, field: 'meetingPoint', 'error')} required">
	<label for="meetingPoint">
		<g:message code="quickParty.meetingPoint.label" default="Meeting Point" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="meetingPoint" required="" value="${quickPartyInstance?.meetingPoint}"/>

</div>

