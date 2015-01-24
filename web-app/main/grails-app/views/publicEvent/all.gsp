
<%@ page import="com.partytime.PublicEvent"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'publicEvent.label', default: 'PublicEvent')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-publicEvent" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.publicEvents.label" default="Public events" />
		</h1>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="title"
						title="${message(code: 'publicEvent.title.label', default: 'Title')}" />
					<th><g:message code="publicEvent.lineup.label" default="Lineup" /></th>
					<g:sortableColumn property="startDateTime"
						title="${message(code: 'publicEvent.startDateTime.label', default: 'Date')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${publicEventInstanceList}" status="i"
					var="publicEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:link action="details" id="${publicEventInstance.id}">
								${fieldValue(bean: publicEventInstance, field: "title")}
							</g:link>
						</td>
						<td>${fieldValue(bean: publicEventInstance, field: "lineup")}</td>
						<td><g:formatDate format="yyyy-MM-dd" date="${publicEventInstance.startDateTime}" /></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${publicEventInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
