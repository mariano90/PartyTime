
<%@ page import="com.partytime.Review" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
  </head>
    <body>
      <div id="show-review" class="content scaffold-show" role="main"  style="font-weight: bold;color:black;">
        <h2><strong>
          <g:if test="${reviewInstance?.title}">
            <g:fieldValue bean="${reviewInstance}" field="title"/>
          </g:if>
          </strong>
        </h2>

        <h1>
          <g:if test="${reviewInstance?.score}">
            <span class="property-value" aria-labelledby="score-label">
              <img src="${resource(dir: 'images', file:reviewInstance.getImg())}"
                alt="Score" />
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
		&nbsp;
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
          <p>&nbsp;</p><p>&nbsp;</p>
          <div style="margin-top:20px;">
          <g:if test="${params.bar}">
            &nbsp;
            <g:link 
              controller="bar"
              action="details"
              id="${params.bar.toInteger()}">
              Back to Bar
            </g:link>
          </g:if>
          </div>
        </ol>
      </div>
    </body>
</html>
