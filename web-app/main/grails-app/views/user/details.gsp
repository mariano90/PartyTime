
<%@ page import="com.partytime.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
      <g:fieldValue bean="${userInstance}" field="name"/>
    </title>
  </head>
  <body>
    <div id="show-user" class="content scaffold-show" role="main">
      <h1>
        <g:if test="${userInstance?.name}">
          <g:fieldValue bean="${userInstance}" field="name"/>
        </g:if>
      </h1>
      <h1>
        <img src="${resource(dir: 'images/profile/big', file: userInstance?.getProfilePicture())}"
          alt="Profile" />
      </h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <ol class="property-list user">
        <g:if test="${userInstance?.bornDate}">
          <li class="fieldcontain">
            <span id="bornDate-label" class="property-label">
              <g:message code="user.bornDate.label" default="Born Date" />
            </span>
            <span class="property-value" aria-labelledby="bornDate-label">
              <g:formatDate format="yyyy-MM-dd" date="${userInstance?.bornDate}" />
            </span>
          </li>
        </g:if>
        <g:if test="${userInstance?.preferedDrinks}">
          <li class="fieldcontain">
            <span id="preferedDrinks-label" class="property-label">
              <g:message code="user.preferedDrinks.label" default="Prefered Drinks" />
            </span>
            <g:each in="${userInstance.preferedDrinks.sort {it.name} }" var="d">
              <span class="property-value" aria-labelledby="preferedDrinks-label">
                <g:link controller="drink" action="details" id="${d.id}">
                  ${d?.encodeAsHTML()}
                </g:link>
                &nbsp;
              </span>
            </g:each>
          </li>
        </g:if>
        <g:if test="${userInstance?.preferedMusicStyles}">
          <li class="fieldcontain">
            <span id="preferedMusicStyles-label" class="property-label">
              <g:message code="user.preferedMusicStyles.label" default="Prefered Music Styles" />
            </span>
            <g:each in="${userInstance.preferedMusicStyles.sort {it.name} }" var="ms">
              <span class="property-value" aria-labelledby="preferedMusicStyles-label">
                <g:link controller="bar" action="musicStyle" id="${ms.id}">
                  ${ms.encodeAsHTML()}
                </g:link>
                &nbsp;
              </span>
            </g:each>
          </li>
        </g:if>
        <g:if test="${userInstance?.favoriteBars.sort {it.name} }">
          <li class="fieldcontain">
            Favorite bars:
            <g:each in="${userInstance.favoriteBars}" var="b">
              <span class="property-value">
                <g:link controller="bar" action="details" id="${b.id}">
                  ${b.encodeAsHTML()}
                </g:link>
                &nbsp;
              </span>
            </g:each>
          </li>
        </g:if>
      </ol>
    </div>
  </body>
</html>
