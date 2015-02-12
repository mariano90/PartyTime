
<%@ page import="com.partytime.Ad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ad.label', default: 'Ad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="imageURL" title="${message(code: 'ad.imageURL.label', default: 'Image URL')}" />
					
						<g:sortableColumn property="destinationURL" title="${message(code: 'ad.destinationURL.label', default: 'Destination URL')}" />
					
						<g:sortableColumn property="ageTarget" title="${message(code: 'ad.ageTarget.label', default: 'Age Target')}" />
					
						<g:sortableColumn property="genderTarget" title="${message(code: 'ad.genderTarget.label', default: 'Gender Target')}" />
					
						<th><g:message code="ad.musicStyleTarget.label" default="Music Style Target" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adInstanceList}" status="i" var="adInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adInstance.id}">${fieldValue(bean: adInstance, field: "imageURL")}</g:link></td>
					
						<td>${fieldValue(bean: adInstance, field: "destinationURL")}</td>
					
						<td>${fieldValue(bean: adInstance, field: "ageTarget")}</td>
					
						<td>${fieldValue(bean: adInstance, field: "genderTarget")}</td>
					
						<td>${fieldValue(bean: adInstance, field: "musicStyleTarget")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
