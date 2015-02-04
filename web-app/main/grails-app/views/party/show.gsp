
<%@ page import="com.partytime.Party"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName"
    value="${message(code: 'party.label', default: 'Party')}" />
    <title>
      <g:message code="default.show.label" args="[entityName]" />
    </title>
  </head>
  <body>
    <a href="#show-party" class="skip" tabindex="-1">
      <g:message
      code="default.link.skip.label" default="Skip to content&hellip;" />
    </a>
    <div class="nav" role="navigation">
      <ul>
        <li>
          <a class="home" href="${createLink(uri: '/')}">
            <g:message
            code="default.home.label" />
          </a>
        </li>
        <li>
          <g:link class="list" action="index">
            <g:message code="default.list.label" args="[entityName]" />
          </g:link>
        </li>
        <li>
          <g:link class="create" action="create">
            <g:message code="default.new.label" args="[entityName]" />
          </g:link>
        </li>
      </ul>
      </div>
      <div id="show-party" class="content scaffold-show" role="main">
        <h1>
          <g:message code="default.show.label" args="[entityName]" />
        </h1>
        <g:if test="${flash.message}">
          <div class="message" role="status">
            ${flash.message}
          </div>
        </g:if>
        <ol class="property-list party">
          
          <g:if test="${partyInstance?.host}">
            <li class="fieldcontain">
              <span id="host-label"
              class="property-label">
                <g:message code="party.host.label"
                default="Host" />
              </span>
              
              <span class="property-value"
              aria-labelledby="host-label">
                <g:link controller="user"
                action="show" id="${partyInstance?.host?.id}">
                  ${partyInstance?.host?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.place}">
            <li class="fieldcontain">
              <span id="place-label"
              class="property-label">
                <g:message code="party.place.label"
                default="Place" />
              </span>
              
              <span class="property-value"
              aria-labelledby="place-label">
                <g:link controller="bar"
                action="show" id="${partyInstance?.place?.id}">
                  ${partyInstance?.place?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.title}">
            <li class="fieldcontain">
              <span id="title-label"
              class="property-label">
                <g:message code="party.title.label"
                default="Title" />
              </span>
              
              <span class="property-value"
              aria-labelledby="title-label">
                <g:fieldValue
                bean="${partyInstance}" field="title" />
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.startDateTime}">
            <li class="fieldcontain">
              <span id="startDateTime-label"
              class="property-label">
                <g:message
                code="party.startDateTime.label" default="Start Date Time" />
              </span>
              
              <span
              class="property-value" aria-labelledby="startDateTime-label">
                <g:formatDate
                date="${partyInstance?.startDateTime}" />
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.finsishDateTime}">
            <li class="fieldcontain">
              <span id="finsishDateTime-label"
              class="property-label">
                <g:message
                code="party.finsishDateTime.label" default="Finsish Date Time" />
              </span>
              
              <span class="property-value"
              aria-labelledby="finsishDateTime-label">
                <g:formatDate
                date="${partyInstance?.finsishDateTime}" />
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.description}">
            <li class="fieldcontain">
              <span id="description-label"
              class="property-label">
                <g:message
                code="party.description.label" default="Description" />
              </span>
              
              <span
              class="property-value" aria-labelledby="description-label">
                <g:fieldValue
                bean="${partyInstance}" field="description" />
              </span>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.guestsInvited}">
            <li class="fieldcontain">
              <span id="guestsInvited-label"
              class="property-label">
                <g:message code="party.guestsInvited.label"
                default="Guests invited" />
              </span>
              
              <g:each in="${partyInstance.guestsInvited}" var="g">
                <span class="property-value" aria-labelledby="guestsInvited-label">
                  <g:link
                  controller="user" action="show" id="${g.id}">
                    ${g?.encodeAsHTML()}
                  </g:link>
                </span>
              </g:each>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.guestsConfirmed}">
            <li class="fieldcontain">
              <span id="guestsConfirmed-label"
              class="property-label">
                <g:message code="party.guestsConfirmed.label"
                default="Guests confirmed" />
              </span>
              
              <g:each in="${partyInstance.guestsConfirmed}" var="g">
                <span class="property-value" aria-labelledby="guestsConfirmed-label">
                  <g:link controller="user" action="show" id="${g.id}">
                    ${g?.encodeAsHTML()}
                  </g:link>
                </span>
              </g:each>
            </li>
          </g:if>
          
          <g:if test="${partyInstance?.guestsNotGoing}">
            <li class="fieldcontain">
              <span id="guestsNotGoing-label"
              class="property-label">
                <g:message code="party.guestsNotGoing.label"
                default="Guests not going" />
              </span>
              
              <g:each in="${partyInstance.guestsNotGoing}" var="g">
                <span class="property-value" aria-labelledby="guestsNotGoing-label">
                  <g:link controller="user" action="show" id="${g.id}">
                    ${g?.encodeAsHTML()}
                  </g:link>
                </span>
              </g:each>
            </li>
          </g:if>
          
        </ol>
        <g:form url="[resource:partyInstance, action:'delete']"
        method="DELETE">
          <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${partyInstance}">
              <g:message code="default.button.edit.label" default="Edit" />
            </g:link>
            <g:actionSubmit class="delete" action="delete"
            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          </fieldset>
        </g:form>
      </div>
    </body>
</html>
