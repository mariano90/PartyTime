
<%@ page import="com.partytime.Review" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
    <title>
      ${entityName}
    </title>
  </head>
    <body>
      <div id="show-review" class="content scaffold-show" role="main">
        <h1>
          <g:if test="${reviewInstance?.title}">
            <g:fieldValue bean="${reviewInstance}" field="title"/>
          </g:if>
        </h1>

        <h1>
          <g:if test="${reviewInstance?.score}">
            <span class="property-value" aria-labelledby="score-label">
              <g:fieldValue bean="${reviewInstance}" field="score"/>
            </span>
          </g:if>
        </h1>

        <ol class="property-list review">
          <g:if test="${reviewInstance?.body}">
            <li class="fieldcontain">
              <span class="property-value" aria-labelledby="body-label">
                <g:fieldValue bean="${reviewInstance}" field="body"/>
              </span>
            </li>
          </g:if>

          <g:if test="${reviewInstance?.author}">
            <li class="fieldcontain">
              <span id="author-label" class="property-label">
                <g:message code="review.author.label" default="By" />
              </span>
              <span class="property-value" aria-labelledby="author-label">
                <g:link controller="user" action="details" id="${reviewInstance?.author?.id}">
                  ${reviewInstance?.author?.encodeAsHTML()}
                </g:link>
              </span>
            </li>
          </g:if>
        </ol>
      </div>
    </body>
</html>
