
<%@ page import="com.partytime.Party"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'party.label', default: 'Party')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-party" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-party" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<thead>
				<tr>

					<th><g:message code="party.host.label" default="Host" /></th>

					<th><g:message code="party.place.label" default="Place" /></th>

					<g:sortableColumn property="title"
						title="${message(code: 'party.title.label', default: 'Title')}" />

					<g:sortableColumn property="startDateTime"
						title="${message(code: 'party.startDateTime.label', default: 'Start Date Time')}" />

					<g:sortableColumn property="finsishDateTime"
						title="${message(code: 'party.finsishDateTime.label', default: 'Finsish Date Time')}" />

					<g:sortableColumn property="description"
						title="${message(code: 'party.description.label', default: 'Description')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${partyInstanceList}" status="i" var="partyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${partyInstance.id}">
								${fieldValue(bean: partyInstance, field: "host")}
							</g:link></td>

						<td>
							${fieldValue(bean: partyInstance, field: "place")}
						</td>

						<td>
							${fieldValue(bean: partyInstance, field: "title")}
						</td>

						<td><g:formatDate date="${partyInstance.startDateTime}" /></td>

						<td><g:formatDate date="${partyInstance.finsishDateTime}" /></td>

						<td>
							${fieldValue(bean: partyInstance, field: "description")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${partyInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
