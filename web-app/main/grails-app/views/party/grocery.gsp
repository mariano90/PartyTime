
<%@ page import="com.partytime.Party"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <title>Suggested grocery list</title>
  </head>
  <body>
    <div id="show-party" class="content scaffold-show" role="main">
      <h1>Suggested grocery list</h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <g:each in="${partyInstance.getSuggestedGroceryList().sort{it['product']}}" var="item">
        ${item['product']}:&nbsp;&nbsp;${item['ammount']} ${item['type']}<br/>
      </g:each>
    </div>
  </body>
</html>
