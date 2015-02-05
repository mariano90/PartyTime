
<%@ page import="com.partytime.MusicStyle" %>
<%@ page import="com.partytime.Bar" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName" value="${message(code: 'musicStyle.label', default: 'MusicStyle')}" />
    <title>
      <g:fieldValue bean="${musicStyleInstance}" field="name"/>
    </title>
  </head>
    <body>
      <div id="show-musicStyle" class="content scaffold-show" role="main">
        <h1>
          <g:fieldValue bean="${musicStyleInstance}" field="name"/>
        </h1>
        
        <g:if test="${flash.message}">
          <div class="message" role="status">
            ${flash.message}
          </div>
        </g:if>

        <%
		  def allBars = Bar.list()
		  def allBarsOfThisMusicStyle = []
		  for (Bar bar in allBars) {
		    def styles = bar.getMusicStyles()
		    if (styles.contains(musicStyleInstance)) {
		      allBarsOfThisMusicStyle.add(bar)
		    }
		  }
        %>
        <table>
        <thead>
          <tr>
            ${message(code: 'bar.name.label', default: 'Name')}
          </tr>
        </thead>
        <tbody>
          <g:each in="${allBarsOfThisMusicStyle}" status="i" var="barInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                <g:link controller="bar" action="details" id="${barInstance.id}">
                  ${fieldValue(bean: barInstance, field: "name")}
                </g:link>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>

      </div>
    </body>
</html>
  