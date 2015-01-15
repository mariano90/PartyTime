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
					<!-- TODO: hacer que los links sean target="_top"
					quizas se pueda definir el parametro en el g:link
					
					u otro forma seria escribir en JS init, que modifique esos links para agregarles ese atributo
					hacer el JS en este HTML y no en el container.
					-->
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
