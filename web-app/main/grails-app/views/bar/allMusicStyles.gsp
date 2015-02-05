
<%@ page import="com.partytime.MusicStyle"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
  <title>
    Music styles
  </title>
  </head>
  <body>
	<div id="list-bar" class="content scaffold-list" role="main">
      <h1>
        Music styles
      </h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <table>
        <tbody>
          <g:each in="${MusicStyle.list()}" status="i" var="musicStyleInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
              <td>
                <g:link action="musicStyle" id="${musicStyleInstance.id}">
                  ${fieldValue(bean: musicStyleInstance, field: "name")}
                </g:link>
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
  </div>
  </body>
</html>
