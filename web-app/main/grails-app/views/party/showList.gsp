<%@ page import="com.partytime.QuickParty" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'party.label', default: 'Party')}" />
	</head>
	<body>
		<div id="list-party" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:each in="${partyInstanceList}" status="i" var="partyInstance">
			
			<table>
				<thead>
					<tr>
						<th><g:message code="startDateTime" default="Start Date Time" /></th>
						<td><g:formatDate date="${partyInstance.startDateTime}" /></td>
						
						
						
						
<%--					--%>
<%--						<th><g:message code="party.host.label" default="Host" /></th>--%>
<%--					--%>
<%--						--%>
<%--					--%>
<%--						<g:sortableColumn property="description" title="${message(code: 'party.description.label', default: 'Description')}" />--%>
<%--					--%>
<%--						--%>
<%--					--%>
<%--						<g:sortableColumn property="finsishDateTime" title="${message(code: 'party.finsishDateTime.label', default: 'Finsish Date Time')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="meetingPoint" title="${message(code: 'party.meetingPoint.label', default: 'Meeting Point')}" />--%>
<%--					--%>
					</tr>
				</thead>
				<tbody>
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<th><g:message code="party.place.label" default="Place" /></th>
						<td>${fieldValue(bean: partyInstance, field: "place")}</td>
					
					</tr>	
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">	
						<th><g:message code="party.host.label" default="Host" /></th>
						<td>${fieldValue(bean: partyInstance, field: "host")}</td>
						
<%--					--%>
<%--						<td><g:link action="show" id="${partyInstance.id}">${fieldValue(bean: partyInstance, field: "host")}</g:link></td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: partyInstance, field: "place")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: partyInstance, field: "description")}</td>--%>
<%--					--%>
<%--						--%>
<%--					--%>
<%--						<td><g:formatDate date="${partyInstance.finsishDateTime}" /></td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: partyInstance, field: "meetingPoint")}</td>--%>
<%--					--%>
					</tr>
				
				</tbody>
			</table>
			
			</g:each>
			
			<div class="pagination">
				<g:paginate total="${partyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
