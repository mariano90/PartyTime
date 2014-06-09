
<%@ page import="com.partytime.ScheduledParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scheduledParty.label', default: 'ScheduledParty')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-scheduledParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-scheduledParty" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list scheduledParty">
			
				<g:if test="${scheduledPartyInstance?.barman}">
				<li class="fieldcontain">
					<span id="barman-label" class="property-label"><g:message code="scheduledParty.barman.label" default="Barman" /></span>
					
						<span class="property-value" aria-labelledby="barman-label"><g:link controller="user" action="show" id="${scheduledPartyInstance?.barman?.id}">${scheduledPartyInstance?.barman?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduledPartyInstance?.dj}">
				<li class="fieldcontain">
					<span id="dj-label" class="property-label"><g:message code="scheduledParty.dj.label" default="Dj" /></span>
					
						<span class="property-value" aria-labelledby="dj-label"><g:link controller="user" action="show" id="${scheduledPartyInstance?.dj?.id}">${scheduledPartyInstance?.dj?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scheduledPartyInstance?.drinks}">
				<li class="fieldcontain">
					<span id="drinks-label" class="property-label"><g:message code="scheduledParty.drinks.label" default="Drinks" /></span>
					
						<g:each in="${scheduledPartyInstance.drinks}" var="d">
						<span class="property-value" aria-labelledby="drinks-label"><g:link controller="drink" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:scheduledPartyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${scheduledPartyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
