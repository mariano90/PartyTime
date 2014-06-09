<%@ page import="com.partytime.Drink" %>



<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'components', 'error')} ">
	<label for="components">
		<g:message code="drink.components.label" default="Components" />
		
	</label>
	<g:select name="components" from="${com.partytime.Component.list()}" multiple="multiple" optionKey="id" size="5" value="${drinkInstance?.components*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="drink.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${drinkInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: drinkInstance, field: 'preparation', 'error')} required">
	<label for="preparation">
		<g:message code="drink.preparation.label" default="Preparation" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="preparation" required="" value="${drinkInstance?.preparation}"/>

</div>

