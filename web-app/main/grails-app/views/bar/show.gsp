
<%@ page import="com.partytime.Bar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bar.label', default: 'Bar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bar">
			
				<g:if test="${barInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="bar.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:link controller="address" action="show" id="${barInstance?.address?.id}">${barInstance?.address?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.minimumAge}">
				<li class="fieldcontain">
					<span id="minimumAge-label" class="property-label"><g:message code="bar.minimumAge.label" default="Minimum Age" /></span>
					
						<span class="property-value" aria-labelledby="minimumAge-label"><g:fieldValue bean="${barInstance}" field="minimumAge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.musicStyles}">
				<li class="fieldcontain">
					<span id="musicStyles-label" class="property-label"><g:message code="bar.musicStyles.label" default="Music Styles" /></span>
					
						<g:each in="${barInstance.musicStyles}" var="m">
						<span class="property-value" aria-labelledby="musicStyles-label"><g:link controller="musicStyle" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bar.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${barInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.openHours}">
				<li class="fieldcontain">
					<span id="openHours-label" class="property-label"><g:message code="bar.openHours.label" default="Open Hours" /></span>
					
						<span class="property-value" aria-labelledby="openHours-label"><g:fieldValue bean="${barInstance}" field="openHours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.promos}">
				<li class="fieldcontain">
					<span id="promos-label" class="property-label"><g:message code="bar.promos.label" default="Promos" /></span>
					
						<span class="property-value" aria-labelledby="promos-label"><g:fieldValue bean="${barInstance}" field="promos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.reviews}">
				<li class="fieldcontain">
					<span id="reviews-label" class="property-label"><g:message code="bar.reviews.label" default="Reviews" /></span>
					
						<g:each in="${barInstance.reviews}" var="r">
						<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:barInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${barInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
