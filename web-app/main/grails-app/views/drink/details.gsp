
<%@ page import="com.partytime.Drink"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName"
	  value="${message(code: 'drink.label', default: 'Drink')}" />
  <title>
    <g:if test="${drinkInstance?.name}">
      <g:fieldValue bean="${drinkInstance}" field="name" />
    </g:if>
  </title>
  
  <style type="text/css" media="screen">
    .gsc-control {
      background-color: #eee;
      width: 700px!important;
    }

    .gs-image {
      width: 200px;
      height: 150px;
    }
    
    .gs-title {
      margin-left: 50px;
    }
    
    .gs-snippet {
      margin-left: 100px!important;
    }
    
    .gs-publishedDate {
      color: #eee!important;
    }
  </style>
  
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  
  <script type="text/javascript">
  google.load("search", "1");
  function initialize() {
    var searchControl = new google.search.SearchControl();

    var options = new google.search.SearcherOptions();
    options.setExpandMode(google.search.SearchControl.EXPAND_MODE_OPEN);
    
    searchControl.addSearcher(new google.search.VideoSearch(), options);

    // TODO: filter by language.
    
    searchControl.draw(document.getElementById("searchcontrol"));
    searchControl.execute("how to prepare a ${drinkInstance?.name}");
  }
  google.setOnLoadCallback(initialize);
  </script>
  
  </head>
  <body>
  <div id="show-drink" class="content scaffold-show" role="main">
    <h1>
      <g:if test="${drinkInstance?.name}">
        <g:fieldValue bean="${drinkInstance}" field="name" />
      </g:if>
    </h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">
        ${flash.message}
      </div>
    </g:if>
    <ol class="property-list drink">

      <g:if test="${drinkInstance?.components}">
          <span id="components-label"
            class="property-label">
          <g:message code="drink.listelements.label" default="You need:" />
          <ul>
          <g:each in="${drinkInstance.components}" var="c">
             <li>${c?.toStringAsIngredientList().encodeAsHTML()}</li>
          </g:each>
          </ul>
      </g:if>

      <g:if test="${drinkInstance?.preparation}">
        <li class="fieldcontain">
          <span id="preparation-label"
          class="property-label">
            <g:message
            code="drink.preparation.label" default="Preparation: " />
          </span>

          <span
            class="property-value" aria-labelledby="preparation-label">
            <g:fieldValue
            bean="${drinkInstance}" field="preparation" />
          </span>
        </li>
      </g:if>
    </ol>
  </div>
  <div id="searchcontrol" style="width:551px;">Loading</div>
  </body>
</html>
