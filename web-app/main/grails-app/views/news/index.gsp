
<%@ page import="com.partytime.News" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'news.label', default: 'News')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-news" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-news" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'news.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'news.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'news.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="imageUrl" title="${message(code: 'news.imageUrl.label', default: 'Image Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsInstanceList}" status="i" var="newsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${newsInstance.id}">${fieldValue(bean: newsInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: newsInstance, field: "description")}</td>
					
						<td><g:formatDate date="${newsInstance.date}" /></td>
					
						<td>${fieldValue(bean: newsInstance, field: "imageUrl")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
