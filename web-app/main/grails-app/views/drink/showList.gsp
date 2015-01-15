<%@ page import="com.partytime.Drink" %>
<!DOCTYPE html>
<html>
	<head>
<%--		<g:set var="entityName" value="${message(code: 'drink.label', default: 'Drink')}" />--%>
	</head>
	<body>
		<div id="list-drink">
			<h2><strong>My Drinks</strong></h2>
			<div id="add_drink" style="margin-top:25px;">
				<button class="button" style="margin-left:30px">Add Drink</button>
			</div>
			
			<div style="margin-top: 50px">
				<g:each in="${drinkInstanceList}" status="i" var="drinkInstance">
					<button id="my_drink" class="button" style="border: 2px outset; margin-top: 30px; width:170px; margin-left:15px; float: left">
						<h4>${fieldValue(bean: drinkInstance, field: "name")}</h4>
					</button>
				</g:each>
			</div>
			
			<div class="pagination">
				<g:paginate total="${drinkInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
