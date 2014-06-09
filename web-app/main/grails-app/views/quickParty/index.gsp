
<%@ page import="com.partytime.QuickParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quickParty.label', default: 'QuickParty')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-quickParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-quickParty" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="quickParty.host.label" default="Host" /></th>
					
						<g:sortableColumn property="place" title="${message(code: 'quickParty.place.label', default: 'Place')}" />
					
						<g:sortableColumn property="startDateTime" title="${message(code: 'quickParty.startDateTime.label', default: 'Start Date Time')}" />
					
						<g:sortableColumn property="finsishDateTime" title="${message(code: 'quickParty.finsishDateTime.label', default: 'Finsish Date Time')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'quickParty.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="meetingPoint" title="${message(code: 'quickParty.meetingPoint.label', default: 'Meeting Point')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${quickPartyInstanceList}" status="i" var="quickPartyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${quickPartyInstance.id}">${fieldValue(bean: quickPartyInstance, field: "host")}</g:link></td>
					
						<td>${fieldValue(bean: quickPartyInstance, field: "place")}</td>
					
						<td><g:formatDate date="${quickPartyInstance.startDateTime}" /></td>
					
						<td><g:formatDate date="${quickPartyInstance.finsishDateTime}" /></td>
					
						<td>${fieldValue(bean: quickPartyInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: quickPartyInstance, field: "meetingPoint")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${quickPartyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
