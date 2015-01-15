<%@ page import="com.partytime.PublicEvent" %>



<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="publicEvent.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${publicEventInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="publicEvent.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${publicEventInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'lineup', 'error')} ">
	<label for="lineup">
		<g:message code="publicEvent.lineup.label" default="Lineup" />
		
	</label>
	<g:textField name="lineup" value="${publicEventInstance?.lineup}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'startDateTime', 'error')} required">
	<label for="startDateTime">
		<g:message code="publicEvent.startDateTime.label" default="Start Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDateTime" precision="day"  value="${publicEventInstance?.startDateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'externalUrl', 'error')} ">
	<label for="externalUrl">
		<g:message code="publicEvent.externalUrl.label" default="External Url" />
		
	</label>
	<g:textField name="externalUrl" value="${publicEventInstance?.externalUrl}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="publicEvent.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${publicEventInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: publicEventInstance, field: 'minimumAge', 'error')} required">
	<label for="minimumAge">
		<g:message code="publicEvent.minimumAge.label" default="Minimum Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minimumAge" type="number" value="${publicEventInstance.minimumAge}" required=""/>

</div>

