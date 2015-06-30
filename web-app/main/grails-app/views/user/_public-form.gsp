<%@ page import="com.partytime.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'displayName', 'error')} ">
  <label for="displayName" style="font-weight: bold;color:black">
    <g:message code="bar.displayName.label" default="Display Name" />
  </label>
  <g:textField name="displayName" value="${userInstance?.displayName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'bornDate', 'error')} ">
  <label for="bornDate" style="font-weight: bold;color:black">
    <g:message code="user.bornDate.label" default="Born Date" />
  </label>
  <input disabled="disabled" type="text" name="bornDate" value="${userInstance?.bornDate.toString().substring(0,10)}">
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} required">
  <label for="name" style="font-weight: bold;color:black">
    <g:message code="user.name.label" default="Mail" />
    <span class="required-indicator">*</span>
  </label>
  <g:field type="email" name="mail" required="true" value="${userInstance?.mail}" style="width:400px"/>
</div>
