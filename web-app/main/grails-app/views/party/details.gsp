
<%@ page import="com.partytime.Party"%>
<%@ page import="com.partytime.User"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName"
    value="${message(code: 'party.label', default: 'Party')}" />
    <title>
      <g:message code="default.show.label" args="[entityName]" />
      - 
      <g:if test="${partyInstance?.title}">
        <g:fieldValue bean="${partyInstance}" field="title" />
      </g:if>
    </title>
  </head>
    <body>
      <div id="show-party" class="content scaffold-show" role="main">
        <h1>
          <g:if test="${partyInstance?.title}">
            <g:fieldValue bean="${partyInstance}" field="title" />
          </g:if>
        </h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">
            ${flash.message}
          </div>
        </g:if>

        <%
		  User host = partyInstance.getHost()
		  User myself = User.getMyUser()
		  boolean hostingThisParty =  host == myself
		%>
		
		<g:if test="${!hostingThisParty}">
		Mark as: 
			<g:if test="${!partyInstance.isAccepted(myself)}">
				<g:link controller="party" action="accept" id="${partyInstance?.id}">
					Going
				</g:link>
			</g:if>
			<g:if test="${!partyInstance.isRejected(myself)}">
				<g:link controller="party" action="reject" id="${partyInstance?.id}">
					Not going
				</g:link>
			</g:if>
		</g:if>

        <ol class="property-list party">
          <g:if test="${partyInstance?.host}">
            <li class="fieldcontain">
              <span id="host-label" class="property-label">
                <g:message code="party.host.label"
                default="Host" />
              </span>
              <span class="property-value" aria-labelledby="host-label">
                <g:link controller="user" action="details" id="${partyInstance?.host?.id}">
                  ${partyInstance?.host?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.place}">
            <li class="fieldcontain">
              <span id="place-label" class="property-label">
                <g:message code="party.place.label" default="Place" />
              </span>
              <span class="property-value" aria-labelledby="place-label">
                <g:link controller="bar" action="details" id="${partyInstance?.place?.id}">
                  ${partyInstance?.place?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.startDateTime}">
            <li class="fieldcontain">
              <span id="startDateTime-label"
              class="property-label">
                <g:message
                code="party.startDateTime.label" default="Starts" />
              </span>
              
              <span
              class="property-value" aria-labelledby="startDateTime-label">
                <g:formatDate format="yyyy-MM-dd" date="${partyInstance?.startDateTime}" />
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.finsishDateTime}">
            <li class="fieldcontain">
              <span id="finsishDateTime-label" class="property-label">
                <g:message code="party.finsishDateTime.label" default="Finishes" />
              </span>
              <span class="property-value" aria-labelledby="finsishDateTime-label">
                <g:formatDate format="yyyy-MM-dd" date="${partyInstance?.finsishDateTime}" />
              </span>
            </li>
          </g:if>

          <g:if test="${partyInstance?.description}">
            <li class="fieldcontain">
              <span id="description-label" class="property-label">
                <g:message code="party.description.label" default="Description" />
              </span>
              <span class="property-value" aria-labelledby="description-label">
                <g:fieldValue bean="${partyInstance}" field="description" />
              </span>
            </li>
          </g:if>

          <g:if test="${partyInstance?.guestsInvited}">
            <g:message code="party.guestsInvited.label" default="Guests" />
            <table>
              <tbody>
                <g:each in="${partyInstance.guestsInvited}" var="guest">
                  <tr>
                    <td>
                      <g:link controller="user" action="details" id="${guest.id}">
                        ${guest?.encodeAsHTML()}
                      </g:link>
                    </td>
                    <td>
                      ${partyInstance.getStatus(guest)}
                    </td>
                  </tr>
                </g:each>
              </tbody>
            </table>
          </g:if>

          <g:if test="${hostingThisParty}">
          <h1>Suggested drinks 
              <g:link action="grocery" id="${partyInstance.id}">
                        [grocery list]
              </g:link>
          </h1>
          <ul style="list-style-type:disc">
            <g:each in="${partyInstance.getSuggestedDrinks()}" var="drink">
            <li>
              ${drink.toString()}
            </li>
            </g:each>
          </ul>
          </g:if>
        </ol>
      </div>
    </body>
</html>
