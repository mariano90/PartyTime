<%@ page import="com.partytime.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="ingredient.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: ingredientInstance, field: 'price')}" required=""/>

</div>

