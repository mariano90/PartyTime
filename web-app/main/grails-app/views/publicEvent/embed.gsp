<%@ page import="com.partytime.PublicEvent"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function initLinks() {
		var linksList = document.getElementsByTagName("a");
		for (var i = 0; i < linksList.length; i++) {
			linksList[i].setAttribute("target", "_top");
		}
	}
</script>
</head>
<body onload="initLinks()">
	<div id="list-publicEvent" class="content scaffold-list" role="main">
		<table>
			<tbody>
				<g:each in="${publicEventInstanceList}" status="i"
					var="publicEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="details" absolute="true"
								id="${publicEventInstance.id}">
								${fieldValue(bean: publicEventInstance, field: "title")}
							</g:link></td>
						<td><g:formatDate format="yyyy-MM-dd"
								date="${publicEventInstance.startDateTime}" /></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>
