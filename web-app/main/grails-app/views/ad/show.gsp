
<%@ page import="com.partytime.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ad" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ad">
			
				<g:if test="${adInstance?.imageURL}">
				<li class="fieldcontain">
					<span id="imageURL-label" class="property-label"><g:message code="ad.imageURL.label" default="Image URL" /></span>
					
						<span class="property-value" aria-labelledby="imageURL-label"><g:fieldValue bean="${adInstance}" field="imageURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.destinationURL}">
				<li class="fieldcontain">
					<span id="destinationURL-label" class="property-label"><g:message code="ad.destinationURL.label" default="Destination URL" /></span>
					
						<span class="property-value" aria-labelledby="destinationURL-label"><g:fieldValue bean="${adInstance}" field="destinationURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.ageTarget}">
				<li class="fieldcontain">
					<span id="ageTarget-label" class="property-label"><g:message code="ad.ageTarget.label" default="Age Target" /></span>
					
						<span class="property-value" aria-labelledby="ageTarget-label"><g:fieldValue bean="${adInstance}" field="ageTarget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.genderTarget}">
				<li class="fieldcontain">
					<span id="genderTarget-label" class="property-label"><g:message code="ad.genderTarget.label" default="Gender Target" /></span>
					
						<span class="property-value" aria-labelledby="genderTarget-label"><g:fieldValue bean="${adInstance}" field="genderTarget"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adInstance?.musicStyleTarget}">
				<li class="fieldcontain">
					<span id="musicStyleTarget-label" class="property-label"><g:message code="ad.musicStyleTarget.label" default="Music Style Target" /></span>
					
						<span class="property-value" aria-labelledby="musicStyleTarget-label"><g:link controller="musicStyle" action="show" id="${adInstance?.musicStyleTarget?.id}">${adInstance?.musicStyleTarget?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:adInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${adInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
