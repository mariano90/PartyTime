
<%@ page import="com.partytime.NightClub" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nightClub.label', default: 'NightClub')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-nightClub" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-nightClub" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="address" title="${message(code: 'nightClub.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="minimumAge" title="${message(code: 'nightClub.minimumAge.label', default: 'Minimum Age')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'nightClub.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="openHours" title="${message(code: 'nightClub.openHours.label', default: 'Open Hours')}" />
					
						<g:sortableColumn property="promos" title="${message(code: 'nightClub.promos.label', default: 'Promos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nightClubInstanceList}" status="i" var="nightClubInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nightClubInstance.id}">${fieldValue(bean: nightClubInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: nightClubInstance, field: "minimumAge")}</td>
					
						<td>${fieldValue(bean: nightClubInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: nightClubInstance, field: "openHours")}</td>
					
						<td>${fieldValue(bean: nightClubInstance, field: "promos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nightClubInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
