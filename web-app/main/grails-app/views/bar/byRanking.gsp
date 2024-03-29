
<%@ page import="com.partytime.Bar"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabs.css')}"
	  type="text/css" />
    <g:set var="entityName"
	value="${message(code: 'bar.label', default: 'Bar')}" />
  <style>
    table, th, td {
      border: 1px solid black;
    }
  </style>
  </head>

  <body>
	<div id="list-bar" class="content scaffold-list" role="main">
      <h2>
        <strong>Ranking</strong>
      </h2>
      <g:link action="byName" class="tab">Name</g:link>
      <g:link action="byMusicStyles" class="tab">Music styles</g:link>
      <g:link action="byRanking" class="tab-selected">Ranking</g:link>
      <br/>
      <g:link action="byRanking" params="[stars:0]">
        <img src="${resource(dir: 'images', file:'00starts.png')}"
          alt="Score" />
      </g:link>
      &nbsp;&nbsp;
      <g:link action="byRanking" params="[stars:1]">
      <img src="${resource(dir: 'images', file:'10stars.png')}"
        alt="Score" />
      </g:link>
      &nbsp;&nbsp;
      <g:link action="byRanking" params="[stars:2]">
      <img src="${resource(dir: 'images', file:'20stars.png')}"
        alt="Score" />
      </g:link>
      &nbsp;&nbsp;
      <g:link action="byRanking" params="[stars:3]">
      <img src="${resource(dir: 'images', file:'30stars.png')}"
        alt="Score" />
      </g:link>
      &nbsp;&nbsp;
      <g:link action="byRanking" params="[stars:4]">
      <img src="${resource(dir: 'images', file:'40stars.png')}"
        alt="Score" />
      </g:link>
      &nbsp;&nbsp;
      <g:link action="byRanking" params="[stars:5]">
      <img src="${resource(dir: 'images', file:'50stars.png')}"
        alt="Score" />
      </g:link>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <table>
        <thead>
          <tr>
            <td style="font-weight: bold;color:black;font-size: 16pt; "><font color="black">Name</font></td>
            <td style="font-weight: bold;color:black;font-size: 16pt; "><font color="black">Address</font></td>
            <td style="font-weight: bold;color:black;font-size: 16pt; "><font color="black">Score</font></td>
          </tr>
        </thead>
        <tbody>
          <g:each in="${barInstanceList}" status="i" var="barInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
              <img src="${resource(dir: 'images/bar', file: barInstance?.getProfilePicture())}"
				                          alt="Profile" />
                <g:link action="details" id="${barInstance.id}">
                  ${fieldValue(bean: barInstance, field: "name")}
                </g:link>
              </td>
              <td>
                ${fieldValue(bean: barInstance, field: "street")} ${fieldValue(bean: barInstance, field: "number")}
                <!-- TODO: Use Google Maps API to show the distance from the user current location -->
              </td>
              <td>
                <img src="${resource(dir: 'images', file:barInstance.getScoreAsImg())}"
                  alt="Score" />
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${barInstanceCount ?: 0}" />
      </div>
  </div>
  </body>
</html>
