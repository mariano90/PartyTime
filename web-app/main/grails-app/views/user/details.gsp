
<%@ page import="com.partytime.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="home">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label">
						<g:message code="user.name.label" default="Name" />
					</span>
					<span class="property-value" aria-labelledby="name-label">
						<g:fieldValue bean="${userInstance}" field="name"/>
					</span>
				</li>
				</g:if>
				<g:if test="${userInstance?.bornDate}">
				<li class="fieldcontain">
					<span id="bornDate-label" class="property-label">
						<g:message code="user.bornDate.label" default="Born Date" />
					</span>
					<span class="property-value" aria-labelledby="bornDate-label">
						<g:formatDate format="yyyy-MM-dd" date="${userInstance?.bornDate}" />
					</span>
				</li>
				</g:if>
				<g:if test="${userInstance?.preferedDrinks}">
				<li class="fieldcontain">
					<span id="preferedDrinks-label" class="property-label"><g:message code="user.preferedDrinks.label" default="Prefered Drinks" /></span>
						<g:each in="${userInstance.preferedDrinks}" var="p">
						<span class="property-value" aria-labelledby="preferedDrinks-label"><g:link controller="drink" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
				<g:if test="${userInstance?.preferedMusicStyles}">
				<li class="fieldcontain">
					<span id="preferedMusicStyles-label" class="property-label"><g:message code="user.preferedMusicStyles.label" default="Prefered Music Styles" /></span>
						<g:each in="${userInstance.preferedMusicStyles}" var="p">
						<span class="property-value" aria-labelledby="preferedMusicStyles-label"><g:link controller="musicStyle" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
				</li>
				</g:if>
			</ol>
		</div>
	</body>
</html>
