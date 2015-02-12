<%@ page import="com.partytime.Drink" %>

<!DOCTYPE html>
<html>
  <head>
	<meta name="layout" content="home">
	<title>Favorite drinks</title>
  </head>
  <body>
    <div id="list-drink" role="main" style="height: 800px">
      <h1>Favorite drinks</h1>
      This list will be used as a suggestion for drinks for the parties you'll attend.
      <div id="add_drink" style="margin-top:25px;">
        <g:form controller="user" action="addDrink">
          <g:select style="margin-left:30px;width:500px;margin-top:20px"
            name="drinkSelected"
            from="${ com.partytime.Drink.listMissingFavoriteDrinks() }"
            optionKey="id"/>
          <g:submitButton name="AddDrink"
            class="button"
            value="${message(code: 'drink.button.add', default: 'Add Drink')}"/>
        </g:form>
      </div>

      <div style="margin-top: 50px; margin-left: 20px">
      <table>
      <tbody>
        <g:each in="${myDrinks}" status="i" var="drinkInstance">
          <tr>
            <td>
              <g:link controller="drink" action="details" id="${drinkInstance?.id}">
                ${fieldValue(bean: drinkInstance, field: "name")}
              </g:link>
              &nbsp;&nbsp;
              <g:link controller="drink" action="remove" id="${drinkInstance?.id}" class="buttondelete">
                X
              </g:link>
            </td>
          </tr>
        </g:each>
      </tbody>
      </table>
      </div>
      <div class="pagination">
        <g:paginate total="${drinkInstanceCount ?: 0}" />
      </div>
    </div>
  </body>
</html>
