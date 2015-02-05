
<%@ page import="com.partytime.Party"%>

<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript">
      function initLinks() {
        var linksList = document.getElementsByTagName("a");
	    for (var i = 0; i < linksList.length; i++) {
          linksList[i].setAttribute("target", "_top");
        }
      }
    </script>
  </head>
  <body onload="initLinks()">
	<div>
      <table>
        <tbody>
          <g:each in="${partyInstanceList}" status="i" var="partyInstance">
            <tr>
              <td>
                <g:link action="details" id="${partyInstance.id}">
                  ${fieldValue(bean: partyInstance, field: "title")}
                </g:link>
              </td>
              <td>
                <g:formatDate format="yyyy-MM-dd" date="${partyInstance.startDateTime}" />
              </td>
            </tr>
          </g:each>
        </tbody>
      </table>
  </div>
  </body>
</html>
