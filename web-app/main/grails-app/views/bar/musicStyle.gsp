
<%@ page import="com.partytime.MusicStyle" %>
<%@ page import="com.partytime.Bar" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabs.css')}"
	  type="text/css" />
    <g:set var="entityName" value="${message(code: 'musicStyle.label', default: 'MusicStyle')}" />
  </head>
    <body>
      <div id="show-musicStyle" class="content scaffold-show" role="main">
        <h2>
          <strong><g:fieldValue bean="${musicStyleInstance}" field="name"/></strong>
        </h2>
        <g:link action="byName" class="tab">Name</g:link>
        <g:link action="byMusicStyles" class="tab-selected">Music styles</g:link>
        <g:link action="byRanking" class="tab">Ranking</g:link>
        <br/>
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
          	<div style="font-weight: bold;color:black;font-size: 16pt; ">
            Bars:
            </div>
          </tr>
        </thead>
        <tbody>
          <g:each in="${allBarsOfThisMusicStyle}" status="i" var="barInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
              <img src="${resource(dir: 'images/bar', file: barInstance?.getProfilePicture())}"
				                          alt="Profile" />
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
  