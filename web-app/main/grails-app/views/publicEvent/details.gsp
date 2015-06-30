
<%@ page import="com.partytime.PublicEvent"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'publicEvent.label', default: 'Public Events')}" />
</head>
<body>
	<div id="show-publicEvent" class="content scaffold-show" role="main">
		<h2>
			<strong><g:message code="default.publicEvent.details" default="Public Event" /></strong>
		</h2>
		<ol class="property-list publicEvent">
			<g:if test="${publicEventInstance?.title}">
				<li class="fieldcontain">
					<h2>
						<span class="property-value" aria-labelledby="title-label">
							<g:fieldValue bean="${publicEventInstance}" field="title" />
						</span>
					</h2>
				</li>
			</g:if>

			<g:if test="${publicEventInstance?.description}">
				<li class="fieldcontain">
					<span class="property-value" aria-labelledby="description-label">
						<g:fieldValue bean="${publicEventInstance}" field="description" />
					</span>
				</li>
			</g:if>

			<g:if test="${publicEventInstance?.lineup}">
				<li class="fieldcontain"><span id="lineup-label"
					class="property-label"><g:message
							code="publicEvent.lineup.label" default="Lineup:" /></span> <span
					class="property-value" aria-labelledby="lineup-label"><g:fieldValue
							bean="${publicEventInstance}" field="lineup" /></span></li>
			</g:if>

			<g:if test="${publicEventInstance?.startDateTime}">
				<li class="fieldcontain">
				<span id="startDateTime-label" class="property-label">
					<g:message code="publicEvent.startDateTime.label" default="Date" />
				</span>
				<span class="property-value" aria-labelledby="startDateTime-label">
					<g:formatDate format="yyyy-MM-dd HH:mm" date="${publicEventInstance?.startDateTime}" />
				</span>
				</li>
			</g:if>

			<g:if test="${publicEventInstance?.address}">
				<li class="fieldcontain">
				<span id="address-label" class="property-label">
					<g:message code="publicEvent.address.label" default="Address" />
				</span>
				<span
					class="property-value" aria-labelledby="address-label">
					<g:fieldValue
							bean="${publicEventInstance}" field="address" />
				</span>
				</li>
			</g:if>

			<g:if test="${publicEventInstance?.minimumAge}">
				<li class="fieldcontain"><span id="minimumAge-label"
					class="property-label"><g:message
							code="publicEvent.minimumAge.label" default="Minimum Age" /></span> <span
					class="property-value" aria-labelledby="minimumAge-label"><g:fieldValue
							bean="${publicEventInstance}" field="minimumAge" /></span></li>
			</g:if>

			
			<g:if test="${publicEventInstance?.externalUrl}">
				<a href="${publicEventInstance.externalUrl}" style="color: #ffffff;padding-top:30px;" target="_blank">Vos también podes ser parte!</a>
			</g:if>

		</ol>
	</div>
</body>
</html>
