
<%@ page import="com.partytime.PublicEvent"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'publicEvent.label', default: 'Public Events')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-publicEvent" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.publicEvent.label" default="Public Event" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list publicEvent">

			<g:if test="${publicEventInstance?.title}">
				<li class="fieldcontain"><span id="title-label"
					class="property-label"><g:message
							code="publicEvent.title.label" default="Title" /></span> <span
					class="property-value" aria-labelledby="title-label"><g:fieldValue
							bean="${publicEventInstance}" field="title" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.description}">
				<li class="fieldcontain"><span id="description-label"
					class="property-label"><g:message
							code="publicEvent.description.label" default="Description" /></span> <span
					class="property-value" aria-labelledby="description-label"><g:fieldValue
							bean="${publicEventInstance}" field="description" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.lineup}">
				<li class="fieldcontain"><span id="lineup-label"
					class="property-label"><g:message
							code="publicEvent.lineup.label" default="Lineup" /></span> <span
					class="property-value" aria-labelledby="lineup-label"><g:fieldValue
							bean="${publicEventInstance}" field="lineup" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.startDateTime}">
				<li class="fieldcontain"><span id="startDateTime-label"
					class="property-label"><g:message
							code="publicEvent.startDateTime.label" default="Start Date Time" /></span>

					<span class="property-value" aria-labelledby="startDateTime-label"><g:formatDate
							date="${publicEventInstance?.startDateTime}" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.externalUrl}">
				<li class="fieldcontain"><span id="externalUrl-label"
					class="property-label"><g:message
							code="publicEvent.externalUrl.label" default="External Url" /></span> <span
					class="property-value" aria-labelledby="externalUrl-label"><g:fieldValue
							bean="${publicEventInstance}" field="externalUrl" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.address}">
				<li class="fieldcontain"><span id="address-label"
					class="property-label"><g:message
							code="publicEvent.address.label" default="Address" /></span> <span
					class="property-value" aria-labelledby="address-label"><g:fieldValue
							bean="${publicEventInstance}" field="address" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.minimumAge}">
				<li class="fieldcontain"><span id="minimumAge-label"
					class="property-label"><g:message
							code="publicEvent.minimumAge.label" default="Minimum Age" /></span> <span
					class="property-value" aria-labelledby="minimumAge-label"><g:fieldValue
							bean="${publicEventInstance}" field="minimumAge" /></span></li>
			</g:if>

		</ol>
		<g:form url="[resource:publicEventInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${publicEventInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
