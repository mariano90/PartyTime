
<%@ page import="com.partytime.Party"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'party.label', default: 'Party')}" />
<title>
	<g:message code="default.show.label" args="[entityName]" />
	 - <g:if test="${partyInstance?.title}">
			<g:fieldValue bean="${partyInstance}" field="title" />
		</g:if>
</title>
</head>
<body>
	<div id="show-party" class="content scaffold-show" role="main">
		<h1>
			<g:if test="${partyInstance?.title}">
				<g:fieldValue bean="${partyInstance}" field="title" />
			</g:if>
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list party">

			<g:if test="${partyInstance?.host}">
				<li class="fieldcontain">
				<span id="host-label" class="property-label">
					<g:message code="party.host.label"
							default="Host" /></span>
				<span class="property-value" aria-labelledby="host-label">
					<g:link controller="user" action="details" id="${partyInstance?.host?.id}">
							${partyInstance?.host?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${partyInstance?.place}">
				<li class="fieldcontain">
				<span id="place-label" class="property-label">
					<g:message code="party.place.label" default="Place" />
				</span>
				<span class="property-value" aria-labelledby="place-label">
					<g:link controller="bar" action="details" id="${partyInstance?.place?.id}">
							${partyInstance?.place?.encodeAsHTML()}
					</g:link>
				</span>
				</li>
			</g:if>

			<g:if test="${partyInstance?.startDateTime}">
				<li class="fieldcontain"><span id="startDateTime-label"
					class="property-label">
					<g:message
							code="party.startDateTime.label" default="Starts" /></span> <span
					class="property-value" aria-labelledby="startDateTime-label">
						<g:formatDate format="yyyy-MM-dd" date="${partyInstance?.startDateTime}" />
				</span></li>
			</g:if>

			<g:if test="${partyInstance?.finsishDateTime}">
				<li class="fieldcontain">
				<span id="finsishDateTime-label" class="property-label">
					<g:message code="party.finsishDateTime.label" default="Finishes" />
				</span>

					<span class="property-value"
					aria-labelledby="finsishDateTime-label"><g:formatDate
							format="yyyy-MM-dd" date="${partyInstance?.finsishDateTime}" /></span></li>
			</g:if>

			<g:if test="${partyInstance?.description}">
				<li class="fieldcontain"><span id="description-label"
					class="property-label"><g:message
							code="party.description.label" default="Description" /></span> <span
					class="property-value" aria-labelledby="description-label"><g:fieldValue
							bean="${partyInstance}" field="description" /></span></li>
			</g:if>

			<g:if test="${partyInstance?.guestsInvited}">
				<li class="fieldcontain">
				<span id="guestsInvited-label" class="property-label">
					<g:message code="party.guestsInvited.label" default="Guests" />
				</span>
				<g:each in="${partyInstance.guestsInvited}" var="g">
						<span class="property-value" aria-labelledby="guestsInvited-label">
						<g:link controller="user" action="details" id="${g.id}">
								${g?.encodeAsHTML()}
						</g:link></span>
				</g:each>
				</li>
			</g:if>
		</ol>
	</div>
</body>
</html>
