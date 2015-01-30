
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
	      error="[controller:'home', action:'loginError']">
    	User: <g:textField name="login"/><br/>
    	Password: <input type="password" name="password"/><br/>
    	<input type="submit" value="Log in"/>
	</auth:form>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>
