<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="home">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
	</head>
	<body>
		<div id="create-review" class="content scaffold-create" role="main">
			<h2><strong>Create Review</strong></h2>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reviewInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reviewInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reviewInstance, action:'addGo']" >
				<fieldset class="form">
					<g:render template="formpublic"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton
					    name="create"
					    class="button scrolly"
					    style="margin-left: 80%;"
					    value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
