<%@ page import="com.partytime.Component" %>



<div class="fieldcontain ${hasErrors(bean: componentInstance, field: 'ingredient', 'error')} required">
	<label for="ingredient">
		<g:message code="component.ingredient.label" default="Ingredient" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ingredient" name="ingredient.id" from="${com.partytime.Ingredient.list()}" optionKey="id" required="" value="${componentInstance?.ingredient?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: componentInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="component.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="amount" required="" value="${componentInstance?.amount}"/>

</div>

