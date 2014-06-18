
<%@ page import="com.partytime.QuickParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quickParty.label', default: 'QuickParty')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-quickParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-quickParty" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list quickParty">
			
				<g:if test="${quickPartyInstance?.host}">
				<li class="fieldcontain">
					<span id="host-label" class="property-label"><g:message code="quickParty.host.label" default="Host" /></span>
					
						<span class="property-value" aria-labelledby="host-label"><g:link controller="user" action="show" id="${quickPartyInstance?.host?.id}">${quickPartyInstance?.host?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="quickParty.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:link controller="place" action="show" id="${quickPartyInstance?.place?.id}">${quickPartyInstance?.place?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="quickParty.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${quickPartyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.startDateTime}">
				<li class="fieldcontain">
					<span id="startDateTime-label" class="property-label"><g:message code="quickParty.startDateTime.label" default="Start Date Time" /></span>
					
						<span class="property-value" aria-labelledby="startDateTime-label"><g:formatDate date="${quickPartyInstance?.startDateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.finsishDateTime}">
				<li class="fieldcontain">
					<span id="finsishDateTime-label" class="property-label"><g:message code="quickParty.finsishDateTime.label" default="Finsish Date Time" /></span>
					
						<span class="property-value" aria-labelledby="finsishDateTime-label"><g:formatDate date="${quickPartyInstance?.finsishDateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.meetingPoint}">
				<li class="fieldcontain">
					<span id="meetingPoint-label" class="property-label"><g:message code="quickParty.meetingPoint.label" default="Meeting Point" /></span>
					
						<span class="property-value" aria-labelledby="meetingPoint-label"><g:fieldValue bean="${quickPartyInstance}" field="meetingPoint"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${quickPartyInstance?.guests}">
				<li class="fieldcontain">
					<span id="guests-label" class="property-label"><g:message code="quickParty.guests.label" default="Guests" /></span>
					
						<g:each in="${quickPartyInstance.guests}" var="g">
						<span class="property-value" aria-labelledby="guests-label"><g:link controller="user" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:quickPartyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${quickPartyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
