
<%@ page import="com.partytime.User" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
      <g:message code="default.show.label" args="[entityName]" />
    </title>
  </head>
  <body>
    <a href="#show-user" class="skip" tabindex="-1">
      <g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
    </a>
    <div class="nav" role="navigation">
      <ul>
        <li>
          <a class="home" href="${createLink(uri: '/')}">
            <g:message code="default.home.label"/>
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
    <div id="show-user" class="content scaffold-show" role="main">
      <h1>
        <g:message code="default.show.label" args="[entityName]" />
      </h1>

      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>

      <ol class="property-list user">
        <g:if test="${userInstance?.name}">
          <li class="fieldcontain">
            <span id="name-label" class="property-label">
              <g:message code="user.name.label" default="Name" />
            </span>
            <span class="property-value" aria-labelledby="name-label">
              <g:fieldValue bean="${userInstance}" field="name"/>
            </span>
          </li>
        </g:if>

        <g:if test="${userInstance?.bornDate}">
          <li class="fieldcontain">
            <span id="bornDate-label" class="property-label">
              <g:message code="user.bornDate.label" default="Born Date" />
            </span>
            <span class="property-value" aria-labelledby="bornDate-label">
              <g:formatDate date="${userInstance?.bornDate}" />
            </span>
          </li>
        </g:if>

        <g:if test="${userInstance?.preferedDrinks}">
          <li class="fieldcontain">
            <span id="preferedDrinks-label" class="property-label">
              <g:message code="user.preferedDrinks.label" default="Prefered Drinks" />
            </span>
            <g:each in="${userInstance.preferedDrinks}" var="p">
              <span class="property-value" aria-labelledby="preferedDrinks-label">
                <g:link controller="drink" action="show" id="${p.id}">
                  ${p?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>
          </li>
        </g:if>

        <g:if test="${userInstance?.preferedMusicStyles}">
          <li class="fieldcontain">
            <span id="preferedMusicStyles-label" class="property-label">
              <g:message code="user.preferedMusicStyles.label" default="Prefered Music Styles" />
            </span>
            <g:each in="${userInstance.preferedMusicStyles}" var="p">
              <span class="property-value" aria-labelledby="preferedMusicStyles-label">
                <g:link controller="bar" action="musicStyle" id="${p.id}">
                  ${p?.encodeAsHTML()}
                </g:link>
              </span>
            </g:each>
          </li>
        </g:if>

      </ol>
      <g:form url="[resource:userInstance, action:'delete']" method="DELETE">
        <fieldset class="buttons">
          <g:link class="edit" action="edit" resource="${userInstance}">
            <g:message code="default.button.edit.label" default="Edit" />
          </g:link>
          <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
