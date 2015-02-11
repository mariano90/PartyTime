
<%@ page import="com.partytime.Party"%>
<%@ page import="com.partytime.User"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName"
    value="${message(code: 'party.label', default: 'Party')}" />
    <title>
      <g:if test="${partyInstance?.title}">
        <g:fieldValue bean="${partyInstance}" field="title" />&nbsp;-&nbsp;
      </g:if>
      Invite people
    </title>
  </head>
    <body>
      <div id="show-party" class="content scaffold-show" role="main">
        <h1>
          <g:if test="${partyInstance?.title}">
            <g:fieldValue bean="${partyInstance}" field="title" />
          </g:if>
          [<g:link action="details" id="${partyInstance.id}">
            Back to party
          </g:link>]
        </h1>

        <g:message code="party.guestsInvited.label" default="Not invited" />
        <table>
          <tbody>
            <g:each in="${partyInstance?.getNotInvitedGuests().sort{it.name} }" var="guest">
              <% if (guest.name == User.getMyUser().name) {
				  continue
			  }%>
              <tr>
                <td>
                  <g:link controller="user" action="details" id="${guest.id}">
                    <img src="${resource(dir: 'images/profile', file: guest?.getProfilePicture())}"
                      alt="Profile" />
                    ${guest?.encodeAsHTML()}
                  </g:link>
                </td>
                <td>
                  [<g:link controller="party" action="doInvite" params="${[party:partyInstance.id,user:guest.id]}">
                  add
                  </g:link>]
                </td>
              </tr>
            </g:each>
          </tbody>
        </table>

        <g:if test="${partyInstance?.guestsInvited}">
            <g:message code="party.guestsInvited.label" default="Already invited" />
            <table>
              <tbody>
                <g:each in="${partyInstance.guestsInvited.sort{it.name} }" var="guest">
                  <tr>
                    <td>
                      <g:link controller="user" action="details" id="${guest.id}">
                        <img src="${resource(dir: 'images/profile', file: guest?.getProfilePicture())}"
                          alt="Profile" />
                        ${guest?.encodeAsHTML()}
                      </g:link>
                    </td>
                    <td>
                    [<g:link controller="party" action="doRemove" params="${[party:partyInstance.id,user:guest.id]}">
                    remove
                    </g:link>]
                    </td>
                  </tr>
                </g:each>
              </tbody>
            </table>
        </g:if>
      </div>
    </body>
</html>
