<%@ page import="com.partytime.Drink" %>

<!DOCTYPE html>
<html>
  <head>
	<meta name="layout" content="home">
  </head>
  <body>
    <div id="list-drink" role="main" style="height: 800px">
      <h2><strong>My Favorite drinks</strong></h2>
      <div  style="font-weight: bold;color:black;">
      Choose the drinks that you like.
      </div>	
      <div  style="font-weight: bold;color:black;">
      This list will be used as a suggestion for drinks for the parties you'll attend.
      </div>
      <div id="add_drink" style="margin-top:25px;" class="dropdown">
        <g:form controller="user" action="addDrink">
          <g:select class="dropdown-menu" style="margin-left:30px;width:500px;margin-top:20px"
            name="drinkSelected"
            from="${ com.partytime.Drink.listMissingFavoriteDrinks() }"
            optionKey="id"/>
          <g:submitButton name="AddDrink"
            class="button"
            value="${message(code: 'drink.button.add', default: 'Add Drink')}"/>
        </g:form>
      </div>
&nbsp;&nbsp;
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
		<div class="panel panel-default">
 			<div class="panel-heading" role="tab" id="headingOne">
  				<h4 class="panel-title" style="font-weight: bold;color:black">
     				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
       					My Drinks
     				</a>
  				</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body" style="font-weight: bold;color:black">
				      <table style="width:30%"  cellspacing='0'>
					      <tbody>
					        <g:each in="${myDrinks}" status="i" var="drinkInstance">
					          <tr>
					            <td>
					              <g:link controller="drink" action="details" id="${drinkInstance?.id}">
					                ${fieldValue(bean: drinkInstance, field: "name")}
					              </g:link>
					              &nbsp;&nbsp;
					              <g:link controller="drink" action="remove" id="${drinkInstance?.id}" class="buttondelete">
					                Delete
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
   				</div>
  			</div>
  	    </div>
  </body>
</html>
