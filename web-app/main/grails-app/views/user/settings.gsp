
<%@ page import="com.partytime.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="show-user" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.settings.label" default="Settings" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list user">

			<g:if test="${myUser?.name}">
				<li class="fieldcontain"><span id="name-label"
					class="property-label"><g:message code="user.name.label"
							default="Name" /></span> <span class="property-value"
					aria-labelledby="name-label"><g:fieldValue bean="${myUser}"
							field="name" /></span></li>
			</g:if>

			<g:if test="${myUser?.bornDate}">
				<li class="fieldcontain"><span id="bornDate-label"
					class="property-label"><g:message code="user.bornDate.label"
							default="Born Date" /></span> <span class="property-value"
					aria-labelledby="bornDate-label"><g:formatDate
							date="${myUser?.bornDate}" /></span></li>
			</g:if>

			<g:if test="${myUser?.preferedDrinks}">
				<li class="fieldcontain"><span id="preferedDrinks-label"
					class="property-label"><g:message
							code="user.preferedDrinks.label" default="Prefered Drinks" /></span> <g:each
						in="${myUser.preferedDrinks}" var="p">
						<span class="property-value"
							aria-labelledby="preferedDrinks-label"><g:link
								controller="drink" action="show" id="${p.id}">
								${p?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${myUser?.preferedMusicStyles}">
				<li class="fieldcontain"><span id="preferedMusicStyles-label"
					class="property-label"><g:message
							code="user.preferedMusicStyles.label"
							default="Prefered Music Styles" /></span> <g:each
						in="${myUser.preferedMusicStyles}" var="p">
						<span class="property-value"
							aria-labelledby="preferedMusicStyles-label"><g:link
								controller="musicStyle" action="show" id="${p.id}">
								${p?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

		</ol>
		<g:form url="[resource:myUser, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.save.label', default: 'Save')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
