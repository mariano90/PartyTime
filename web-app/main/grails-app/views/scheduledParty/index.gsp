
<%@ page import="com.partytime.ScheduledParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'scheduledParty.label', default: 'ScheduledParty')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-scheduledParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-scheduledParty" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="scheduledParty.dj.label" default="Dj" /></th>
					
						<th><g:message code="scheduledParty.barman.label" default="Barman" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${scheduledPartyInstanceList}" status="i" var="scheduledPartyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${scheduledPartyInstance.id}">${fieldValue(bean: scheduledPartyInstance, field: "dj")}</g:link></td>
					
						<td>${fieldValue(bean: scheduledPartyInstance, field: "barman")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${scheduledPartyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
