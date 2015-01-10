
<%@ page import="com.partytime.Component"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'component.label', default: 'Component')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-component" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-component" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list component">

			<g:if test="${componentInstance?.ingredient}">
				<li class="fieldcontain"><span id="ingredient-label"
					class="property-label"><g:message
							code="component.ingredient.label" default="Ingredient" /></span> <span
					class="property-value" aria-labelledby="ingredient-label"><g:link
							controller="ingredient" action="show"
							id="${componentInstance?.ingredient?.id}">
							${componentInstance?.ingredient?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

			<g:if test="${componentInstance?.amount}">
				<li class="fieldcontain"><span id="amount-label"
					class="property-label"><g:message
							code="component.amount.label" default="Amount" /></span> <span
					class="property-value" aria-labelledby="amount-label"><g:fieldValue
							bean="${componentInstance}" field="amount" /></span></li>
			</g:if>

		</ol>
		<g:form url="[resource:componentInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${componentInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
