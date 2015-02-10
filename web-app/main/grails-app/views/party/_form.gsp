<%@ page import="com.partytime.Party" %>



<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'host', 'error')} required">
	<label for="host">
		<g:message code="party.host.label" default="Host" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="host" name="host.id" from="${com.partytime.User.list()}" optionKey="id" required="" value="${partyInstance?.host?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'place', 'error')} required">
	<label for="place">
		<g:message code="party.place.label" default="Place" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="place" name="place.id" from="${com.partytime.Bar.list()}" optionKey="id" required="" value="${partyInstance?.place?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="party.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${partyInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'startDateTime', 'error')} required">
	<label for="startDateTime">
		<g:message code="party.startDateTime.label" default="Start Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDateTime" precision="day"  value="${partyInstance?.startDateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'finsishDateTime', 'error')} ">
	<label for="finsishDateTime">
		<g:message code="party.finsishDateTime.label" default="Finsish Date Time" />
		
	</label>
	<g:datePicker name="finsishDateTime" precision="day"  value="${partyInstance?.finsishDateTime}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="party.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${partyInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: partyInstance, field: 'guestsInvited', 'error')} ">
	<label for="guestsInvited">
		<g:message code="party.guestsInvited.label" default="Guests" />
		
	</label>
	<g:select name="guestsInvited" from="${com.partytime.User.list()}" multiple="multiple" optionKey="id" size="5" value="${partyInstance?.guestsInvited*.id}" class="many-to-many"/>

</div>

