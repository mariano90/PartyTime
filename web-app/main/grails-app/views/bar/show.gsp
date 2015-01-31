
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
			
				<g:if test="${barInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="bar.street.label" default="Street" /></span>
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${barInstance}" field="street"/></span>
				</li>
				</g:if>
			
				<g:if test="${barInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="bar.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${barInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.floor}">
				<li class="fieldcontain">
					<span id="floor-label" class="property-label"><g:message code="bar.floor.label" default="Floor" /></span>
					
						<span class="property-value" aria-labelledby="floor-label"><g:fieldValue bean="${barInstance}" field="floor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.apartment}">
				<li class="fieldcontain">
					<span id="apartment-label" class="property-label"><g:message code="bar.apartment.label" default="Apartment" /></span>
					
						<span class="property-value" aria-labelledby="apartment-label"><g:fieldValue bean="${barInstance}" field="apartment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="bar.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${barInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.province}">
				<li class="fieldcontain">
					<span id="province-label" class="property-label"><g:message code="bar.province.label" default="Province" /></span>
					
						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${barInstance}" field="province"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${barInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="bar.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${barInstance}" field="country"/></span>
					
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
			
				<g:if test="${barInstance?.promos}">
				<li class="fieldcontain">
					<span id="promos-label" class="property-label"><g:message code="bar.promos.label" default="Promos" /></span>
					
						<g:each in="${barInstance.promos}" var="p">
						<span class="property-value" aria-labelledby="promos-label"><g:link controller="promo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
