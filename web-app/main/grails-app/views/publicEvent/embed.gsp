<%@ page import="com.partytime.PublicEvent"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div id="list-publicEvent" class="content scaffold-list" role="main">
		<table>
			<tbody>
				<g:each in="${publicEventInstanceList}" status="i"
					var="publicEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="details" id="${publicEventInstance.id}">
								${fieldValue(bean: publicEventInstance, field: "title")}
							</g:link></td>
						<td><g:formatDate date="${publicEventInstance.startDateTime}" /></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>
