
<%@ page import="com.partytime.News"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'news.label', default: 'News')}" />
<title><g:message value="News" /></title>
</head>
<body>
	<a href="#list-news" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="list-news" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table>
			<tbody>
				<g:each in="${newsInstanceList}" status="i" var="newsInstance">
					<td>
						<h3>
							${fieldValue(bean: newsInstance, field: "date")}
						</h3>
						<h2>
							${fieldValue(bean: newsInstance, field: "title")}
						</h2>
						${fieldValue(bean: newsInstance, field: "description")}
						<!-- TODO: render image if it's present -->
						${fieldValue(bean: newsInstance, field: "imageUrl")}
					</td>
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
