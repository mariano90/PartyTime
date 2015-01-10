
<%@ page import="com.partytime.Component"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'component.label', default: 'Component')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-component" class="skip" tabindex="-1"><g:message
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
	<div id="list-component" class="content scaffold-list" role="main">
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

					<th><g:message code="component.ingredient.label"
							default="Ingredient" /></th>

					<g:sortableColumn property="amount"
						title="${message(code: 'component.amount.label', default: 'Amount')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${componentInstanceList}" status="i"
					var="componentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${componentInstance.id}">
								${fieldValue(bean: componentInstance, field: "ingredient")}
							</g:link></td>

						<td>
							${fieldValue(bean: componentInstance, field: "amount")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${componentInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
