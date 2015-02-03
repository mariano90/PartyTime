
<%@ page import="com.partytime.Party"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="empty">
<title>Signup</title>
</head>
<body>
<h1>Signup</h1>
<g:if test="${flash.authenticationFailure}">
	Login failed: ${message(code:"authentication.failure."+flash.authenticationFailure.result).encodeAsHTML()}
</g:if>
<auth:form
	authAction="signup"
	success="[controller:'home', action:'index']"
	error="[controller:'home', action:'signup']">

    User:
    <g:textField
    	name="login"
    	value="${flash.signupForm?.login?.encodeAsHTML()}"/>
    <g:hasErrors
		bean="${flash.signupFormErrors}"
		field="login">
		Invalid username, 6 to 40 chars.
	</g:hasErrors>
    <br/>
    
	Email:
	<g:textField
	    name="email"
	    value="${flash.signupForm?.email?.encodeAsHTML()}"/>
	<g:hasErrors
		bean="${flash.signupFormErrors}"
		field="email">
		Invalid email.
	</g:hasErrors>
	<br/>
    
    Password:
    <input
    	type="password"
    	name="password"/>
    <g:hasErrors
		bean="${flash.signupFormErrors}"
		field="password">
		Invalid password, 6 to 40 chars.
	</g:hasErrors>
    <br/>
    	
    Confirm Password:
    <input
    	type="password"
    	name="passwordConfirm"/>
	<g:hasErrors
		bean="${flash.signupFormErrors}"
		field="passwordConfirm">
		Password mismatch.
	</g:hasErrors>
	<br/>

    <input
    	type="submit"
    	value="Create account"/>
</auth:form>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>
