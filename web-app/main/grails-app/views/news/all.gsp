<%@ page import="com.partytime.News"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'news.label', default: 'News')}" />
</head>
<body>
	<div id="list-news" class="content scaffold-list" role="main">
		<h2>
			<strong><g:message code="default.news.label" default="News" /></strong>
		</h2>
		<table  cellspacing='0'>
			<tbody>
				<g:each in="${newsInstanceList}" status="i" var="newsInstance">
					<td>
						<h1>
							${fieldValue(bean: newsInstance, field: "date").toString().substring(0,10)}
						</h1>
						<h2>
							${fieldValue(bean: newsInstance, field: "title")}
						</h2>
						<div>
							${fieldValue(bean: newsInstance, field: "description")}
						</div>
						<div style="text-align:center">
							<img src="${resource(dir: 'images', file: fieldValue(bean: newsInstance, field: "imageUrl"))}"/>
						</div>
					</td>
					<tr>
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
