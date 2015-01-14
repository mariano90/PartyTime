
<%@ page import="com.partytime.NightClub" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nightClub.label', default: 'NightClub')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nightClub" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nightClub" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nightClub">
			
				<g:if test="${nightClubInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="nightClub.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${nightClubInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.minimumAge}">
				<li class="fieldcontain">
					<span id="minimumAge-label" class="property-label"><g:message code="nightClub.minimumAge.label" default="Minimum Age" /></span>
					
						<span class="property-value" aria-labelledby="minimumAge-label"><g:fieldValue bean="${nightClubInstance}" field="minimumAge"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.musicStyles}">
				<li class="fieldcontain">
					<span id="musicStyles-label" class="property-label"><g:message code="nightClub.musicStyles.label" default="Music Styles" /></span>
					
						<g:each in="${nightClubInstance.musicStyles}" var="m">
						<span class="property-value" aria-labelledby="musicStyles-label"><g:link controller="musicStyle" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="nightClub.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${nightClubInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.openHours}">
				<li class="fieldcontain">
					<span id="openHours-label" class="property-label"><g:message code="nightClub.openHours.label" default="Open Hours" /></span>
					
						<span class="property-value" aria-labelledby="openHours-label"><g:fieldValue bean="${nightClubInstance}" field="openHours"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.promos}">
				<li class="fieldcontain">
					<span id="promos-label" class="property-label"><g:message code="nightClub.promos.label" default="Promos" /></span>
					
						<span class="property-value" aria-labelledby="promos-label"><g:fieldValue bean="${nightClubInstance}" field="promos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nightClubInstance?.reviews}">
				<li class="fieldcontain">
					<span id="reviews-label" class="property-label"><g:message code="nightClub.reviews.label" default="Reviews" /></span>
					
						<g:each in="${nightClubInstance.reviews}" var="r">
						<span class="property-value" aria-labelledby="reviews-label"><g:link controller="review" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:nightClubInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${nightClubInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
