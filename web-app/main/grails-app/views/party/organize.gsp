<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'party.label', default: 'Party')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div id="create-party" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${partyInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${partyInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form controller="party" action="organizeNew">
			<fieldset class="form">
				<label>Title:</label>
				<g:textField name="partyTitle" />
				<br /> <label>Description:</label>
				<g:textField name="partyDescription" />
				<br /> <label>Place: </label>
				<br/>TODO: fill this with autocomplete places<br/><br/>
				<g:textField name="partyPlace" />
				<br /> <label>Starts at: </label>
				<g:datePicker name="partyStart" value="${new Date()}"
					precision="day" years="[2015, 2016, 2017, 2018]" />
				<br /> <label>Until: </label>
				<g:datePicker name="partyEnd" value="${new Date()}"
					precision="day" years="[2015, 2016, 2017, 2018]" />
				<br />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
