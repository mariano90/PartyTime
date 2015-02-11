<%@ page import="com.partytime.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
  </head>
  <body>
    <div id="edit-user" style="height: 800px" role="main">
      <h2>
        <strong>
          My Profile
        </strong>
      </h2>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <g:hasErrors bean="${userInstance}">
        <ul class="errors" role="alert">
          <g:eachError bean="${userInstance}" var="error">
            <li 
            <g:if test="${error in org.springframework.validation.FieldError}">
              data-field-id="${error.field}"
            </g:if>
          >
          <g:message error="${error}"/>
        </li>
      </g:eachError>
    </ul>
  </g:hasErrors>
  <g:form url="[resource:userInstance, action:'update']" method="PUT" >
    <g:hiddenField name="version" value="${userInstance?.version}" />
    <fieldset class="form">
      <g:render template="public-form"/>
    </fieldset>
    <fieldset class="buttons">
      <g:actionSubmit  class="button" style="margin-top: 30px;" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </fieldset>
  </g:form>
</div>
</body>
</html>