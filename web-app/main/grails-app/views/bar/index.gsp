
<%@ page import="com.partytime.Bar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bar.label', default: 'Bar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="bar.address.label" default="Address" /></th>
					
						<g:sortableColumn property="minimumAge" title="${message(code: 'bar.minimumAge.label', default: 'Minimum Age')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'bar.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="openHours" title="${message(code: 'bar.openHours.label', default: 'Open Hours')}" />
					
						<g:sortableColumn property="promos" title="${message(code: 'bar.promos.label', default: 'Promos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${barInstanceList}" status="i" var="barInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${barInstance.id}">${fieldValue(bean: barInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: barInstance, field: "minimumAge")}</td>
					
						<td>${fieldValue(bean: barInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: barInstance, field: "openHours")}</td>
					
						<td>${fieldValue(bean: barInstance, field: "promos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${barInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
