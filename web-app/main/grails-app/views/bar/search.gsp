
<%@ page import="com.partytime.Bar"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'bar.label', default: 'Bar')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-bar" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.barsearch.label" default="Bar search" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="name"
						title="${message(code: 'bar.name.label', default: 'Name')}" />
					<g:sortableColumn property="street"
						title="${message(code: 'bar.address.label', default: 'Address')}" />
					<g:sortableColumn property="openHours"
						title="${message(code: 'bar.openHours.label', default: 'Open Hours')}" />
					<g:sortableColumn property="reviewsCount"
						title="${message(code: 'bar.reviews.label', default: 'Reviews')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${barInstanceList}" status="i" var="barInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${barInstance.id}">
								${fieldValue(bean: barInstance, field: "name")}
							</g:link></td>

						<td>
							${fieldValue(bean: barInstance, field: "street")} ${fieldValue(bean: barInstance, field: "number")}
						</td>
						<td>
							${fieldValue(bean: barInstance, field: "openHours")}
						</td>
						<td>TO DO</td>
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
