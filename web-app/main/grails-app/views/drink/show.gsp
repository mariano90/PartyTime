
<%@ page import="com.partytime.Drink" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'drink.label', default: 'Drink')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-drink" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-drink" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list drink">
			
				<g:if test="${drinkInstance?.components}">
				<li class="fieldcontain">
					<span id="components-label" class="property-label"><g:message code="drink.components.label" default="Components" /></span>
					
						<g:each in="${drinkInstance.components}" var="c">
						<span class="property-value" aria-labelledby="components-label"><g:link controller="component" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="drink.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${drinkInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${drinkInstance?.preparation}">
				<li class="fieldcontain">
					<span id="preparation-label" class="property-label"><g:message code="drink.preparation.label" default="Preparation" /></span>
					
						<span class="property-value" aria-labelledby="preparation-label"><g:fieldValue bean="${drinkInstance}" field="preparation"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:drinkInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${drinkInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
