
<%@ page import="com.partytime.Party"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="empty">
<title>Login</title>
</head>
<body>
	<h1>
		Login
	</h1>
	<g:if test="${flash.authenticationFailure}">
	Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
	</g:if>
	<auth:form authAction="login"
	      success="[controller:'home', action:'index']"
	      error="[controller:'home', action:'login']">
	    <table>
	      <tr>
	        <td width="100px">User:</td>
	        <td>
	          <g:textField name="login"/>
    	      <g:hasErrors
		        bean="${flash.loginFormErrors}"
                field="login">
			Invalid user.
		</g:hasErrors></td>
	      </tr>
	      <tr>
	        <td width="100px">Password:</td>
	        <td><input type="password" name="password"/>
    	<g:hasErrors
			bean="${flash.loginFormErrors}"
			field="password">
			Invalid password.
		</g:hasErrors></td>
	      </tr>
	    </table>
		<input type="submit" value="Log in" class="button" style="margin-left: 200px;"/>
	</auth:form>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>
