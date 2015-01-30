<%@ page import="com.partytime.Drink" %>
<!DOCTYPE html>
<html>
	<head>
	<meta name="layout" content="home">
	</head>
	<body>
		<div id="list-drink"  role="main" style="height: 800px">
			<h2><strong>My Drinks</strong></h2>
			<div id="add_drink" style="margin-top:25px;">
			<g:form controller="user" action="addDrink">
				<g:submitButton name="AddDrink" class="button" style="margin-left:30px" 
					value="${message(code: 'drink.button.add', default: 'Add Drink')}"/>
<%--				 TODO deberia ser un listado de tragos para que el usuario agregue		--%>
				<g:select style="margin-left:30px;width:500px;margin-top:20px" name="drinkSelected" from="${com.partytime.Drink.list()}"
					optionKey="name"/>
			</g:form>
			</div>
			
			<div style="margin-top: 50px">
				<g:each in="${myDrinks}" status="i" var="drinkInstance">
					<button id="my_drink" class="button" style="border: 2px outset; margin-top: 30px; width:170px; margin-left:15px; float: left">
						<h4>${fieldValue(bean: drinkInstance, field: "name")}</h4>
						<output style="font-size: 10pt; text-align: left;">Preparation: </output>
						<output style="font-size: 10pt; text-align: left;">${fieldValue(bean: drinkInstance, field: "preparation")}</output>
					</button>
				</g:each>
			</div>
			
			<div class="pagination">
				<g:paginate total="${drinkInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
